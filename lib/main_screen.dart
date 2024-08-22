
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/foods/presentation/screen/my_cook_book_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/view_auto_generate_meals_screen.dart';
import 'package:masterpie/feature/user/presentation/screen/onboarding_screen.dart';
import 'package:masterpie/util/core/constant/hive_constants.dart';
import 'package:masterpie/util/core/constant/messages_constants.dart';
import 'package:masterpie/util/core/di/service_locator.dart';
import 'package:masterpie/util/design/color/app_colors.dart';
import 'package:masterpie/util/design/size/app_widget_size.dart';
import 'package:masterpie/util/design/text/app_assets.dart';
import 'feature/user/data/local/datasource/user_hive_keyvalue_datasource.dart';
import 'feature/user/domain/model/profile_model.dart';
import 'feature/user/presentation/bloc/get_profile_bloc/get_profile_bloc.dart';
import 'feature/user/presentation/bloc/get_profile_bloc/state_event/get_profile_state_event.dart';
import 'feature/user/presentation/bloc/logout_bloc/logout_bloc.dart';
import 'feature/user/presentation/bloc/logout_bloc/state_event/logout_state_event.dart';
import 'feature/user/presentation/screen/calculate_user_macro_goal_screen.dart';
import 'feature/user/presentation/screen/landing_screen.dart';
import 'feature/user/presentation/screen/signin_screen.dart';
import 'feature/user/presentation/screen/user_info_screen.dart';
import 'feature/user/presentation/screen/user_plan_screen.dart';
import 'util/design/toast/app_toast.dart';


const MAX_DIFFERENCE_DAYS = 7;

const WIZARD_MIN_SERVING= '0.5';
const WIZARD_MAX_SERVING= '2.0';


final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

class MainScreen extends StatefulWidget {

  final bool? isFromOnboard;

   const MainScreen({Key? key,  this.isFromOnboard}) : super(key: key);

@override
State<MainScreen> createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin{

  bool isFromOnboard= false;

  bool _userLoggedIn= false;

  final userHiveDataSource = serviceLocator<UserHiveDataSource>();

  String _selectedMealPlanOption = '';

  late GetProfileBloc _getProfileBloc;
  late LogoutBloc _logoutBloc;

  List<int> _macroGoal= [];

  List<String> _sideDishTypes= [];

  List<String> _mainDishTypes= [];



  @override
  void initState() {
    super.initState();
    isFromOnboard= widget.isFromOnboard ?? false;
    _getProfileBloc = context.read<GetProfileBloc>();
    _logoutBloc = context.read<LogoutBloc>();
    _getProfileBloc.add(const GetProfileEvent.onReset());
    checkIfFirstTimeAppOpened();
  }

  @override
  Widget build(BuildContext context) {

    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        backgroundColor: LIGHT_GREY_COLOR,
        appBar: AppBar(
          backgroundColor: TOP_PART_MAIN_SCREE_COLOR,
          title: const Text(MEAL_PLAN_LABEL, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.white,),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
         ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: DARK_PRIMARY_COLOR,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16,),

                    GestureDetector(
                      onTap: (){
                        if(_userLoggedIn){
                          _scaffoldKey.currentState?.openEndDrawer();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserInfoScreen(),
                            ),
                          );
                        }
                      },
                        child: Image.asset(MASTERPIE_LOGO_PATH, width: 50, height: 50,)
                    ),

