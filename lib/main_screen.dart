
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/user/presentation/screen/landing_screen.dart';
import 'package:masterpie/util/core/constant/messages_constants.dart';
import 'package:masterpie/util/design/color/app_colors.dart';
import 'package:masterpie/util/design/size/app_widget_size.dart';
import 'package:masterpie/util/design/text/app_assets.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'feature/foods/domain/model/food_model.dart';
import 'feature/foods/presentation/bloc/get_logged_foods_bloc/get_logged_foods_bloc.dart';
import 'feature/foods/presentation/bloc/get_logged_foods_bloc/state_event/get_logged_foods_state_event.dart';
import 'feature/foods/presentation/food_calculator/food_calculator.dart';
import 'feature/foods/presentation/screen/food_detail_screen.dart';
import 'feature/foods/presentation/screen/my_favorite_foods_screen.dart';
import 'feature/foods/presentation/screen/request_foods_posrtions_screen.dart';
import 'feature/foods/presentation/screen/search_food_screen.dart';
import 'feature/foods/presentation/screen/suggest_food_screen.dart';
import 'feature/foods/presentation/screen/ui_helper/foods_list_ui.dart';
import 'feature/user/domain/model/profile_model.dart';
import 'feature/user/presentation/bloc/get_profile_bloc/get_profile_bloc.dart';
import 'feature/user/presentation/bloc/get_profile_bloc/state_event/get_profile_state_event.dart';
import 'feature/user/presentation/bloc/logout_bloc/logout_bloc.dart';
import 'feature/user/presentation/bloc/logout_bloc/state_event/logout_state_event.dart';
import 'feature/user/presentation/screen/calculate_user_macro_goal_screen.dart';
import 'feature/user/presentation/screen/macro_goals_dialog_screen.dart';
import 'feature/user/presentation/screen/signin_screen.dart';
import 'feature/user/presentation/screen/user_info_screen.dart';
import 'feature/user/presentation/screen/user_plan_screen.dart';
import 'util/design/helper_functions/helper_functions_design.dart';
import 'util/design/toast/app_toast.dart';
import 'feature/foods/domain/model/food_type.dart';
import 'feature/foods/presentation/bloc/log_foods_bloc/log_foods_bloc.dart';
import 'feature/foods/presentation/bloc/log_foods_bloc/state_event/log_foods_state_event.dart';

const MAX_DIFFERENCE_DAYS = 7;

class MainScreen extends StatefulWidget {

  static const routeName = '/main-screen';

  final List<String>? dailyMacroGoal;

  const MainScreen({Key? key, this.dailyMacroGoal}) : super(key: key);

@override
State<MainScreen> createState() => _MainScreenState();
}



class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin{



  late final TabController _tabController;


  DateTime _focusedDay = DateTime.now();

  /// Here foods actually means eaten foods
  List<Food> _foods = [];

  bool _macroEdition = false;

  double _totalTakenCalories= 0;
  double _totalTakenProteins= 0;
  double _totalTakenCarbs= 0;
  double _totalTakenFats= 0;

  late GetLoggedFoodsBloc _getLoggedFoodsBloc;
  late LogFoodsBloc _logFoodsBloc;
  late GetProfileBloc _getProfileBloc;
  late LogoutBloc _logoutBloc;

  late TextEditingController _todayWeightController;

