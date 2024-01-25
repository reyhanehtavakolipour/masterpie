
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl/intl.dart';
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
import '../../../../util/design/size/app_widget_size.dart';
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


  bool _payBtnEnabled = true;

  String _priceId= '';

  bool _loaderVisible= false;


  @override
  void initState() {
    super.initState();
    initPlanTypeOptions();
    handlePayButtonState();
  }

  void initPlanTypeOptions(){
    _intervalOptions= [(MONTHLY_PLAN_LABEL.capitalize()), (ANNUAL_PLAN_LABEL.capitalize())];
    _selectedInterval = MONTHLY_PLAN_LABEL.capitalize();
    _amount= widget.newPlanInfo.subscriptionPlans[0].prices[0];
    final subs = widget.newPlanInfo.subscriptionPlans.where((element) => !element.plan.contains('one-time')).toList();
    _priceId= subs[0].ids[0];
  }

  void handlePayButtonState(){
    if(widget.newPlanInfo.currentPlanName != FREE_LABEL &&  widget.newPlanInfo.currentPlanName != DIETITIAN_LABEL
        && widget.newPlanInfo.customerId.isNotEmpty && widget.newPlanInfo.updatedAt.isNotEmpty && widget.newPlanInfo.cancelAtPeriodEnd){
      int millisecondsSinceEpoch = 0;
      DateTime updatedAtDate = DateTime(millisecondsSinceEpoch);
      millisecondsSinceEpoch = int.parse(widget.newPlanInfo.updatedAt) * 1000;
      updatedAtDate= DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
      // todo update with calculated date
      DateTime endsAtDate= updatedAtDate.add(Duration(days: widget.newPlanInfo.interval == 'monthly' ? 30 : 365));
      DateTime now = DateTime.now();
      if(!endsAtDate.isBefore(now)){
        // disable pay button
        setState(() {
          _payBtnEnabled = false;
        });
      }
    }
  }

  Future<void> _showOptionsForChangingSubscription(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // User must tap a button to close the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(PAYMENT_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 18, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(USER_OPTIONS_FOR_SUBSCRIBED_USERS_DIALOG, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 14, color: DARK_PRIMARY_COLOR)),
              ],
            ),
          ),
          actions: <Widget>[

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  child: const Text(UPDATE_SUBSCRIPTION_RIGHT_AWAY_MSG, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 13, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.of(context).pop();
                    pay();
                  },
                ),
                TextButton(
                  child: const Text(CANCEL_AUTO_RENEWAL_SUBSCRIPTION_MSG, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 13, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.of(context).pop();
                    cancelAutoRenewal();
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }


  Future<void> _showErrorForPaymentRequest(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // User must tap a button to close the dialog
      builder: (BuildContext context) {
        return SizedBox(
          width: double.infinity,
          child: AlertDialog(
            title: const Text(PAYMENT_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 18, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(ALREADY_ON_PAYMENT_MSG, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 14, color: DARK_PRIMARY_COLOR)),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok', style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 13, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          ),
        );
      },
    );
  }



  void cancelAutoRenewal() async{

    setState(() {
      _loaderVisible = true;
    });
    final userHiveDataSource = serviceLocator<UserHiveDataSource>();
    String supabaseId = await userHiveDataSource.getString(KEY_USER_ID);
    final response = await Supabase.instance.client.functions
        .invoke('cancel_subscription', body: {
      'sub_id': widget.newPlanInfo.subscriptionId,
      'supabase_id': supabaseId
    });

    if(response.status == 200){
      if(mounted){
        setState(() {
          _loaderVisible = false;
        });
        showSuccessToast(context, CANCEL_SUBSCRIPTION_SUCCESS_MSG);
        Navigator.pop(context);
      }
    }else{
      if(mounted){
        setState(() {
          _loaderVisible = false;
        });
        showErrorToast(context, CANCEL_SUBSCRIPTION_FAILED_MSG);
      }
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
                  color: LIGHT_GREY_COLOR,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [


                      const SizedBox(height: 12,),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(widget.newPlanInfo.subscriptionPlans[0].plan == BASIC_LABEL ? MEASURE_PATH : ACCURACY_PATH,
                          width: 60, height: 60, color: widget.newPlanInfo.subscriptionPlans[0].plan == BASIC_LABEL ? MASTERPIE_ORANGE_COLOR : GREEN_COLOR,)
                      ),


                      //plan name
                      Text(
                        '${widget.newPlanInfo.subscriptionPlans[0].plan.capitalize()} $PLAN_LABEL',
                        style: const TextStyle(
                            fontSize: 36,
                            color: DARK_PRIMARY_COLOR,
                        ),
                      ),



                      const SizedBox(height: 4,),


                      // description
                      Text(
                        (widget.newPlanInfo.subscriptionPlans[0].plan == BASIC_LABEL ? BASIC_GREAT_FOR_INFO : PREMIUM_GREAT_FOR_INFO).capitalize(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey,
                        ),
                      ),


                      const SizedBox(height: 16,),


                      //price-auto payment checkbox - interval
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(BORDER_RADIUS,),
                          color: Colors.white,
                          border: Border.all(
                            color: DARK_PRIMARY_COLOR,
                          ),
                        ),
                        child: Column(
                          children: [

                            CustomRadioListTile(
                              options: _intervalOptions,
                              onSelectedOptionChanged: updateSelectedPlanType,
                              selectedOption: _selectedInterval,
                              orientation: HORIZONTAL_ORIENTATION,
                              isEditable: true,
                            ),


                            const SizedBox(height: 24,),

                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: _isAutoPaymentOn,
                                        activeColor: DARK_PRIMARY_COLOR,
                                        checkColor: Colors.white,
                                        onChanged: (value) {
                                          setState(() {
                                            _isAutoPaymentOn = value ?? false;
                                            updateSelectedPlanType(_selectedInterval);
                                          });
                                        },
                                      ),
                                      const Text(AUTO_RENEWAL_LABEL, style: TextStyle(fontSize: 13),),
                                    ],
                                  ),
                                ),

                                Expanded(
                                  child: Text(
                                    '$_amount \$',
                                    style: const TextStyle(
                                      fontSize: 56,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),




                      const SizedBox(height: 36,),


                      const Text(
                        '$FEATURES_LABEL:',
                        style: TextStyle(
                          fontSize: 20,
                          color: MACRO_COLOR,
                          fontWeight: FontWeight.w400
                        ),
                      ),


                      const SizedBox(height: 16,),


                      //macro tracking
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 14.0),
                                    child: Icon(
                                      Icons.circle,
                                      size: 8,
                                      color: DARK_PRIMARY_COLOR, // Set the color of the dot icon
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: MACRO_TRACKING_ACCESS,
                                  style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),
                                ),
                              ],
                            ),
                          ),


                          const SizedBox(width: 8,),

                          const Icon(Icons.check, color: DARK_PRIMARY_COLOR, size: 18,)

                        ],
                      ),


                      //usda nutrition access
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 14.0),
                                    child: Icon(
                                      Icons.circle,
                                      size: 8,
                                      color: DARK_PRIMARY_COLOR, // Set the color of the dot icon
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: USDA_NUTRITION_ACCESS,
                                  style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),
                                ),
                              ],
                            ),
                          ),


                          const SizedBox(width: 8,),

                          const Icon(Icons.check, color: DARK_PRIMARY_COLOR, size: 18,)

                        ],
                      ),



                      //favorite food access
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          RichText(
                            text: const TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 14.0),
                                    child: Icon(
                                      Icons.circle,
                                      size: 8,
                                      color: DARK_PRIMARY_COLOR, // Set the color of the dot icon
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: '$FAVORITE_FOOD_ACCESS:',
                                  style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 8,),

                          const Text(
                            UNLIMITED_LABEL,
                            style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),
                          ),

                        ],
                      ),

                      //food portion
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          RichText(
                            text: const TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 14.0),
                                    child: Icon(
                                      Icons.circle,
                                      size: 8,
                                      color: DARK_PRIMARY_COLOR, // Set the color of the dot icon
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: '$FOOD_PORTION_ACCESS:',
                                  style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 8,),

                          Text(
                            widget.newPlanInfo.subscriptionPlans[0].foodPortionRequestsLimit.toString(),
                            style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),
                          ),

                        ],
                      ),


                      //suggest food
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          RichText(
                            text: const TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 14.0),
                                    child: Icon(
                                      Icons.circle,
                                      size: 8,
                                      color: DARK_PRIMARY_COLOR, // Set the color of the dot icon
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: '$SUGGEST_FOOD_ACCESS:',
                                  style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 8,),

                          Text(
                            widget.newPlanInfo.subscriptionPlans[0].suggestFoodRequestsLimit.toString(),
                            style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),
                          ),

                        ],
                      ),


                      //macro adjustment
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          RichText(
                            text: const TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 14.0),
                                    child: Icon(
                                      Icons.circle,
                                      size: 8,
                                      color: DARK_PRIMARY_COLOR, // Set the color of the dot icon
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: '$MACRO_ADJUSTMENT_ACCESS:',
                                  style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 8,),

                          const Icon(Icons.check, color: DARK_PRIMARY_COLOR, size: 18,)

                        ],

                      ),




                      const SizedBox(height: 48,),



                      buildPayButton(context),
                    ],
                  ),
                ),

                Visibility(
                  visible: _loaderVisible,
                  child: const GFLoader(
                    type: GFLoaderType.circle,
                    loaderColorOne: DARK_PRIMARY_COLOR,
                    loaderColorTwo: DARK_PRIMARY_COLOR,
                    loaderColorThree: DARK_PRIMARY_COLOR,
                  ),
                )
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
      onPressed:(){
        payButtonClickListener(context);
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: _payBtnEnabled ? MASTERPIE_YELLOW_COLOR : LIGHT_GREY_COLOR
      ),
      child: const Padding(
          padding: EdgeInsets.all(12),
          child: Text(PAY_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),)
      ),
    );
  }


  void payButtonClickListener(BuildContext context){
    if(widget.newPlanInfo.subscriptionId.isNotEmpty && widget.newPlanInfo.endsAt.isNotEmpty && !widget.newPlanInfo.cancelAtPeriodEnd){
      _showOptionsForChangingSubscription(context);
    }else if(!_payBtnEnabled){
      _showErrorForPaymentRequest(context);
    }else{
      pay();
    }
  }


  void pay() async{
    setState(() {
      _loaderVisible = true;
    });
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
        setState(() {
          _loaderVisible = false;
        });
        Navigator.pop(context);
      }
    }else{
      if(mounted){
        setState(() {
          _loaderVisible = false;
        });
        showErrorToast(context, ERROR_TRY_AGAIN);
      }
    }
  }


}








