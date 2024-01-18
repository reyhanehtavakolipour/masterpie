
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:masterpie/feature/user/domain/model/subscription_plan_model.dart';
import 'package:masterpie/feature/user/presentation/screen/model/new_plan_info_model.dart';
import 'package:masterpie/util/core/helper/print.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import 'package:masterpie/util/design/toast/app_toast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../util/core/constant/hive_constants.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../foods/presentation/screen/ui_helper/custom_radio_button.dart';
import '../../data/local/datasource/user_hive_keyvalue_datasource.dart';

class PaymentScreen extends StatefulWidget {


  final NewPlanInfo newPlanInfo;

  const PaymentScreen({super.key, required this.newPlanInfo});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  bool _isAutoPaymentOn= true;


  final _userHiveDataSource = serviceLocator<UserHiveDataSource>();

  List<String> _intervalOptions= [];

  String _selectedInterval= '';

  double _amount = 0;


  String _priceId= '';

  @override
  void initState() {
    super.initState();
    initPlanTypeOptions();
  }

  void initPlanTypeOptions(){
    _intervalOptions= ['${MONTHLY_PLAN_LABEL.capitalize()}-${widget.newPlanInfo.subscriptionPlans[0].prices[0]}', '${ANNUAL_PLAN_LABEL.capitalize()}-${widget.newPlanInfo.subscriptionPlans[0].prices[1] * 12}'];
    _selectedInterval = '${MONTHLY_PLAN_LABEL.capitalize()}-${widget.newPlanInfo.subscriptionPlans[0].prices[0]}';
    _amount= widget.newPlanInfo.subscriptionPlans[0].prices[0];
    final subs = widget.newPlanInfo.subscriptionPlans.where((element) => !element.plan.contains('one-time')).toList();
    _priceId= subs[0].ids[0];
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
                            options: _intervalOptions,
                            onSelectedOptionChanged: updateSelectedPlanType,
                            selectedOption: _selectedInterval,
                            orientation: VERTICAL_ORIENTATION,
                            isEditable: true,
                          ),


                          const SizedBox(height: 16,),

                          autPaymentWidget(),


                          const SizedBox(height: 48,),



                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${(widget.newPlanInfo.subscriptionPlans[0].plan.contains(BASIC_LABEL) ? BASIC_LABEL : PREMIUM_LABEL).capitalize()} $PLAN_LABEL',
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


  void updateSelectedPlanType(String interval){
    setState(() {
      _selectedInterval= interval;
      if(interval.toLowerCase().contains(MONTHLY_PLAN_LABEL.toLowerCase())){
        List<SubscriptionPlan> list= [];
        if(_isAutoPaymentOn){
          final basics = widget.newPlanInfo.subscriptionPlans.where((element) => element.plan.contains(BASIC_LABEL)).toList();
          if(basics.isEmpty){
            list = widget.newPlanInfo.subscriptionPlans.where((element) => element.plan == PREMIUM_LABEL).toList();
          }else{
            list = widget.newPlanInfo.subscriptionPlans.where((element) => element.plan == BASIC_LABEL).toList();
          }
          _priceId = list[0].ids[0];
        }else{
          final basics = widget.newPlanInfo.subscriptionPlans.where((element) => element.plan.contains(BASIC_LABEL)).toList();
          if(basics.isEmpty){
            list = widget.newPlanInfo.subscriptionPlans.where((element) => element.plan.contains('one-time')).toList();
          }else{
            list = widget.newPlanInfo.subscriptionPlans.where((element) => element.plan.contains('one-time')).toList();
          }
          _priceId = list[0].ids[0];
        }
        _amount= widget.newPlanInfo.subscriptionPlans[0].prices[0];
      }else if(interval.toLowerCase().contains(ANNUAL_PLAN_LABEL.toLowerCase())){
        List<SubscriptionPlan> list= [];
        if(_isAutoPaymentOn){
          final basics = widget.newPlanInfo.subscriptionPlans.where((element) => element.plan.contains(BASIC_LABEL)).toList();
          if(basics.isEmpty){
            list = widget.newPlanInfo.subscriptionPlans.where((element) => element.plan == PREMIUM_LABEL).toList();
          }else{
            list = widget.newPlanInfo.subscriptionPlans.where((element) => element.plan == BASIC_LABEL).toList();
          }
          _priceId = list[0].ids[1];
        }else{
          final basics = widget.newPlanInfo.subscriptionPlans.where((element) => element.plan.contains(BASIC_LABEL)).toList();
          if(basics.isEmpty){
            list = widget.newPlanInfo.subscriptionPlans.where((element) => element.plan.contains('one-time')).toList();
          }else{
            list = widget.newPlanInfo.subscriptionPlans.where((element) => element.plan.contains('one-time')).toList();
          }
          _priceId = list[0].ids[1];
        }
        _amount= widget.newPlanInfo.subscriptionPlans[0].prices[1] * 12;
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



  Widget autPaymentWidget(){
    return  Visibility(
      // visible: _userSubscriptionPlan.plan != FREE_PLAN,
      visible: true,
      child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              const Text(AUTO_RENEWAL_LABEL, style: TextStyle( color: DARK_PRIMARY_COLOR, fontSize: 14),),
              const SizedBox(width: 8,),
              Switch(
                value: _isAutoPaymentOn,
                activeTrackColor: Colors.green, // Color when switch is ON
                activeColor: DARK_PRIMARY_COLOR, // Thumb color when switch is ON
                inactiveTrackColor: LIGHT_GREY_COLOR, // Color when switch is OFF
                inactiveThumbColor: DARK_PRIMARY_COLOR,

                onChanged: (value) {
                  setState(() {
                    _isAutoPaymentOn = value;
                    updateSelectedPlanType(_selectedInterval);
                  });
                },
              ),
            ],
          )
      ),
    );
  }

  void payButtonClickListener(BuildContext context) async{
    String email = await _userHiveDataSource.getString(KEY_EMAIL);
    String customerId = widget.newPlanInfo.customerId;

    FunctionResponse response;
    if(customerId.isNotEmpty){
       response = await Supabase.instance.client.functions
          .invoke('create_checkout_session', body: {
        'customer_id': customerId,
        'customer_email': '',
        'price_id': _priceId,
        'mode': _isAutoPaymentOn ? 'subscription' : 'payment'
      });
    }else{
      response = await Supabase.instance.client.functions
          .invoke('create_checkout_session', body: {
        'customer_id': '',
        'customer_email': email,
        'price_id': _priceId,
        'mode': _isAutoPaymentOn ? 'subscription' : 'payment'
      });
    }

    if(response.status == 200){
      final Uri url = Uri.parse('${response.data['url']}');
      await launchUrl(url);

      if(mounted){
        Navigator.pop(context);
      }
    }else{
      if(mounted){
        showErrorToast(context, ERROR_TRY_AGAIN);
      }
    }

  }
}