                    const SizedBox(height: 16,),
                    const Text(WELCOME_MASTERPIE_LABEL, style: TextStyle(fontSize: 14, color: Colors.white),),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.menu_book),
                title: const Text(MY_COOKBOOK_LABEL, style: TextStyle( fontSize: 14, color: DARK_PRIMARY_COLOR),),
                onTap: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                  myCookBookClickListener();
                },
              ),
              Visibility(
                visible: !_userLoggedIn,
                child: ListTile(
                  leading: const Icon(Icons.login),
                  title: const Text(SIGNIN_LABEL, style: TextStyle( fontSize: 14, color: DARK_PRIMARY_COLOR),),
                  onTap: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.accessibility),
                title: const Text(MACRO_GOAL_LABEL, style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),),
                onTap: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                  onCalculateMacroClicked();
                },
              ),
              ListTile(
                leading: const Icon(Icons.fastfood_outlined),
                title: const Text(MY_DIET_LABEL, style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),),
                onTap: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                  onDietClicked();
                },
              ),
              Visibility(
                // visible: _userLoggedIn,
                visible: false,
                child: ListTile(
                  leading: const Icon(Icons.credit_card),
                  title: const Text(YOUR_PLAN_LABEL, style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),),
                  onTap: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserPlanScreen(),
                      ),
                    );
                  },
                ),
              ),
              Visibility(
                visible: _userLoggedIn,
                child: ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text(LOGOUT_LABEL, style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),),
                  onTap: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                    showLogoutDialog(context);
                  },
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [

            /**
             * macro diet wizard
             */
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
              child: Column(
                children: [


                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [


                          const SizedBox(height: 24,),


                          /// question
                          const Text(
                              MEAL_PLAN_QUESTION,
                            style: TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 18, fontWeight: FontWeight.bold),
                          ),


                          const SizedBox(height: 16,),


                          /// option1
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                _selectedMealPlanOption = MEAL_PLAN_MANUAL_OPTION;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(4.0),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                              decoration: BoxDecoration(
                                color: _selectedMealPlanOption == MEAL_PLAN_MANUAL_OPTION ? MASTERPIE_YELLOW_COLOR : Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                children: [

                                  Image.asset(HOW_MUCH_EAT_PATH, width: 30, height: 30,),

                                  const SizedBox(width: 8,),

                                  const Flexible(
                                    child: Text(
                                      MEAL_PLAN_MANUAL_OPTION,
                                      style: TextStyle(color: DARK_PRIMARY_COLOR,
                                          fontSize: 13, fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),


                          const SizedBox(height: 16,),


                          /// option2
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                _selectedMealPlanOption = MEAL_PLAN_AUTO_GENERATE_OPTION;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(4.0),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                              decoration: BoxDecoration(
                                color: _selectedMealPlanOption == MEAL_PLAN_AUTO_GENERATE_OPTION ? MASTERPIE_YELLOW_COLOR : Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                children: [

                                  Image.asset(AUTO_PATH, width: 30, height: 30,),

                                  const SizedBox(width: 8,),

                                  const Flexible(
                                    child: Text(
                                      MEAL_PLAN_AUTO_GENERATE_OPTION,
                                      style: TextStyle(color: DARK_PRIMARY_COLOR,
                                          fontSize: 13, fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),

                  ),

                  _nextButton(),

                ],
              ),
            ),

            BlocConsumer<LogoutBloc, LogoutState>(
                builder: (mcontext, state) {
                  if (state is LogoutLoadingState) {
                    return const GFLoader(
                      type: GFLoaderType.circle,
                      loaderColorOne: DARK_PRIMARY_COLOR,
                      loaderColorTwo: DARK_PRIMARY_COLOR,
                      loaderColorThree: DARK_PRIMARY_COLOR,
                    );
                  }else if(state is LogoutLoadedState){
                    Future.delayed(Duration.zero,(){
                      _logoutBloc.add(const LogoutEvent.onReset());
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    });
                  }else if(state is LogoutErrorState){
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


            BlocConsumer<GetProfileBloc, GetProfileState>(
                builder: (mcontext, state) {
                  if (state is GetProfileLoadingState) {
                    return const GFLoader(
                      type: GFLoaderType.circle,
                      loaderColorOne: DARK_PRIMARY_COLOR,
                      loaderColorTwo: DARK_PRIMARY_COLOR,
                      loaderColorThree: DARK_PRIMARY_COLOR,
                    );
                  }else if(state is GetProfileLoadedState){
                    _getProfileBloc.add(const GetProfileEvent.onReset());
                    Future.delayed(Duration.zero,(){
                      _userLoggedIn= state.profile.id.isEmpty ? false : true;
                      _setUserInfo(state.profile);
                    });
                  }else if(state is GetProfileErrorState){
                    _getProfileBloc.add(const GetProfileEvent.onReset());
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
        ),
      ),
    );
  }



  void _setUserInfo(Profile profile) async {
    String selectedOption = await userHiveDataSource.getString(KEY_SELECTED_MEAL_PLAN_OPTION);
    setState(() {
      _selectedMealPlanOption = selectedOption;
      _sideDishTypes= profile.sideDishTypes;
      _mainDishTypes= profile.mainDishTypes;
      _macroGoal= [int.parse(profile.dailyMacroGoal[0]),
        int.parse(profile.dailyMacroGoal[1]),
        int.parse(profile.dailyMacroGoal[2]),
        int.parse(profile.dailyMacroGoal[3]),];
    });
  }



  void checkIfFirstTimeAppOpened() async{
    int firstTime = await userHiveDataSource.getInt(FIRST_TIME_OPEN_APP);
    if(firstTime == 0){
      userHiveDataSource.putInt(FIRST_TIME_OPEN_APP, 1);
      userHiveDataSource.putString(KEY_EMAIL, '');
      userHiveDataSource.putString(KEY_PASSWORD, '');
      userHiveDataSource.putString(KEY_USER_ID, '');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LandingScreen(),
        ),
      );
    }else{
      requestProfile();
    }
  }

  void requestProfile(){
    _getProfileBloc.add(const GetProfileEvent.onGetProfile());
  }

  void myCookBookClickListener() async{
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyCookBookScreen(),
      ),
    );
  }

  void onCalculateMacroClicked(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CalculateUserMacroGoalScreen(),
      ),
    );
  }


  void onDietClicked(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(isOnBoard: false,),
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(LOGOUT_LABLE, style: TextStyle(fontSize: 15, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LOGOUT_QUESTION_MSG, style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(DARK_PRIMARY_COLOR),
              ),
              child: const Text(YES_LABEL, style: TextStyle(fontSize: 14, color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
                logout();
              },
            ),
          ],
        );
      },
    );
  }

  void logout(){
    _logoutBloc.add(
        const LogoutEvent.onLogOut()
    );
  }

  Widget _nextButton(){
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(BORDER_RADIUS),
            ),
            backgroundColor: DARK_PRIMARY_COLOR
        ),
        onPressed: () {

          if(_selectedMealPlanOption.isEmpty){
            showErrorToast(context, ERROR_SELECT_ONE_OPTION);
            return;
          }

          userHiveDataSource.putString(KEY_SELECTED_MEAL_PLAN_OPTION, _selectedMealPlanOption);


          if(_selectedMealPlanOption == MEAL_PLAN_AUTO_GENERATE_OPTION){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewAutoGenerateMealsScreen(shouldGenerateFoods: true, isView: true, macroGoals: _macroGoal, mainDishTypes: _mainDishTypes,
                  sideDishTypes: _sideDishTypes,),
              ),
            );
          }else{
            // todo handle manual
          }


        },

        child: const Text(NEXT_LABEL, style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),),
      ),
    );
  }




}





