import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/user/presentation/screen/payment_screen.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/core/constant/subscription_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../domain/model/user_subscription_plan_model.dart';
import '../bloc/plan_bloc/plan_bloc.dart';
import '../bloc/plan_bloc/state_event/plan_state_event.dart';


class UserPlanScreen extends StatefulWidget {

  const UserPlanScreen({super.key});

  @override
  State<UserPlanScreen> createState() => _UserPlanScreenState();
}

class _UserPlanScreenState extends State<UserPlanScreen> {


  late PlanBloc _planBloc;

  UserSubscriptionPlan _userSubscriptionPlan= UserSubscriptionPlan();

  String _selectedPlan= '';

  bool _isAutoPaymentOn= false;

  @override
  void initState() {
    super.initState();
    _planBloc = context.read<PlanBloc>();
    getPlan();
  }


  void getPlan(){
    _planBloc.add(const PlanEvent.onGetUserPlan());
  }


  void updatePlan(){

  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: MaterialApp(
        theme: ThemeData(fontFamily: MONTSERRAT_FONT),
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
                          ///plan
                          Text(
                            _userSubscriptionPlan.plan.capitalize(),
                            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 24, color: Colors.white),
                          ),


                          const SizedBox(height: 24,),

                          /// favorites left
                          Text(
                            '$NEW_FAVORITES_LEFT: ${_userSubscriptionPlan.favoriteFoodRequestsLeft}',
                            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white),
                          ),

                          const SizedBox(height: 6,),