  int _calorieGoal= 0;
  int _proteinGoal= 0;
  int _carbGoal = 0;
  int _fatGoal= 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: TABS_SIZE, vsync: this);
    _todayWeightController= TextEditingController(text: '0');
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();
    _logFoodsBloc = context.read<LogFoodsBloc>();
    _getProfileBloc = context.read<GetProfileBloc>();
    _logoutBloc = context.read<LogoutBloc>();
    _tabController.addListener(_handleTabSelection);

    _getProfileBloc.add(const GetProfileEvent.onReset());
    _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
    _logFoodsBloc.add(const LogFoodsEvent.onReset());
    setMacroGoals();
    requestProfile();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  void _handleTabSelection() {
    if(_tabController.index == 1){
      // requestLoggedFoods(DateTime.now());
    }
  }

  void requestProfile(){
    _getProfileBloc.add(const GetProfileEvent.onGetProfile());
  }

  void requestLoggedFoods(DateTime dateTime){
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    _getLoggedFoodsBloc.add(
      GetLoggedFoodsEvent.onGetLoggedFoods(formattedDate)
    );
  }


  void updateScreenAfterEatenFoodsChanges(List<Food> foods) {
    setState(() {
      _foods= [];
      _foods = foods;
      deleteFoodsWithZeroCount(foods);
      calculateTotalTakenMacros();
    });
    logFoodsOfToday();
  }


  void logout(){
    _logoutBloc.add(
        const LogoutEvent.onLogOut()
    );
  }


  void deleteFoodsWithZeroCount(List<Food> foods){
    _foods.removeWhere((element) => element.count == 0);
  }

  void calculateTotalTakenMacros(){
    _totalTakenCalories= 0;
    _totalTakenProteins= 0;
    _totalTakenCarbs= 0;
    _totalTakenFats= 0;
    _foods.forEach((element) {
      double calorie= 0;
      double protein= 0;
      double carb= 0;
      double fat= 0;

      element.calorie.forEach((cal) {
        calorie= calorie + double.parse(cal);
      });
      element.protein.forEach((prot) {
        protein= protein + double.parse(prot);
      });
      element.carb.forEach((car) {
        carb= carb + double.parse(car);
      });
      element.fat.forEach((fats) {
        fat= fat + double.parse(fats);
      });
      double foodCalorie= calorie * element.count;
      double foodProtein= protein * element.count;
      double foodCarb= carb * element.count;
      double foodFat= fat * element.count;

      _totalTakenCalories= _totalTakenCalories+ foodCalorie;
      _totalTakenProteins= _totalTakenProteins+ foodProtein;
      _totalTakenCarbs= _totalTakenCarbs+ foodCarb;
      _totalTakenFats= _totalTakenFats+ foodFat;

    });
  }

  void addOrRemoveFavorite(Food food, bool addToFavorite){
    // if(addToFavorite){
    //   _addToMyFavoriteBloc.add(
    //     AddOrUpdateMyFavoriteEvent.onAddToMyFavorite(
    //         food
    //     ),
    //   );
    // }else{
    //   _removeFromMyFavoriteBloc.add(
    //     RemoveFromMyFavoriteEvent.onRemoveFromMyFavorite(
    //         food
    //     ),
    //   );
    // }
  }

  Future<String> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    return version;
  }

  void onUpdatedGoalMacrosFromDialog(List<String> goalMacros) {
    setState(() {
      _calorieGoal = int.parse(goalMacros[0]);
      _proteinGoal = int.parse(goalMacros[1]);
      _carbGoal = int.parse(goalMacros[2]);
      _fatGoal = int.parse(goalMacros[3]);
    });
  }

  void showMacroGoalsPopup(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MacroGoalsPopup(calorie: _calorieGoal.toString(), protein: _proteinGoal.toString(),
          carb: _carbGoal.toString(), fat: _fatGoal.toString(), onMacroGoalUpdated: onUpdatedGoalMacrosFromDialog,);
      },
    );
  }

  void setMacroGoals() {
    setState(() {
      if(widget.dailyMacroGoal != null){
        List<String> macros = widget.dailyMacroGoal!;

        String calorie = macros[0];
        if(calorie.isEmpty){
          calorie = '0';
        }

        String protein = macros[1];
        if(protein.isEmpty){
          protein = '0';
        }

        String carb = macros[2];
        if(carb.isEmpty){
          carb = '0';
        }

        String fat = macros[3];
        if(fat.isEmpty){
          fat = '0';
        }

        _calorieGoal = int.parse(calorie);
        _proteinGoal = int.parse(protein);
        _carbGoal = int.parse(carb);
        _fatGoal = int.parse(fat);
      }
    });

  }


  void showContactPage() async{
    final Uri url = Uri.parse('https://www.masterpieapp.com/contact-10');
    await launchUrl(url);
  }

  void showPrivacy() async{
    final Uri url = Uri.parse('https://www.masterpieapp.com/general-clean');
    await launchUrl(url);
  }

  void showCredits() async{
    //todo change address
    final Uri url = Uri.parse('https://masterpieapp.com');
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {

    double caloriePercent = double.parse((_totalTakenCalories/_calorieGoal).toStringAsFixed(2));
    double proteinPercent = double.parse((_totalTakenProteins/_proteinGoal).toStringAsFixed(2));
    double carbPercent = double.parse((_totalTakenCarbs/_carbGoal).toStringAsFixed(2));
    double fatPercent = double.parse((_totalTakenFats/_fatGoal).toStringAsFixed(2));


    int remainedCalorie = (_calorieGoal.toDouble() - _totalTakenCalories).toInt();
    int remainedProtein = (_proteinGoal.toDouble() - _totalTakenProteins).toInt();
    int remainedCarb = (_carbGoal.toDouble() - _totalTakenCarbs).toInt();
    int remainedFat = (_fatGoal.toDouble() - _totalTakenFats).toInt();


    if(caloriePercent > 1){
      caloriePercent = 1;
      remainedCalorie = 0;
    }

    if(proteinPercent > 1){
      proteinPercent = 1;
      remainedProtein = 0;
    }

    if(carbPercent > 1){
      carbPercent = 1;
      remainedCarb = 0;
    }

    if(fatPercent > 1){
      fatPercent = 1;
      remainedFat = 0;
    }



    if(_totalTakenCalories == 0.0 && _calorieGoal == 0){
      caloriePercent = 0;
      remainedCalorie = 0;
    }

    if(_totalTakenProteins == 0.0 && _proteinGoal == 0){
      proteinPercent = 0;
      remainedProtein = 0;
    }

    if(_totalTakenCarbs == 0.0 && _carbGoal == 0){
      carbPercent = 0;
      remainedCarb = 0;
    }

    if(_totalTakenFats == 0.0 && _fatGoal == 0){
      fatPercent = 0;
      remainedFat = 0;
    }



    _totalTakenCalories = double.parse(_totalTakenCalories.toStringAsFixed(1));
    _totalTakenProteins = double.parse(_totalTakenProteins.toStringAsFixed(1));
    _totalTakenCarbs = double.parse(_totalTakenCarbs.toStringAsFixed(1));
    _totalTakenFats = double.parse(_totalTakenFats.toStringAsFixed(1));


    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      home: Scaffold(
        key: _scaffoldKey,
        backgroundColor: TOP_PART_MAIN_SCREE_COLOR,
        appBar: AppBar(
          backgroundColor: TOP_PART_MAIN_SCREE_COLOR,
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
          title: Container(
            /**
             * date
             */
            width: double.infinity,
            height: DATE_CONTAINER_HEIGHT,
            color: TOP_PART_MAIN_SCREE_COLOR,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: false,
                  child: GestureDetector(
                    onTap: (){
                      if(DateTime.now().difference(_focusedDay.subtract(const Duration(days: 1))).inDays < MAX_DIFFERENCE_DAYS + 1){
                        setState(() {
                          _focusedDay = _focusedDay.subtract(const Duration(days: 1));
                        });
                      }
                    },
                    child: const Icon(Icons.arrow_left, color: Colors.white,),
                  ),
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                      margin: const EdgeInsets.only(left: 24, right: 24),
                      child: Text(
                        DateFormat('d MMMM yy').format(_focusedDay),
                        style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.white),
                      )
                  ),
                ),
                Visibility(
                  visible: false,
                  child: GestureDetector(
                    onTap: (){
                      if(_focusedDay.add(const Duration(days: 1)).isBefore(DateTime.now())){
                        setState(() {
                          _focusedDay = _focusedDay.add(const Duration(days: 1));
                        });
                      }
                    },
                    child: const Icon(Icons.arrow_right, color: Colors.white,),
                  ),
                )
              ],
            ),
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
                    Image.asset(MASTERPIE_LOGO_PATH, width: 50, height: 50,),
                    const SizedBox(height: 16,),
                    const Text(WELCOME_MASTERPIE_LABEL, style: TextStyle(fontSize: 14, color: Colors.white),),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.account_box),
                title: const Text(PROFILE_LABEL, style: TextStyle( fontSize: 14, color: DARK_PRIMARY_COLOR),),
                onTap: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserInfoScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.accessibility),
                title: const Text(MACRO_GOAL_LABEL, style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),),
                onTap: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CalculateUserMacroGoalScreen(),
                    ),
                  );
                },
              ),
              ListTile(
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
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(LOGOUT_LABEL, style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),),
                onTap: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                  showLogoutDialog(context);
                },
              ),

              const Divider(),

              Visibility(
                visible: false,
                child: ListTile(
                  leading: const Icon(Icons.attribution),
                  title: const Text(CREDITS_LABEL, style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),),
                  onTap: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                   showCredits();
                  },
                ),
              ),


              ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text(PRIVACY_LABEL, style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),),
                onTap: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                  showPrivacy();
                },
              ),


              ListTile(
                leading: const Icon(Icons.contact_page),
                title: const Text(CONTACT_US_LABEL, style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),),
                onTap: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                  showContactPage();
                },
              ),

              ListTile(
                leading: const Icon(Icons.info),
                title: FutureBuilder<String>(
                  future: _getAppVersion(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text('Version: ${snapshot.data}', style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),);
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        body: Column(
              children: [

                Expanded(
                  child: Container(
                    color: TOP_PART_MAIN_SCREE_COLOR,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [


                        /// calorie and protein row
                        Expanded(
                          child: Row(
                            children: [
                              /// calorie
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    showMacroGoalsPopup(context);
                                  },
                                  child: Container(
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(BORDER_RADIUS),
                                      border: Border.all(
                                        color: LIGHT_GREY_COLOR,
                                        width: 0.25,
                                      ),
                                    ),
                                    margin: const EdgeInsets.all(MACRO_MARGIN),
                                    child: CircularPercentIndicator(
                                      radius: MACRO_CIRCLE_RADIUS,
                                      animation: true,
                                      animationDuration: MACRO_ANIMATION_DURATION,
                                      lineWidth: MACRO_CIRCLE_WIDTH,
                                      percent: caloriePercent,
                                      center: Text(
                                        "${(caloriePercent*100).toInt()}%",
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: MACRO_PERCENTAGE_COLOR),
                                      ),
                                      circularStrokeCap: CircularStrokeCap.butt,
                                      backgroundColor: MACRO_PERCENTAGE_COLOR,
                                      progressColor: (_totalTakenCalories == 0.0 && _calorieGoal == 0) ? Colors.grey : PROGRESS_MACRO_COLOR,
                                      footer: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(top: MACRO_LABEL_TOP_MARGIN),
                                            child: Text(
                                              '$CALORIE_LABEL ($remainedCalorie cal $REMAINS_LABEL)',
                                              style:
                                              const TextStyle(fontWeight: FontWeight.bold, fontSize: MACRO_LABEL_FONT_SIZE, color: MASTERPIE_YELLOW_COLOR),
                                            ),
                                          ),

                                          const SizedBox(height: 6,),

                                          Text(
                                            '$_totalTakenCalories/$_calorieGoal',
                                            style:
                                            const TextStyle(fontWeight: FontWeight.bold, fontSize: MACRO_LABEL_FONT_SIZE, color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              /// protein
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    showMacroGoalsPopup(context);
                                  },
                                  child: Container(
                                    height: double.infinity,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(BORDER_RADIUS),
                                      border: Border.all(
                                        color: LIGHT_GREY_COLOR,
                                        width: 0.25,
                                      ),
                                    ),
                                    margin: const EdgeInsets.all(MACRO_MARGIN),
                                    child: CircularPercentIndicator(
                                      radius: MACRO_CIRCLE_RADIUS,
                                      animation: true,
                                      animationDuration: MACRO_ANIMATION_DURATION,
                                      lineWidth: MACRO_CIRCLE_WIDTH,
                                      percent: proteinPercent,
                                      center: Text(
                                        "${(proteinPercent*100).toInt()}%",
                                        style:
                                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: MACRO_PERCENTAGE_COLOR),
                                      ),
                                      circularStrokeCap: CircularStrokeCap.butt,
                                      backgroundColor: MACRO_PERCENTAGE_COLOR,
                                      progressColor: (_totalTakenProteins == 0.0 && _proteinGoal == 0) ? Colors.grey : PROGRESS_MACRO_COLOR,
                                      footer: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(top: MACRO_LABEL_TOP_MARGIN),
                                            child: Text(
                                              '$PROTEIN_LABEL ($remainedProtein g $REMAINS_LABEL)',
                                              style:
                                              const TextStyle(fontWeight: FontWeight.bold, fontSize: MACRO_LABEL_FONT_SIZE, color: MASTERPIE_YELLOW_COLOR),
                                            ),
                                          ),

                                          const SizedBox(height: 6,),

                                          Text(
                                            '$_totalTakenProteins/$_proteinGoal',
                                            style:
                                            const TextStyle(fontWeight: FontWeight.bold, fontSize: MACRO_LABEL_FONT_SIZE, color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),



                        /// carb and fat
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              /// carb
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    showMacroGoalsPopup(context);
                                  },
                                  child: Container(
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(BORDER_RADIUS),
                                      border: Border.all(
                                        color: LIGHT_GREY_COLOR,
                                        width: 0.25,
                                      ),
                                    ),
                                    margin: const EdgeInsets.all(MACRO_MARGIN),
                                    child: CircularPercentIndicator(
                                      radius: MACRO_CIRCLE_RADIUS,
                                      animation: true,
                                      animationDuration: MACRO_ANIMATION_DURATION,
                                      lineWidth: MACRO_CIRCLE_WIDTH,
                                      percent: carbPercent,
                                      center: Text(
                                        "${(carbPercent*100).toInt()}%",
                                        style:
                                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: MACRO_PERCENTAGE_COLOR),
                                      ),
                                      circularStrokeCap: CircularStrokeCap.butt,
                                      backgroundColor: MACRO_PERCENTAGE_COLOR,
                                      progressColor: (_totalTakenCarbs == 0.0 && _carbGoal == 0) ? Colors.grey : PROGRESS_MACRO_COLOR,
                                      footer: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(top: MACRO_LABEL_TOP_MARGIN),
                                            child: Text(
                                              '$CARB_LABEL ($remainedCarb g $REMAINS_LABEL)',
                                              style:
                                              const TextStyle(fontWeight: FontWeight.bold, fontSize: MACRO_LABEL_FONT_SIZE, color: MASTERPIE_YELLOW_COLOR),
                                            ),

                                          ),

                                          const SizedBox(height: 6,),

                                          Text(
                                            '$_totalTakenCarbs/$_carbGoal',
                                            style:
                                            const TextStyle(fontWeight: FontWeight.bold, fontSize: MACRO_LABEL_FONT_SIZE, color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),



                              /// fat
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    showMacroGoalsPopup(context);
                                  },
                                  child: Container(
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(BORDER_RADIUS),
                                      border: Border.all(
                                        color: LIGHT_GREY_COLOR,
                                        width: 0.25,
                                      ),
                                    ),
                                    margin: const EdgeInsets.all(MACRO_MARGIN),
                                    child: CircularPercentIndicator(
                                      radius: MACRO_CIRCLE_RADIUS,
                                      animation: true,
                                      animationDuration: MACRO_ANIMATION_DURATION,
                                      lineWidth: MACRO_CIRCLE_WIDTH,
                                      percent: fatPercent,
                                      center: Text(
                                        "${(fatPercent*100).toInt()}%",
                                        style:
                                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: MACRO_PERCENTAGE_COLOR),
                                      ),
                                      circularStrokeCap: CircularStrokeCap.butt,
                                      backgroundColor: MACRO_PERCENTAGE_COLOR,
                                      progressColor: (_totalTakenFats == 0.0 && _fatGoal == 0) ? Colors.grey : PROGRESS_MACRO_COLOR,
                                      footer: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(top: MACRO_LABEL_TOP_MARGIN),
                                            child: Text(
                                              '$FAT_LABEL ($remainedFat g $REMAINS_LABEL)',
                                              style:
                                              const TextStyle(fontWeight: FontWeight.bold, fontSize: MACRO_LABEL_FONT_SIZE, color: MASTERPIE_YELLOW_COLOR),
                                            ),
                                          ),

                                          const SizedBox(height: 6,),

                                          Text(
                                            '$_totalTakenFats/$_fatGoal',
                                            style:
                                            const TextStyle(fontWeight: FontWeight.bold, fontSize: MACRO_LABEL_FONT_SIZE, color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

                Expanded(
                    child:  ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Scaffold(
                        backgroundColor: MASTERPIE_YELLOW_COLOR,
                        body: Stack(
                          children: [
                            DefaultTabController(
                              length: TABS_SIZE,
                              child: Column(
                                children: [

                                  TabBar(
                                    controller: _tabController,
                                    indicatorColor: TAB_BAR_ICON_COLOR,

                                    tabs: const [
                                      Tab(icon: Icon(Icons.home, color: TAB_BAR_ICON_COLOR,)),
                                      Tab(icon: Icon(Icons.fastfood_rounded, color: TAB_BAR_ICON_COLOR,)),
                                    ],
                                  ),


                                  Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      child: TabBarView(
                                        controller: _tabController,
                                        children: [


                                          /**
                                           * Home Tab
                                           */
                                          Stack(
                                            children: [
                                              Column(

                                                children: [


                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.white,
                                                      child: Row(
                                                        children: [
                                                          /**
                                                           * my favorite
                                                           */
                                                          Expanded(
                                                            child: GestureDetector(
                                                              onTap: (){
                                                                myFavoriteClickListener();
                                                              },
                                                              child: Container(
                                                                width: double.infinity,
                                                                padding: const EdgeInsets.symmetric(vertical: CAT_VETICAL_PADDING, horizontal: CAT_HORIZONTAL_PADDING),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(BORDER_RADIUS,),
                                                                  color: CATEGORY_COLOR,
                                                                ),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [

                                                                    Image.asset(FAVORITE_FOOD_PATH, width: SIZE_IMAGE_CAT, height: SIZE_IMAGE_CAT, color: DARK_PRIMARY_COLOR,),

                                                                    const SizedBox(height: CAT_LABEL_TOP_MARGIN,),

                                                                    const Text(MY_FAVORITE_FOOD_LABEL,
                                                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: FONT_CATS_LABEL, color: MACRO_COLOR)
                                                                    )

                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),


                                                          const SizedBox(width: 8,),

                                                          /**
                                                           * request foods portion
                                                           */
                                                          Expanded(
                                                            child: GestureDetector(
                                                              onTap: (){
                                                                Navigator.pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) => const RequestFoodsPortionsScreen(),
                                                                  ),
                                                                );
                                                              },
                                                              child: Container(
                                                                width: double.infinity,
                                                                padding: const EdgeInsets.symmetric(vertical: CAT_VETICAL_PADDING, horizontal: CAT_HORIZONTAL_PADDING),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(BORDER_RADIUS,),
                                                                  color: CATEGORY_COLOR,
                                                                ),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Image.asset(HOW_MUCH_EAT_PATH, width: SIZE_IMAGE_CAT, height: SIZE_IMAGE_CAT, color: DARK_PRIMARY_COLOR,),

                                                                    const SizedBox(height: CAT_LABEL_TOP_MARGIN,),

                                                                    const Text(HOW_MUCH_TO_EAT,
                                                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: FONT_CATS_LABEL, color: MACRO_COLOR)
                                                                    )


                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),





                                                  const SizedBox(height: 8,),




                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        /**
                                                         * suggest foods
                                                         */
                                                        Expanded(
                                                          child: GestureDetector(
                                                            onTap: (){
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => const SuggestFoodScreen(),
                                                                ),
                                                              );
                                                            },
                                                            child: Container(
                                                              width: double.infinity,
                                                              padding: const EdgeInsets.symmetric(vertical: CAT_VETICAL_PADDING, horizontal: CAT_HORIZONTAL_PADDING),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(BORDER_RADIUS,),
                                                                color: CATEGORY_COLOR,
                                                              ),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Image.asset(SUGGEST_FOOD_PATH, width: SIZE_IMAGE_CAT, height: SIZE_IMAGE_CAT, color: DARK_PRIMARY_COLOR,),

                                                                  const SizedBox(height: CAT_LABEL_TOP_MARGIN,),

                                                                  const Text(SUGGEST_FOOD_LABEL, style: TextStyle(fontWeight: FontWeight.bold, fontSize: FONT_CATS_LABEL, color: MACRO_COLOR))

                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),


                                                        const SizedBox(width: 8,),

                                                        /**
                                                         * search food
                                                         */
                                                        Expanded(
                                                          child: GestureDetector(
                                                            onTap: (){
                                                              searchFoodClickListener();
                                                            },
                                                            child: Container(
                                                              width: double.infinity,
                                                              padding: const EdgeInsets.symmetric(vertical: CAT_VETICAL_PADDING, horizontal: CAT_HORIZONTAL_PADDING),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(BORDER_RADIUS,),
                                                                color: CATEGORY_COLOR,
                                                              ),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [

                                                                  Image.asset(SEARCH_FOOD_PATH, width: SIZE_IMAGE_CAT, height: SIZE_IMAGE_CAT, color: DARK_PRIMARY_COLOR,),

                                                                  const SizedBox(height: CAT_LABEL_TOP_MARGIN,),

                                                                  const Text(SEARCH_FOOD_LABEL, style: TextStyle(fontWeight: FontWeight.bold, fontSize: FONT_CATS_LABEL, color: MACRO_COLOR))

                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )


                                                ],
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
                                                        requestLoggedFoods(_focusedDay);
                                                        setMacros(state.profile);
                                                      });
                                                    }else if(state is GetProfileErrorState){
                                                      _getProfileBloc.add(const GetProfileEvent.onReset());

                                                      Future.delayed(Duration.zero,(){
                                                        if(state.message == 'email not found'){
                                                          return Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => const LandingScreen(),
                                                            ),
                                                          );
                                                        }
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

                                          /**
                                           * Food Tab
                                           */
                                          Container(
                                            color: BACKGROUND_MACRO_TRACK_COLOR,
                                            child: Column(
                                              children: [


                                                /**
                                                 * today weight
                                                 */
                                                Visibility(
                                                  visible: false,
                                                  child: Container(
                                                    color: TODAY_WEIGHT_CONTAINER_COLOR,
                                                    padding: const EdgeInsets.all(12),
                                                    child: Row(
                                                        children: [
                                                          const Text('$TODAY_WEIGHT:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: DARK_PRIMARY_COLOR),),
                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                                            child: SizedBox(
                                                              width: 20,
                                                              height: 10,
                                                              child: TextField(
                                                                textAlign: TextAlign.center, // Set text alignment to center
                                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: DARK_PRIMARY_COLOR),
                                                                decoration: const InputDecoration(
                                                                  labelStyle: TextStyle(color: DARK_PRIMARY_COLOR), // Color of the label text
                                                                  enabledBorder: UnderlineInputBorder(
                                                                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR), // Color of the underline when enabled
                                                                  ),
                                                                  focusedBorder: UnderlineInputBorder(
                                                                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR), // Color of the underline when focused
                                                                  ),
                                                                ),
                                                                controller: _todayWeightController,
                                                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                inputFormatters: <TextInputFormatter>[
                                                                  FilteringTextInputFormatter.digitsOnly,
                                                                  FilteringTextInputFormatter.allow(numericRegExp),
                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                          const Text('Kg', style: TextStyle(fontWeight: FontWeight.bold, fontSize: FONT_WEIGH_INFO, color: DARK_PRIMARY_COLOR),),
                                                          Expanded(child: Container())
                                                        ]
                                                    ),
                                                  ),
                                                ),


                                                /**
                                                 * fab / click fab to start
                                                 */
                                                Expanded(
                                                  child: Stack(
                                                    children: [
                                                      Visibility(
                                                        visible: _foods.isEmpty,
                                                        child: Center(
                                                            child: Container(
                                                              margin: const EdgeInsets.all(64),

                                                              child: const Text(CLICK_FAB_TO_START, style: TextStyle(color: PRIMARY_COLOR, fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                                                            )
                                                        ),
                                                      ),

                                                      Visibility(
                                                          visible: _foods.isNotEmpty,
                                                          child: FoodsListUi(foodCalculator: FoodCalculator(visibleFoods: _foods), foods: _foods, onFoodsChanged: updateScreenAfterEatenFoodsChanges,
                                                            onFavoriteButtonClicked: addOrRemoveFavorite, foodsTypeRequested:  const [FoodType.groceryProduct, FoodType.meal],
                                                            foodBackGroundColor: DEFAULT_FOOD_BACKGROUND_COLOR, foodIcon: const Icon(Icons.fastfood, color: Colors.blueGrey,),
                                                            foodDetailScreenType: FoodDetailScreenType.LOGGED_FOOD_VIEW, foodsListScreen: FoodsListScreen.MAIN_SCREEN, macroEdition: _macroEdition,)
                                                      ),

                                                      Positioned(
                                                        bottom: FAB_MARGIN,
                                                        right: FAB_MARGIN,
                                                        child: FloatingActionButton(
                                                          backgroundColor: PRIMARY_COLOR,
                                                          onPressed: () {
                                                            searchFoodClickListener();
                                                          },
                                                          child: const Icon(Icons.add, color: Colors.white,),
                                                        ),
                                                      )
                                                    ],

                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),



                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Column(
                              children: [

                                const SizedBox(height: 16,),

                                BlocConsumer<GetLoggedFoodsBloc, GetLoggedFoodsState>(
                                    builder: (mcontext, state) {

                                      if (state is GetLoggedFoodsLoadingState) {
                                        return const GFLoader(
                                          type: GFLoaderType.circle,
                                          loaderColorOne: DARK_PRIMARY_COLOR,
                                          loaderColorTwo: DARK_PRIMARY_COLOR,
                                          loaderColorThree: DARK_PRIMARY_COLOR,
                                        );
                                      }else if(state is GetLoggedFoodsLoadedState){
                                        Future.delayed(Duration.zero,(){
                                          _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
                                          _macroEdition = state.loggedFoods.macroEdition;
                                          updateScreenWithNewLoggedFoods(state.loggedFoods.foods);
                                        });
                                        return Container();
                                      }else if(state is GetImmediateLoggedFoodsState){

                                      }else if(state is GetLoggedFoodsErrorState){
                                        Future.delayed(Duration.zero,(){
                                          return showErrorToast(context, state.message);
                                        });
                                      }
                                      return Container();
                                    },
                                    listener: (context, state){

                                    }
                                ),

                                BlocConsumer<LogFoodsBloc, LogFoodsState>(
                                    builder: (mcontext, state) {

                                      if (state is LogFoodsLoadingState) {
                                        return const GFLoader(
                                          type: GFLoaderType.circle,
                                          loaderColorOne: DARK_PRIMARY_COLOR,
                                          loaderColorTwo: DARK_PRIMARY_COLOR,
                                          loaderColorThree: DARK_PRIMARY_COLOR,
                                        );
                                      }else if(state is LogFoodsLoadedState){
                                        Future.delayed(Duration.zero,(){
                                          _logFoodsBloc.add(const LogFoodsEvent.onReset());
                                        });
                                      }else if(state is LogFoodsErrorState){
                                        Future.delayed(Duration.zero,(){
                                          return showErrorToast(context, state.message);
                                        });
                                      }
                                      return Container();
                                    },
                                    listener: (context, state){

                                    }
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ),
              ],
            ),
      ),
    );
  }


  void myFavoriteClickListener() async{
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MyFavoriteFoodsScreen(),
      ),
    );
  }

  void searchFoodClickListener() async{
     await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchFoodScreen(),
      ),
    );
  }



  void updateScreenWithNewLoggedFoods(List<Food> foods){
    setState(() {
      _foods= [];
      _foods.addAll(foods);
      deleteFoodsWithZeroCount(foods);
      calculateTotalTakenMacros();
    });
  }


  void setMacros(Profile profile){
    _getProfileBloc.add(const GetProfileEvent.onReset());

    setState(() {
      _calorieGoal = profile.dailyMacroGoal[0].isEmpty ? 0 : int.parse(profile.dailyMacroGoal[0]);
      _proteinGoal = profile.dailyMacroGoal[1].isEmpty ? 0 : int.parse(profile.dailyMacroGoal[1]);
      _carbGoal = profile.dailyMacroGoal[2].isEmpty ? 0 : int.parse(profile.dailyMacroGoal[2]);
      _fatGoal = profile.dailyMacroGoal[3].isEmpty ? 0 : int.parse(profile.dailyMacroGoal[3]);
    });

  }

  void logFoodsOfToday(){
    _logFoodsBloc.add(
        LogFoodsEvent.onLogFoods(_foods)
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

}





