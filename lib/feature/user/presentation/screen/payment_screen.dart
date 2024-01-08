import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:masterpie/util/core/constant/subscription_constants.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import 'package:masterpie/util/design/toast/app_toast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../foods/presentation/screen/ui_helper/custom_radio_button.dart';
import '../../domain/model/user_subscription_plan_model.dart';


class PaymentScreen extends StatefulWidget {


  final UserSubscriptionPlan userSubscriptionPlan;

  const PaymentScreen({super.key, required this.userSubscriptionPlan});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  List<String> _planTypeOptions= [];

  String _selectedPlanType= '';

  double _amount = 0;

  bool _isFree = false;

  @override
  void initState() {
    super.initState();
    checkPlan();
    initPlanTypeOptions();
  }


  void checkPlan(){
    if(widget.userSubscriptionPlan.plan == FREE_PLAN){
      _isFree = true;
    }else{
      _isFree = false;
    }
  }


  void initPlanTypeOptions(){
      if(widget.userSubscriptionPlan.plan == BASIC_PLAN){
        _planTypeOptions= ['${MONTHLY_PLAN_LABEL.capitalize()}-$BASIC_PRICE_MONTHLY', '${ANNUAL_PLAN_LABEL.capitalize()}-${BASIC_PRICE_ANNUAL_MONTHLY * 12}'];
        _selectedPlanType = '${MONTHLY_PLAN_LABEL.capitalize()}-$BASIC_PRICE_MONTHLY';
        _amount= BASIC_PRICE_MONTHLY;
      }else if(widget.userSubscriptionPlan.plan == PREMIUM_PLAN){
        _planTypeOptions= ['${MONTHLY_PLAN_LABEL.capitalize()}-$PREMIUM_PRICE_MONTHLY', '${ANNUAL_PLAN_LABEL.capitalize()}-${PREMIUM_PRICE_ANNUAL_MONTHLY * 12}'];
        _selectedPlanType = '${MONTHLY_PLAN_LABEL.capitalize()}-$PREMIUM_PRICE_MONTHLY';
        _amount= PREMIUM_PRICE_MONTHLY;
      }
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      Visibility(
                        visible: _isFree,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [

                              const SizedBox(height: 8,),


                              const Text(
                                  FREE_PLAN_SWITCH_MSG,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: DARK_PRIMARY_COLOR,
                                ),
                              ),

                              const SizedBox(height: 32,),


                              cancelButton(),
                            ],
                          )
                      ),


                      Visibility(
                        visible: !_isFree,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomRadioListTile(
                                options: _planTypeOptions,
                                onSelectedOptionChanged: updateSelectedPlanType,
                                selectedOption: _selectedPlanType,
                                orientation: VERTICAL_ORIENTATION,
                                isEditable: true,
                              ),

                              const SizedBox(height: 48,),



                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget.userSubscriptionPlan.plan.capitalize()} $PLAN_LABEL',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: DARK_PRIMARY_COLOR,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),

                                    Text(
                                      '$TOTAL_PRICE_LABEL: $_amount',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: DARK_PRIMARY_COLOR,
                                          fontWeight: FontWeight.w600

                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 32,),


                              buildPayButton(context),
                            ],
                          )
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



  Widget cancelButton(){
    return  ElevatedButton(
      onPressed: () {
        //todo cancel
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: DARK_PRIMARY_COLOR
      ),
      child:  const Padding(
          padding: EdgeInsets.all(12),
          child: Text(YES_LABEL, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
      ),
    );
  }


  void updateSelectedPlanType(String type){
    setState(() {
      _selectedPlanType= type;
      if(widget.userSubscriptionPlan.plan.toLowerCase().contains(BASIC_PLAN.toLowerCase())){
        if(type.toLowerCase().contains(MONTHLY_PLAN_LABEL.toLowerCase())){
          _amount= BASIC_PRICE_MONTHLY;
        }else if(type.toLowerCase().contains(ANNUAL_PLAN_LABEL.toLowerCase())){
          _amount= BASIC_PRICE_ANNUAL_MONTHLY * 12;
        }
      }else if(widget.userSubscriptionPlan.plan.toLowerCase().contains(PREMIUM_PLAN.toLowerCase())){
        if(type.toLowerCase().contains(MONTHLY_PLAN_LABEL.toLowerCase())){
          _amount= PREMIUM_PRICE_MONTHLY;
        }else if(type.toLowerCase().contains(ANNUAL_PLAN_LABEL.toLowerCase())){
          _amount= PREMIUM_PRICE_ANNUAL_MONTHLY * 12;
        }
      }
    });
  }



  Widget buildPayButton(BuildContext context){
    return ElevatedButton(
      onPressed: (){
        payButtonClickListener(context);
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


  void payButtonClickListener(BuildContext context) async{
    final initResponse= await initPaymentSheet();
    if(initResponse){
      final confirmResponse= await confirmPayment();
      if(confirmResponse){
        if(context.mounted){
          showSuccessToast(context, PAYMENT_SUCCEED_MSG);
        }
      }else{
        if(context.mounted){
          showErrorToast(context, PAYMENT_CENCELLED_MSG);
        }
      }
    }else{
      if(context.mounted){
        showErrorToast(context, ERROR_TRY_AGAIN);
      }
    }
  }






  Future<bool> initPaymentSheet() async {
    try {

      final data = await _createPaymentIntent();

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: data.data.toString(),
          merchantDisplayName: MASTERPIE_NAME,
          primaryButtonLabel: '$PAY_LABEL $_amount',
          applePay: const PaymentSheetApplePay(
            buttonType: PlatformButtonType.buy,
            merchantCountryCode: 'CA',
          ),
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'CA',
            testEnv: true,
          ),
          style: ThemeMode.light,
          appearance: const PaymentSheetAppearance(
            primaryButton: PaymentSheetPrimaryButtonAppearance(
              shapes: PaymentSheetPrimaryButtonShape(blurRadius: 8),
              colors: PaymentSheetPrimaryButtonTheme(
                light: PaymentSheetPrimaryButtonThemeColors(
                  background: DARK_PRIMARY_COLOR,
                  text: Colors.white,
                  border: DARK_PRIMARY_COLOR,
                ),
              ),
            ),
          ),
          // billingDetails: billingDetails,
        ),
      );
      return true;
    } catch (e) {
      print('error_stripe_init: $e');
      return false;
    }
  }

  Future<bool> confirmPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      return true;
    } on Exception catch (e) {
      print('error_stripe_confirm: $e');
      return false;
    }
  }

  Future<FunctionResponse> _createPaymentIntent() async {
    final response = await Supabase.instance.client.functions
        .invoke('create_payment_intent', body: {
      'orderId': widget.userSubscriptionPlan.userId,
      'amount': _amount,
    });
    return response;
  }





}








