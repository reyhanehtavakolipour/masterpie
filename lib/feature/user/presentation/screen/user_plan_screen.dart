import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/user/domain/model/subscription_plan_model.dart';
import 'package:masterpie/feature/user/domain/model/user_plan_model.dart';
import 'package:masterpie/feature/user/presentation/bloc/get_subscription_plans_bloc/get_subscription_plans_bloc.dart';
import 'package:masterpie/feature/user/presentation/bloc/get_subscription_plans_bloc/state_event/subscription_plans_state_event.dart';
import 'package:masterpie/feature/user/presentation/bloc/user_plan_bloc/user_plan_bloc.dart';
import 'package:masterpie/feature/user/presentation/screen/model/new_plan_info_model.dart';
import 'package:masterpie/feature/user/presentation/screen/payment_screen.dart';
import 'package:masterpie/util/core/constant/hive_constants.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../util/core/constant/api_constant.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../data/local/datasource/user_hive_keyvalue_datasource.dart';
import '../bloc/user_plan_bloc/state_event/plan_state_event.dart';



class UserPlanScreen extends StatefulWidget {

  const UserPlanScreen({super.key});

  @override
  State<UserPlanScreen> createState() => _UserPlanScreenState();
}

class _UserPlanScreenState extends State<UserPlanScreen> {


  late UserPlanBloc _userPlanBloc;
  late GetSubscriptionPlansBloc _getSubscriptionPlansBloc;


  UserPlan _userPlan= UserPlan(subscriptionPlan: SubscriptionPlan());

  NewPlanInfo _newPlanInfo = NewPlanInfo(subscriptionPlans: [SubscriptionPlan()]);

  List<SubscriptionPlan> _subscriptions= [];


  bool _loaderVisible= false;

  @override
  void initState() {
    super.initState();
    _userPlanBloc = context.read<UserPlanBloc>();
    _getSubscriptionPlansBloc = context.read<GetSubscriptionPlansBloc>();

    getPlan();
    getSubscriptionPlans();
  }


  void getPlan(){
    _userPlanBloc.add(const UserPlanEvent.onGetUserPlan());
  }


  void getSubscriptionPlans(){
    _getSubscriptionPlansBloc.add(const SubscriptionPlanEvent.onGetPlans());
  }


  void updatePlan(){

  }


  String getUserPlanName(){
    if(_userPlan.subscriptionPlan!.plan == 'basic one-time' || _userPlan.subscriptionPlan!.plan == 'basic'){
      return BASIC_LABEL;
    }else if(_userPlan.subscriptionPlan!.plan == 'premium one-time' || _userPlan.subscriptionPlan!.plan == 'premium'){
      return PREMIUM_LABEL;
    }
    return _userPlan.subscriptionPlan!.plan;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(YOUR_PLAN_LABEL, style: TextStyle(color: Colors.white,),),
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
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      color: DARK_PRIMARY_COLOR,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const SizedBox(height: 16,),

                          ///plan
                          Text(
                            getUserPlanName().capitalize(),
                            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 24, color: Colors.white),
                          ),

                          const SizedBox(height: 4,),

                          subscriptionDetail(),

                          paymentDetail(),

                          cancelReason(),



                          const SizedBox(height: 24,),

