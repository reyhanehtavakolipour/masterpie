
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:masterpie/util/core/constant/subscription_constants.dart';
import 'package:masterpie/util/core/helper/print.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import 'package:masterpie/util/design/toast/app_toast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/core/helper/request_api.dart';
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

  @override
  void initState() {
    super.initState();
    initPlanTypeOptions();
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

                      Column(
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
                    ],
                  ),
                ),

              ],
            )
        ),
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
    final _customer = await _createCustomer();
    final _paymentIntent = await _createPaymentIntents();
    await _createCreditCard(_customer['id'], _paymentIntent['client_secret']);
    final _paymentMethod = await _getPaymentMethods(_paymentIntent['id']);
    await _attachPaymentMethod(_paymentMethod['payment_method'], _customer['id']);
    await _updateCustomer(_paymentMethod['payment_method'], _customer['id']);
    await _createScheduleSubscriptions(_customer['id']);
  }



  Future<FunctionResponse> _createSubscription(String customerId) async {
    final response = await Supabase.instance.client.functions
        .invoke('create_subscription', body: {
      'customer': customerId,
    });
    return response;
  }

  Future<Map<String, dynamic>> _createPaymentIntents() async {
    const String url = 'https://api.stripe.com/v1/payment_intents';
    final NetworkRequest request = await NetworkRequest.createStripe();
    Map<String, dynamic> body = {
      //todo
      'amount': 999,
      'currency': 'usd',
      'payment_method_types[]': 'card',
      'setup_future_usage' : 'off_session'
    };

    final response= await request.post(url, data: body);
    final data = await response.data;
    return data;
  }


  Future<Map<String, dynamic>> _getPaymentMethods(String paymentIntentId) async {
    final String url = 'https://api.stripe.com/v1/payment_intents/$paymentIntentId';
    final NetworkRequest request = await NetworkRequest.createStripe();
    final response= await request.post(url);
    final data = await response.data;
    return data;
  }


  Future<void> _createCreditCard(String customerId, String paymentIntentClientSecret) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          customerId: customerId,
          paymentIntentClientSecret: paymentIntentClientSecret,
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
        ));

    await Stripe.instance.presentPaymentSheet();
  }

  Future<Map<String, dynamic>> _updateCustomer(
      String paymentMethodId, String customerId) async {
    final String url = 'https://api.stripe.com/v1/customers/$customerId';
    final NetworkRequest request = await NetworkRequest.createStripe();
    final response= await request.post(url, data:{
      'invoice_settings[default_payment_method]': paymentMethodId,
    });
    final data = await response.data;
    return data;
  }

  Future<Map<String, dynamic>> _attachPaymentMethod(String paymentMethodId, String customerId) async {
    final String url = 'https://api.stripe.com/v1/payment_methods/$paymentMethodId/attach';
    final NetworkRequest request = await NetworkRequest.createStripe();
    final response= await request.post(url, data:{
      'customer': customerId,
    });
    final data = await response.data;
    return data;
  }

  Future<Map<String, dynamic>> _createCustomer() async {
    const String url = 'https://api.stripe.com/v1/customers';
    final NetworkRequest request = await NetworkRequest.createStripe();
    final response= await request.post(url, data:{
    'description': widget.userSubscriptionPlan.userId
    });
    final data = await response.data;
    return data;
  }

  Future<Map<String, dynamic>> _createSubscriptions(String customerId) async {
    const String url = 'https://api.stripe.com/v1/subscriptions';
    final NetworkRequest request = await NetworkRequest.createStripe();
    final response= await request.post(url, data:{
      'customer': customerId,
      //todo
      'items[0][price]': 'price_1OWUlOFawMQyAsivJcIc5vB3',
      'payment_behavior': 'default_incomplete',
    });
    final data = await response.data;
    return data;
  }


  Future<Map<String, dynamic>> _createScheduleSubscriptions(String customerId) async {


    print('show_cus: $customerId');

    const String url = 'https://api.stripe.com/v1/subscription_schedules';
    final NetworkRequest request = await NetworkRequest.createStripe();
    final response= await request.post(url, data:{
      'customer': customerId,
      'start_date': 'now',
      'phases': [
        {
          //todo
          "items": [{"price": "price_1OWUlOFawMQyAsivJcIc5vB3", "quantity": 1}],
        }
      ],
    });
    final data = await response.data;
    return data;
  }




}