                          /// food portion lef
                          Text(
                            '$FOOD_PORTION_LEFT: ${_userSubscriptionPlan.foodPortionRequestsLeft}',
                            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white),
                          ),


                          const SizedBox(height: 6,),

                          /// suggest food
                          Text(
                            '$SUGGEST_FOOD_LEFT: ${_userSubscriptionPlan.suggestFoodRequestsLeft}',
                            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white),
                          ),


                          const SizedBox(height: 6,),


                          autPaymentWidget(),

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

              BlocConsumer<PlanBloc, PlanState>(
                  builder: (mcontext, state) {
                    if (state is PlanLoadingState) {
                      return const GFLoader(
                        type: GFLoaderType.circle,
                        loaderColorOne: DARK_PRIMARY_COLOR,
                        loaderColorTwo: DARK_PRIMARY_COLOR,
                        loaderColorThree: DARK_PRIMARY_COLOR,
                      );
                    }else if(state is PlanLoadedState){
                      _planBloc.add(const PlanEvent.onReset());
                      Future.delayed(Duration.zero,(){
                        setState(() {
                          _userSubscriptionPlan= state.userSubscriptionPlan;
                          _isAutoPaymentOn= _userSubscriptionPlan.isAutoPaymentOn;
                        });
                      });
                    }else if(state is PlanErrorState){
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
            ],
          )
        ),
      ),
    );
  }

  Future<void> _showCancelPlanConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // User must tap a button to close the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(CANCEL_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(FREE_PLAN_SWITCH_MSG, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 14, color: DARK_PRIMARY_COLOR)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(YES_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 13, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                //todo cancel subscription in Stripe
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




  Widget autPaymentWidget(){
    return  Visibility(
      // visible: _userSubscriptionPlan.plan != FREE_PLAN,
      visible: true,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            const Text(AUTO_PAYMENT_LABEL, style: TextStyle( color: Colors.white, fontSize: 14),),
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
                  // todo update auto payment
                });
              },
            ),
          ],
        )
      ),
    );
  }

  Widget cancelSubscriptionButton(){
    return  Visibility(
      // visible: _userSubscriptionPlan.plan != FREE_PLAN,
      visible: true,
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
            _showCancelPlanConfirmation(context);
          },
          child: const Text(CANCEL_SUBSCRIPTION_LABEL, style: TextStyle( color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),),
        ),
      ),
    );
  }

  Widget continueButton(){
    return  Visibility(
      visible: _selectedPlan== BASIC_PLAN || _selectedPlan == PREMIUM_PLAN || _selectedPlan == FREE_PLAN,
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
              if(_selectedPlan == FREE_PLAN){
                if(_userSubscriptionPlan.plan == FREE_PLAN){
                  showSuccessToast(context, ALREADY_FREE_PLAN);
                }else{
                  _showCancelPlanConfirmation(context);
                }
              }else{
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(userSubscriptionPlan: UserSubscriptionPlan(userId: _userSubscriptionPlan.userId, plan: _selectedPlan),),
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
    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BORDER_RADIUS,),
          color: _selectedPlan == FREE_PLAN ? SELECTED_PLAN_COLOR : Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(FREE_PLAN.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: DARK_PRIMARY_COLOR)),


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
                  '$FAVORITE_FOOD_INFO_FREE_PLAN',
                  style: TextStyle(fontSize: 14, color: RED_ERROR_COLOR, fontWeight: FontWeight.w600),
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

                const Icon(Icons.clear, color: RED_ERROR_COLOR, size: 18,)

              ],
            ),
          ],
        ),
      ),
      onTap: (){
        setState(() {
          if(_selectedPlan == FREE_PLAN){
            _selectedPlan= '';
          }else{
            _selectedPlan= FREE_PLAN;
          }
        });
      },
    );
  }




  Widget basicPlan(){
    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BORDER_RADIUS,),
          color: _selectedPlan == BASIC_PLAN ? SELECTED_PLAN_COLOR : Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(BASIC_PLAN.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: DARK_PRIMARY_COLOR)),


            const SizedBox(height: 16,),


            //price
            const Center(
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$BASIC_PRICE_MONTHLY\$/mo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blueGrey)),
                      SizedBox(width: 1,),
                      Text('($MONTHLY_PLAN_LABEL)', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 11, color: Colors.blueGrey)),
                    ],
                  ),
                  SizedBox(height: 4,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$BASIC_PRICE_ANNUAL_MONTHLY\$/mo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blueGrey)),
                      SizedBox(width: 1,),
                      Text('($ANNUAL_PLAN_LABEL)', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 11, color: Colors.blueGrey)),
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
                  UNLIMITED,
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

                const Text(
                  '$BASIC_FOODS_PORTION_REQUEST_LIMIT',
                  style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),
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

                const Text(
                  '$BASIC_SUGGEST_FOOD_LIMIT',
                  style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),
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
          if(_selectedPlan == BASIC_PLAN){
            _selectedPlan= '';
          }else{
            _selectedPlan= BASIC_PLAN;
          }
        });
      },
    );
  }


  Widget premiumPlan(){
    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BORDER_RADIUS,),
          color: _selectedPlan == PREMIUM_PLAN ? SELECTED_PLAN_COLOR : Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(PREMIUM_PLAN.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: DARK_PRIMARY_COLOR)),


            const SizedBox(height: 16,),


            //price
            const Center(
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$PREMIUM_PRICE_MONTHLY\$/mo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blueGrey)),
                      SizedBox(width: 1,),
                      Text('($MONTHLY_PLAN_LABEL)', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 11, color: Colors.blueGrey)),
                    ],
                  ),
                  SizedBox(height: 4,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$PREMIUM_PRICE_ANNUAL_MONTHLY\$/mo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blueGrey)),
                      SizedBox(width: 1,),
                      Text('($ANNUAL_PLAN_LABEL)', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 11, color: Colors.blueGrey)),
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
                  UNLIMITED,
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

                const Text(
                  '$PREMIUM_FOODS_PORTION_REQUEST_LIMIT',
                  style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),
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

                const Text(
                  '$PREMIUM_SUGGEST_FOOD_LIMIT',
                  style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),
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
          if(_selectedPlan == PREMIUM_PLAN){
            _selectedPlan= '';
          }else{
            _selectedPlan= PREMIUM_PLAN;
          }
        });
      },
    );
  }


  Widget dietitianPlan(){
    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BORDER_RADIUS,),
          color: _selectedPlan == DIETITIAN_PLAN ? SELECTED_PLAN_COLOR: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(DIETITIAN_PLAN.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: DARK_PRIMARY_COLOR)),


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
          if(_selectedPlan == DIETITIAN_PLAN){
            _selectedPlan= '';
          }else{
            _selectedPlan= DIETITIAN_PLAN;
          }
        });
      },
    );
  }
}