                          /// favorites left
                          Text(
                            '$NEW_FAVORITES_LEFT: ${_userPlan.subscriptionPlan!.plan != FREE_LABEL ? UNLIMITED_LABEL : _userPlan.favoriteFoodLeft}',
                            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white),
                          ),

                          const SizedBox(height: 6,),

                          /// food portion left
                          Text(
                            '$FOOD_PORTION_LEFT: ${_userPlan.foodPortionRequestsLeft}',
                            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white),
                          ),


                          const SizedBox(height: 6,),

                          /// suggest food
                          Text(
                            '$SUGGEST_FOOD_LEFT: ${_userPlan.suggestFoodRequestsLeft}',
                            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white),
                          ),


                          const SizedBox(height: 6,),

                          /// macro edition access
                          Text(
                            '$MACRO_EDITION_ACCESS: ${_userPlan.macroEdition ? YES_LABEL : NO_LABEL}',
                            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white),
                          ),


                          const SizedBox(height: 20,),

                          cancelSubscriptionButton(),

                        ],
                      ),
                    ),


                    const SizedBox(height: 8,),


                    ///all plans

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const Text(
                            ALL_PLANS_LABBEL,
                            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 24, color: DARK_PRIMARY_COLOR),
                          ),


                          const SizedBox(height: 16,),


                          ///free plan
                          freePlan(),


                          const SizedBox(height: 8,),

                          /// basic plan
                          basicPlan(),


                          const SizedBox(height: 8,),


                          /// premium plan
                          premiumPlan(),


                          const SizedBox(height: 8,),

                          /// dietitian plan
                          dietitianPlan(),


                          const SizedBox(height: 72,),
                        ],
                      ),
                    )

                  ],
                ),
              ),


              continueButton(),

              BlocConsumer<UserPlanBloc, UserPlanState>(
                  builder: (mcontext, state) {
                    if (state is UserPlanLoadingState) {
                      return const GFLoader(
                        type: GFLoaderType.circle,
                        loaderColorOne: DARK_PRIMARY_COLOR,
                        loaderColorTwo: DARK_PRIMARY_COLOR,
                        loaderColorThree: DARK_PRIMARY_COLOR,
                      );
                    }else if(state is UserPlanLoadedState){
                      _userPlanBloc.add(const UserPlanEvent.onReset());
                      Future.delayed(Duration.zero,(){
                        setState(() {
                          _userPlan= state.userSubscriptionPlan;
                        });
                      });
                    }else if(state is UserPlanErrorState){
                      _userPlanBloc.add(const UserPlanEvent.onReset());
                      Future.delayed(Duration.zero,(){
                        return showErrorToast(context, state.message);
                      });
                    }else{
                    }
                    return Container();
                  },
                  listener: (context, state){

                  }
              ),

              BlocConsumer<GetSubscriptionPlansBloc, SubscriptionPlansState>(
                  builder: (mcontext, state) {
                    if (state is SubscriptionPlansLoadingState) {
                      return const GFLoader(
                        type: GFLoaderType.circle,
                        loaderColorOne: DARK_PRIMARY_COLOR,
                        loaderColorTwo: DARK_PRIMARY_COLOR,
                        loaderColorThree: DARK_PRIMARY_COLOR,
                      );
                    }else if(state is SubscriptionPlansLoadedState){
                      _getSubscriptionPlansBloc.add(const SubscriptionPlanEvent.onReset());
                      Future.delayed(Duration.zero,(){
                        setState(() {
                          _subscriptions= state.subscriptions;
                        });
                      });
                    }else if(state is SubscriptionPlansErrorState){
                      _getSubscriptionPlansBloc.add(const SubscriptionPlanEvent.onReset());
                      Future.delayed(Duration.zero,(){
                        return showErrorToast(context, state.message);
                      });
                    }else{
                    }
                    return Container();
                  },
                  listener: (context, state){

                  }
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
    );
  }


  Future<void> _showCancelSubscriptionConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // User must tap a button to close the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(CANCEL_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 18, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(CANCEL_RENEWAL_MSG, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 14, color: DARK_PRIMARY_COLOR)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(YES_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 13, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                cancelAutoRenewal();
              },
            ),
            TextButton(
              child: const Text(NO_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 13, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showFreePlanConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // User must tap a button to close the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(FREE_LABEL.capitalize(), style: const TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 18, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(SWITCH_FREE_PLAN_MSG, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 14, color: DARK_PRIMARY_COLOR)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(YES_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 13, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                switchToFreePlan();
              },
            ),
            TextButton(
              child: const Text(NO_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 13, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
  
  
  void switchToFreePlan() async{
    String message = '';
    if(_userPlan.subscriptionId.isEmpty){
      message = SWITCH_FREE_SUCCESS_ONE_TIME_MSG;
    }else{
      cancelAutoRenewal();
      message = SWITCH_FREE_SUCCESS_SUBSCRIPTION_MSG;
    }


    showDialog<void>(
      context: context,
      barrierDismissible: true, // User must tap a button to close the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(SUCCESS_LABEL.capitalize(), style: const TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 18, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message, style: const TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 14, color: DARK_PRIMARY_COLOR)),
              ],
            ),
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
      'sub_id': _userPlan.subscriptionId,
      'supabase_id': supabaseId
    });

    if(response.status == 200){
      if(mounted){

        setState(() {
          _loaderVisible = false;
        });

        showSuccessToast(context, CANCEL_SUBSCRIPTION_SUCCESS_MSG);
        setState(() {
          _userPlan = _userPlan.copyWith(
              subscriptionId: ''
          );
        });
        _userPlanBloc.add(const UserPlanEvent.onGetUserPlan());
      }
    }else{
      print('show_cancel: ${response.data} ,, ${_userPlan.subscriptionId}');
      if(mounted){
        setState(() {
          _loaderVisible = false;
        });

        showErrorToast(context, CANCEL_SUBSCRIPTION_FAILED_MSG);
      }
    }

  }


  Widget subscriptionDetail(){
    return Visibility(
      visible: _userPlan.subscriptionId.isNotEmpty && !_userPlan.cancelAtPeriodEnd && _userPlan.subscriptionPlan!.plan != FREE_LABEL,
        child: Text(
          '${_userPlan.interval.capitalize()}, $AUTO_RENEWAL_LABEL',
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 24, color: Colors.white),
        )
    );
  }


  Widget paymentDetail(){

    // renew case
    int endsAtMillisecondsSinceEpoch = 0;
    DateTime renewAt = DateTime(endsAtMillisecondsSinceEpoch);
    if(_userPlan.endsAt.isNotEmpty && !_userPlan.cancelAtPeriodEnd){
      endsAtMillisecondsSinceEpoch = int.parse(_userPlan.endsAt) * 1000;
      renewAt = DateTime.fromMillisecondsSinceEpoch(endsAtMillisecondsSinceEpoch);
    }
    String renewAtString= DateFormat('MMMM d, y').format(renewAt);



    // ends case
    int renewAtMillisecondsSinceEpoch = 0;
    DateTime endsAt = DateTime(renewAtMillisecondsSinceEpoch);
    if(_userPlan.cancelAtPeriodEnd && _userPlan.endsAt.isNotEmpty){
      renewAtMillisecondsSinceEpoch = int.parse(_userPlan.endsAt) * 1000;
      endsAt = DateTime.fromMillisecondsSinceEpoch(renewAtMillisecondsSinceEpoch);
    }
    String endsAtString= DateFormat('MMMM d, y').format(endsAt);
    DateTime now = DateTime.now();

    if(_userPlan.subscriptionId.isNotEmpty && !_userPlan.cancelAtPeriodEnd && _userPlan.subscriptionPlan!.plan != FREE_LABEL){
      return Text(
        '$NEXT_PAYMENT_LABEL $renewAtString',
        style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.redAccent),
      );
    }


    return Visibility(
        visible: (_userPlan.subscriptionPlan!.plan.contains('basic') || _userPlan.subscriptionPlan!.plan.contains('premium')) &&
            _userPlan.subscriptionId.isEmpty && _userPlan.cancelAtPeriodEnd && !endsAt.isBefore(now),
        child: Text(
          '$ENDS_AT_LABEL: $endsAtString',
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.redAccent),
        )
    );
  }


  Widget cancelReason(){
    int millisecondsSinceEpoch = 0;
    DateTime endsAtDate = DateTime(millisecondsSinceEpoch);
    if(_userPlan.endsAt.isNotEmpty){
      millisecondsSinceEpoch = int.parse(_userPlan.endsAt) * 1000;
      endsAtDate= DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    }
    DateTime now = DateTime.now();


    String reason = _userPlan.cancelReason;
    if(_userPlan.cancelReason == 'subscription canceled'){
      reason = CANCELED_AUTO_RENEWAL_INFO;
    }

    return Visibility(
        visible: _userPlan.cancelReason.isNotEmpty  && _userPlan.subscriptionId.isEmpty && _userPlan.cancelAtPeriodEnd && !endsAtDate.isBefore(now),
        child: Text(
          reason,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.grey),
        )
    );
  }

  Widget cancelSubscriptionButton(){
    return  Visibility(
      visible: _userPlan.subscriptionId.isNotEmpty && !_userPlan.cancelAtPeriodEnd,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: MASTERPIE_YELLOW_COLOR
          ),
          onPressed: () {
            _showCancelSubscriptionConfirmation(context);
          },
          child: const Text(CANCEL_RENEWAL_LABEL, style: TextStyle( color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),),
        ),
      ),
    );
  }

  Widget continueButton(){
    return  Visibility(
      visible: _newPlanInfo.subscriptionPlans[0].plan.contains(BASIC_LABEL) || _newPlanInfo.subscriptionPlans[0].plan.contains(PREMIUM_LABEL) ||
          _newPlanInfo.subscriptionPlans[0].plan.contains(FREE_LABEL),
      child: Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          padding: const EdgeInsets.only(bottom: 24),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: DARK_PRIMARY_COLOR
            ),
            onPressed: () {
              if(_newPlanInfo.subscriptionPlans[0].plan.contains(FREE_LABEL)){
                if(_userPlan.subscriptionPlan!.plan.contains(FREE_LABEL)){
                  showSuccessToast(context, ALREADY_FREE_PLAN);
                }else{
                  _showFreePlanConfirmation(context);
                }
              }else{
                _newPlanInfo = _newPlanInfo.copyWith(customerId: _userPlan.customerId,
                    subscriptionId: _userPlan.subscriptionId, endsAt: _userPlan.endsAt,
                    interval: _userPlan.interval, updatedAt: _userPlan.updatedAt,
                    currentPlanName: _userPlan.subscriptionPlan!.plan, cancelAtPeriodEnd: _userPlan.cancelAtPeriodEnd);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(newPlanInfo: _newPlanInfo,),
                  ),
                );
              }
            },
            child: const Text(CONTINUE_LABEL, style: TextStyle( color: Colors.white),),
          ),
        ),
      ),
    );
  }


  Widget buildUpdateButton(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: (){
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: MASTERPIE_YELLOW_COLOR
        ),
        child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text(SAVE_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),)
        ),
      ),
    );
  }


  Widget freePlan(){
    if(_subscriptions.isEmpty){
      return Container();
    }
    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BORDER_RADIUS,),
          color: _newPlanInfo.subscriptionPlans[0].plan.contains(FREE_LABEL) ? SELECTED_PLAN_COLOR : Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(FREE_LABEL.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: DARK_PRIMARY_COLOR)),


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



            //favorite access
            RichText(
              text: TextSpan(
                children: [
                  const WidgetSpan(
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
                    text: '${_subscriptions[0].favoriteFoodLimit} $FAVORITE_FOOD_INFO_FREE_PLAN',
                    style: const TextStyle(fontSize: 14, color: RED_ERROR_COLOR, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
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

                const Icon(Icons.clear, color: RED_ERROR_COLOR, size: 18,)


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

                const Icon(Icons.clear, color: RED_ERROR_COLOR, size: 18,)


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

                const Icon(Icons.close, color: RED_ERROR_COLOR, size: 18,)

              ],
            ),
          ],
        ),
      ),
      onTap: (){
        setState(() {
          if(_newPlanInfo.subscriptionPlans[0].plan.contains(FREE_LABEL)){
            _newPlanInfo = _newPlanInfo.copyWith(subscriptionPlans:  [SubscriptionPlan()]);
          }else{
            final list = _subscriptions.where((element) => element.plan.contains(FREE_LABEL)).toList();
            _newPlanInfo= _newPlanInfo.copyWith(subscriptionPlans: list);
          }
        });
      },
    );
  }




  Widget basicPlan(){
    if(_subscriptions.isEmpty){
      return Container();
    }
    final subs = _subscriptions.where((element) => element.plan.contains(BASIC_LABEL)).toList();
    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BORDER_RADIUS,),
          color: _newPlanInfo.subscriptionPlans[0].plan.contains(BASIC_LABEL) ? SELECTED_PLAN_COLOR : Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(BASIC_LABEL.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: DARK_PRIMARY_COLOR)),


            const SizedBox(height: 16,),


            //price
            Center(
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${subs[0].prices[0]}\$/mo', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blueGrey)),
                      const SizedBox(width: 1,),
                      const Text('($MONTHLY_PLAN_LABEL)', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 11, color: Colors.blueGrey)),
                    ],
                  ),
                  const SizedBox(height: 4,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${subs[0].prices[1]}\$/mo', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blueGrey)),
                      const SizedBox(width: 1,),
                      const Text('($ANNUAL_PLAN_LABEL)', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 11, color: Colors.blueGrey)),
                    ],
                  ),
                ],
              ),
            ),



            const SizedBox(height: 32,),



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
                  '${subs[0].foodPortionRequestsLimit}',
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
                  '${subs[0].suggestFoodRequestsLimit}',
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
          ],
        ),
      ),
      onTap: (){
        setState(() {
          if(_newPlanInfo.subscriptionPlans[0].plan.contains(BASIC_LABEL)){
            _newPlanInfo = _newPlanInfo.copyWith(subscriptionPlans:  [SubscriptionPlan()]);
          }else{
            final list = _subscriptions.where((element) => element.plan.contains(BASIC_LABEL)).toList();
            _newPlanInfo= _newPlanInfo.copyWith(subscriptionPlans: list);
          }
        });
      },
    );
  }


  Widget premiumPlan(){
    if(_subscriptions.isEmpty){
      return Container();
    }

    final subs = _subscriptions.where((element) => element.plan.contains(PREMIUM_LABEL)).toList();

    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BORDER_RADIUS,),
          color: _newPlanInfo.subscriptionPlans[0].plan.contains(PREMIUM_LABEL) ? SELECTED_PLAN_COLOR : Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(PREMIUM_LABEL.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: DARK_PRIMARY_COLOR)),


            const SizedBox(height: 16,),


            //price
            Center(
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${subs[0].prices[0]}\$/mo', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blueGrey)),
                      const SizedBox(width: 1,),
                      const Text('($MONTHLY_PLAN_LABEL)', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 11, color: Colors.blueGrey)),
                    ],
                  ),
                  const SizedBox(height: 4,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${subs[0].prices[1]}\$/mo', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blueGrey)),
                      const SizedBox(width: 1,),
                      const Text('($ANNUAL_PLAN_LABEL)', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 11, color: Colors.blueGrey)),
                    ],
                  ),
                ],
              ),
            ),



            const SizedBox(height: 32,),


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
                  '${subs[0].foodPortionRequestsLimit}',
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
                  '${subs[0].suggestFoodRequestsLimit}',
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
          ],
        ),
      ),
      onTap: (){
        setState(() {
          if(_newPlanInfo.subscriptionPlans[0].plan.contains(PREMIUM_LABEL)){
            _newPlanInfo = _newPlanInfo.copyWith(subscriptionPlans:  [SubscriptionPlan()]);
          }else{
            final list = _subscriptions.where((element) => element.plan.contains(PREMIUM_LABEL)).toList();
            _newPlanInfo= _newPlanInfo.copyWith(subscriptionPlans: list);
          }
        });
      },
    );
  }


  Widget dietitianPlan(){
    if(_subscriptions.isEmpty){
      return Container();
    }
    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BORDER_RADIUS,),
          color: _newPlanInfo.subscriptionPlans[0].plan.contains(DIETITIAN_LABEL) ? SELECTED_PLAN_COLOR: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(DIETITIAN_LABEL.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: DARK_PRIMARY_COLOR)),


            const SizedBox(height: 16,),

            const Center(
              child: Text(
                DIETITIAN_CONTACT_US,
                style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),
              ),
            )
          ],
        ),
      ),
      onTap: (){
        setState(() {
          if(_newPlanInfo.subscriptionPlans[0].plan.contains(DIETITIAN_LABEL)){
            _newPlanInfo = _newPlanInfo.copyWith(subscriptionPlans:  [SubscriptionPlan()]);
          }else{
            final list = _subscriptions.where((element) => element.plan.contains(DIETITIAN_LABEL)).toList();
            _newPlanInfo= _newPlanInfo.copyWith(subscriptionPlans: list);
          }
        });
      },
    );
  }
}
