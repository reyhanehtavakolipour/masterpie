import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:masterpie/util/design/toast/app_toast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../example_scaffold.dart';
import '../../../../util/core/constant/api_constant.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/core/helper/request_api.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../domain/model/user_subscription_plan_model.dart';


class PaymentScreen extends StatefulWidget {


  final UserSubscriptionPlan userSubscriptionPlan;

  const PaymentScreen({super.key, required this.userSubscriptionPlan});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  int step = 0;
  final ControlsWidgetBuilder emptyControlBuilder = (_, __) => Container();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: MaterialApp(
        theme: ThemeData(fontFamily: MONTSERRAT_FONT),
        home: Scaffold(
            appBar: AppBar(
              title: const Text(PAYMENT_LABEL, style: TextStyle(color: Colors.white,),),
              backgroundColor: PRIMARY_COLOR,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              actions: [

              ],
            ),
            body: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  // child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.stretch,
                  //   children: [
                  //
                  //     const Text('$CARD_INFORMATION_LABEL:', style: TextStyle(fontSize: 18, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),
                  //
                  //     const SizedBox(height: 16,),
                  //
                  //     buildPayButton(),
                  //
                  //   ],
                  // ),
                  child:
                  ExampleScaffold(
                    title: 'Payment Sheet',
                    tags: ['Single Step'],
                    children: [
                      Stepper(
                        controlsBuilder: emptyControlBuilder,
                        currentStep: step,
                        steps: [
                          Step(
                            title: Text('Init payment'),
                            content: ElevatedButton(
                              onPressed: initPaymentSheet,
                              child: Text('Init payment sheet'),
                            ),
                          ),
                          Step(
                            title: Text('Confirm payment'),
                            content: ElevatedButton(
                              onPressed: confirmPayment,
                              child: Text('Pay now'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            )
        ),
      ),
    );
  }



  Widget buildPayButton(){
    return ElevatedButton(
      onPressed: (){
        payButtonClickListener();
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: DARK_PRIMARY_COLOR
      ),
      child: const Padding(
          padding: EdgeInsets.all(12),
          child: Text(PAY_LABEL, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
      ),
    );
  }


  Future<void> payButtonClickListener() async{
    await initPaymentSheet();
    await confirmPayment();
  }






  Future<void> initPaymentSheet() async {
    try {

      final data = await _createPaymentIntent('e4fbc1dd-6c45-478b-927d-fb740b5843e1', 10);

      final billingDetails = BillingDetails(
        name: 'Flutter Stripe',
        email: 'email@stripe.com',
        phone: '+48888000888',
        address: Address(
          city: 'Houston',
          country: 'US',
          line1: '1459  Circle Drive',
          line2: '',
          state: 'Texas',
          postalCode: '77063',
        ),
      );

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: data.data.toString(),
          merchantDisplayName: 'Flutter Stripe Store Demo',
          primaryButtonLabel: 'Pay now',
          applePay: const PaymentSheetApplePay(
            buttonType: PlatformButtonType.buy,

            merchantCountryCode: 'US',
          ),
          // googlePay: const PaymentSheetGooglePay(
          //   merchantCountryCode: 'US',
          //   testEnv: true,
          // ),
          style: ThemeMode.dark,
          // billingDetails: billingDetails,
        ),
      );
      setState(() {
        step = 1;
      });
    } catch (e) {
      print('error_stripe: $e');
      rethrow;
    }
  }

  Future<void> confirmPayment() async {
    try {
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();

      setState(() {
        step = 0;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Payment succesfully completed'),
        ),
      );
    } on Exception catch (e) {
      if (e is StripeException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error from Stripe: ${e.error.localizedMessage}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unforeseen error: ${e}'),
          ),
        );
      }
    }
  }



  Future<FunctionResponse> _createPaymentIntent(
      String orderId, int amount) async {
    final response = await Supabase.instance.client.functions
        .invoke('create_payment_intent', body: {
      'orderId': orderId,
      'amount': amount,
    });
    return response;
  }



}








