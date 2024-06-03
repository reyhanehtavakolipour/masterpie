import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
import 'package:masterpie/feature/user/presentation/screen/signin_screen.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import '../../../../main_screen.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
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

  void getPlan() async{
    if(UserRegistrationStatus.userAccountId.isEmpty){
      return;
    }

    _userPlanBloc.add(const UserPlanEvent.onGetUserPlan());
  }


  void getSubscriptionPlans(){
    _getSubscriptionPlansBloc.add(const SubscriptionPlanEvent.onGetPlans());
  }


  String getUserPlanName(){
    if(_userPlan.subscriptionPlan!.plan == 'premium one-time'){
      return PREMIUM_LABEL;
    }
    return _userPlan.subscriptionPlan!.plan;
  }


  void navigateLoginScreen(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      ),
    );
  }


  Widget userPlanIfUserHasLoggedIn(){

    String renewAtString= '';

    if(UserRegistrationStatus.userAccountId.isNotEmpty && _userPlan.nextUpdateDate.isNotEmpty){
      // macro diet wizard renew at
      int endsAtMillisecondsSinceEpoch = 0;
      DateTime renewAt = DateTime(endsAtMillisecondsSinceEpoch);
      endsAtMillisecondsSinceEpoch = int.parse(_userPlan.nextUpdateDate);
      renewAt = DateTime.fromMillisecondsSinceEpoch(endsAtMillisecondsSinceEpoch);
      renewAtString= DateFormat('MMMM d, y').format(renewAt);
    }

    return Visibility(
      visible: UserRegistrationStatus.userAccountId.isNotEmpty,
      child: Container(
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

            paymentDetail(),

            const SizedBox(height: 24,),

            /// favorites left
            Text(
              '$NEW_FAVORITES_LEFT: ${_userPlan.subscriptionPlan!.plan != FREE_LABEL ? UNLIMITED_LABEL : _userPlan.favoriteFoodLeft}',
              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white),
            ),

            const SizedBox(height: 6,),

            /// cookbook left
            Text(
              '$NEW_COOKBOOK_LEFT: ${_userPlan.subscriptionPlan!.plan != FREE_LABEL ? UNLIMITED_LABEL : _userPlan.cookBookFoodLeft}',
              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white),
            ),

            const SizedBox(height: 6,),

            /// food portion left
            Text(
              '$FOOD_PORTION_LEFT: ${_userPlan.foodPortionRequestsLeft}',
              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white),
            ),

            const SizedBox(height: 16,),

            Text(
              '$MACRO_DIET_RENEWS_AT\n$renewAtString',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.lightGreen),
            ),

            const SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }


  Widget userPlanIfUserHasNotLoggedIn(){
    return Visibility(
        visible: UserRegistrationStatus.userAccountId.isEmpty,
        child: Container(
            padding: const EdgeInsets.all(16),
            color: LIGHT_GREY_COLOR,
            child: Column(
              children: [
                const Text(
                  NOT_LOGGED_IN_MESSAGE,
                  style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600,),
                ),

                const SizedBox(height: 16,),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:(){
                      navigateLoginScreen();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: DARK_PRIMARY_COLOR
                    ),
                    child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(SIGNIN_LABEL, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                    ),
                  ),
                )

              ],
            )
        )
    );
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


                    userPlanIfUserHasNotLoggedIn(),

                    userPlanIfUserHasLoggedIn(),


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

  Widget paymentDetail(){
    // ends case
    int renewAtMillisecondsSinceEpoch = 0;
    DateTime endsAt = DateTime(renewAtMillisecondsSinceEpoch);
    if(_userPlan.endsAt.isNotEmpty){
      renewAtMillisecondsSinceEpoch = int.parse(_userPlan.endsAt);
      endsAt = DateTime.fromMillisecondsSinceEpoch(renewAtMillisecondsSinceEpoch);
    }
    String endsAtString= DateFormat('MMMM d, y').format(endsAt);

    return Visibility(
        visible: _userPlan.subscriptionPlan!.plan.contains('premium'),
        child: Text(
          '$ENDS_AT_LABEL $endsAtString',
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.redAccent),
        )
    );
  }


  void showRegisterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(SIGNIN_LABEL, style: TextStyle(fontSize: 15, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LOGIN_MSG_PLAN, style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(DARK_PRIMARY_COLOR),
              ),
              child: const Text(SIGNIN_LABEL, style: TextStyle(fontSize: 14, color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              },
            ),
          ],
        );
      },
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
              if(_newPlanInfo.subscriptionPlans[0].plan.contains(FREE_LABEL) && _userPlan.subscriptionPlan!.plan.contains(FREE_LABEL)){
                showSuccessToast(context, ALREADY_FREE_PLAN);
              }else if(_newPlanInfo.subscriptionPlans[0].plan.contains(PREMIUM_LABEL) && _userPlan.subscriptionPlan!.plan.contains(PREMIUM_LABEL)){
                showSuccessToast(context, ALREADY_PREMIUM_PLAN);
              }else if(_newPlanInfo.subscriptionPlans[0].plan.contains(FREE_LABEL) && _userPlan.subscriptionPlan!.plan.contains(PREMIUM_LABEL)){
                showSuccessToast(context, SWITCH_TO_FREE_AUTOMATIC_MSG);
              }else{

                if(UserRegistrationStatus.userAccountId.isNotEmpty){
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
                }else{
                  showRegisterDialog(context);
                }
              }
            },
            child: const Text(CONTINUE_LABEL, style: TextStyle( color: Colors.white),),
          ),
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
                    text: '${_subscriptions[0].cookBookFoodLimit} $COOKBOOK_FOOD_INFO_FREE_PLAN',
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
                      Text('${(subs[1].prices[1]*12).toInt()}USD/year', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.lightGreen)),
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

            //cookbook food access
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
                        text: '$COOKBOOK_FOOD_ACCESS:',
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
                  '${subs[1].foodPortionRequestsLimit}/mo (${subs[1].foodPortionRequestsLimit * 12} yearly)',
                  style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),
                ),

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
