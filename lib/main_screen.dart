
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/foods/presentation/screen/logged_foods_list_ui.dart';
import 'package:masterpie/feature/foods/presentation/screen/my_cook_book_screen.dart';
import 'package:masterpie/feature/user/presentation/screen/landing_screen.dart';
import 'package:masterpie/util/core/constant/messages_constants.dart';
import 'package:masterpie/util/design/color/app_colors.dart';
import 'package:masterpie/util/design/size/app_widget_size.dart';
import 'package:masterpie/util/design/text/app_assets.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'feature/foods/data/repository_impl/foods_repository_impl.dart';
import 'feature/foods/domain/model/food_model.dart';
import 'feature/foods/presentation/bloc/add_or_update_my_favorite_bloc/add_or_update_my_favorite_bloc.dart';
import 'feature/foods/presentation/bloc/add_or_update_my_favorite_bloc/state_event/add_or_update_my_favorite_state_event.dart';
import 'feature/foods/presentation/bloc/get_logged_foods_bloc/get_logged_foods_bloc.dart';
import 'feature/foods/presentation/bloc/get_logged_foods_bloc/state_event/get_logged_foods_state_event.dart';
import 'feature/foods/presentation/bloc/my_favorite_foods/my_favorite_foods_bloc.dart';
import 'feature/foods/presentation/bloc/my_favorite_foods/state_event/my_favorite_foods_state_event.dart';
import 'feature/foods/presentation/bloc/remove_from_favorite_bloc/remove_from_my_favorite_bloc.dart';
import 'feature/foods/presentation/bloc/remove_from_favorite_bloc/state_event/remove_from_favorite_state_event.dart';
import 'feature/foods/presentation/food_calculator/food_calculator.dart';
import 'feature/foods/presentation/screen/my_favorite_foods_list_ui.dart';
import 'feature/foods/presentation/screen/my_favorite_foods_screen.dart';
import 'feature/foods/presentation/screen/request_foods_posrtions_screen.dart';
import 'feature/foods/presentation/screen/search_food_screen.dart';
import 'feature/foods/presentation/screen/suggest_food_screen.dart';
import 'feature/foods/presentation/screen/ui_helper/logged_food_chip_widget.dart';
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


  List<Food> _addedMyFavorites= [];

  List<Food> _newMyFavorites= [];

  bool _macroEdition = false;

  double _totalTakenCalories= 0;
  double _totalTakenProteins= 0;
  double _totalTakenCarbs= 0;
  double _totalTakenFats= 0;

  late GetLoggedFoodsBloc _getLoggedFoodsBloc;
  late LogFoodsBloc _logFoodsBloc;
  late GetProfileBloc _getProfileBloc;
  late LogoutBloc _logoutBloc;
  late MyFavoriteFoodsBloc _myFavoriteFoodsBloc;
  late AddOrUpdateMyFavoriteBloc _addToMyFavoriteBloc;
  late RemoveFromMyFavoriteBloc _removeFromMyFavoriteBloc;

  late TextEditingController _todayWeightController;

  int _calorieGoal= 0;
  int _proteinGoal= 0;
  int _carbGoal = 0;
  int _fatGoal= 0;

  bool _isAddedFoodBannerOpen= false;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: TABS_SIZE, vsync: this);
    _todayWeightController= TextEditingController(text: '0');
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();
    _logFoodsBloc = context.read<LogFoodsBloc>();
    _getProfileBloc = context.read<GetProfileBloc>();
    _logoutBloc = context.read<LogoutBloc>();
    _myFavoriteFoodsBloc = context.read<MyFavoriteFoodsBloc>();
    _addToMyFavoriteBloc = context.read<AddOrUpdateMyFavoriteBloc>();
    _removeFromMyFavoriteBloc = context.read<RemoveFromMyFavoriteBloc>();
    _tabController.addListener(_handleTabSelection);

    _getProfileBloc.add(const GetProfileEvent.onReset());
    _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
    _logFoodsBloc.add(const LogFoodsEvent.onReset());

    requestMyFavoriteFoods();

    setMacroGoals();
    requestProfile();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  void addOrRemoveFavorite(Food food, bool addToFavorite){
    if(addToFavorite){
      _addToMyFavoriteBloc.add(
        AddOrUpdateMyFavoriteEvent.onAddToMyFavorite(
            food
        ),
      );
    }else{
      _removeFromMyFavoriteBloc.add(
        RemoveFromMyFavoriteEvent.onRemoveFromMyFavorite(
            food
        ),
      );
    }
  }

  void requestMyFavoriteFoods(){
    _myFavoriteFoodsBloc.add(
      const MyFavoriteFoodsEvent.onGetMyFavoriteFoods(
          FoodType.all,
          ''
      ),
    );
  }

  void requestMyFavoriteFoodsImmediately(){
    _myFavoriteFoodsBloc.add(
      const MyFavoriteFoodsEvent.onGetFavoriteFoodsImmediately(),
    );
  }

  void _handleTabSelection() {
    if(_tabController.index == 1){
      requestMyFavoriteFoodsImmediately();
    }else if(_tabController.index == 2){
      requestLoggedFoodsImmediately(_focusedDay);
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

  void requestLoggedFoodsImmediately(DateTime dateTime){
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    _getLoggedFoodsBloc.add(
        GetLoggedFoodsEvent.onGetImmediateLoggedFoods(formattedDate)
    );
  }


  void updateScreenAfterEatenFoodsChanges(List<Food> foods) {
    setState(() {
      _foods= [];
      _foods = foods;
      deleteFoodsWithZeroCount(foods);
      calculateTotalTakenMacros();
    });
    logFoodsOfToday(false);
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
      if(element.foodType == FoodType.groceryProduct){
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
      }else{
        for(int i = 0; i < element.servingIngredientsCount.length; i++){
          calorie= calorie + (double.parse(element.calorie[i]) * num.parse(element.servingIngredientsCount[i]));
          protein= protein + (double.parse(element.protein[i]) * num.parse(element.servingIngredientsCount[i]));
          carb= carb + (double.parse(element.carb[i]) * num.parse(element.servingIngredientsCount[i]));
          fat= fat + (double.parse(element.fat[i]) * num.parse(element.servingIngredientsCount[i]));
        }
      }
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
    final Uri url = Uri.parse('https://www.masterpieapp.com/credits');
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


    Color calorieProgressColor= PROGRESS_MACRO_COLOR;
    Color proteinProgressColor= PROGRESS_MACRO_COLOR;
    Color carbProgressColor= PROGRESS_MACRO_COLOR;
    Color fatProgressColor= PROGRESS_MACRO_COLOR;


    if(_totalTakenCalories == 0.0 && _calorieGoal == 0){
      calorieProgressColor= Colors.grey;
    }else{
      if(caloriePercent > 0.5 && caloriePercent < 0.8){
        calorieProgressColor= Colors.yellow;
      }else if(caloriePercent >= 0.8){
        calorieProgressColor= RED_ERROR_COLOR;
      }
    }


    if(_totalTakenProteins == 0.0 && _proteinGoal == 0){
      proteinProgressColor= Colors.grey;
    }else{
      if(proteinPercent > 0.5 && proteinPercent < 0.8){
        proteinProgressColor= Colors.yellow;
      }else if(proteinPercent >= 0.8){
        proteinProgressColor= RED_ERROR_COLOR;
      }
    }


    if(_totalTakenCarbs == 0.0 && _carbGoal == 0){
      carbProgressColor= Colors.grey;
    }else{
      if(carbPercent > 0.5 && carbPercent < 0.8){
        carbProgressColor= Colors.yellow;
      }else if(carbPercent >= 0.8){
        carbProgressColor= RED_ERROR_COLOR;
      }
    }


    if(_totalTakenFats == 0.0 && _fatGoal == 0){
      fatProgressColor= Colors.grey;
    }else{
      if(fatPercent > 0.5 && fatPercent < 0.8){
        fatProgressColor= Colors.yellow;
      }else if(fatPercent >= 0.8){
        fatProgressColor= RED_ERROR_COLOR;
      }
    }


    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
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
              //todo uncomment when payment feature should be available
              // ListTile(
              //   leading: const Icon(Icons.credit_card),
              //   title: const Text(YOUR_PLAN_LABEL, style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),),
              //   onTap: () {
              //     _scaffoldKey.currentState?.openEndDrawer();
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const UserPlanScreen(),
              //       ),
              //     );
              //   },
              // ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(LOGOUT_LABEL, style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),),
                onTap: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                  showLogoutDialog(context);
                },
              ),

              const Divider(),

              ListTile(
                leading: const Icon(Icons.attribution),
                title: const Text(CREDITS_LABEL, style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),),
                onTap: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                  showCredits();
                },
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
                                      progressColor: calorieProgressColor,
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
                                      progressColor: proteinProgressColor,
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
                                      progressColor: carbProgressColor,
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
                                      progressColor: fatProgressColor,
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
                                      Tab(icon: Icon(Icons.favorite, color: TAB_BAR_ICON_COLOR,)),
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
                                                           * my cookBook
                                                           */
                                                          Expanded(
                                                            child: GestureDetector(
                                                              onTap: (){
                                                                myCookBookClickListener();
                                                              },
                                                              child: Container(
                                                                width: double.infinity,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(BORDER_RADIUS,),
                                                                  color: CATEGORY_COLOR,
                                                                ),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [

                                                                    Image.asset(FAVORITE_FOOD_PATH, width: SIZE_IMAGE_CAT, height: SIZE_IMAGE_CAT, color: DARK_PRIMARY_COLOR,),

                                                                    const SizedBox(height: CAT_LABEL_TOP_MARGIN,),

                                                                    const Text(MY_COOKBOOK_LABEL,
                                                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: FONT_CATS_LABEL, color: MACRO_COLOR)
                                                                    )

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
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(BORDER_RADIUS,),
                                                                  color: CATEGORY_COLOR,
                                                                ),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [

                                                                    Image.asset(SEARCH_FOOD_PATH, width: SIZE_IMAGE_CAT, height: SIZE_IMAGE_CAT, color: DARK_PRIMARY_COLOR,),

                                                                    const SizedBox(height: CAT_LABEL_TOP_MARGIN,),

                                                                    const Text(SEARCH_GROCERY_LABEL, style: TextStyle(fontWeight: FontWeight.bold, fontSize: FONT_CATS_LABEL, color: MACRO_COLOR))

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
                                                         * request foods portion
                                                         */
                                                        Expanded(
                                                          child: GestureDetector(
                                                            onTap: (){
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => const RequestFoodsPortionsScreen(),
                                                                ),
                                                              );
                                                            },
                                                            child: Container(
                                                              width: double.infinity,
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
                                           * My favorite tab
                                           */
                                          Stack(
                                            children: [
                                              SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    MyFavoritesFoodsListUi(foodCalculator: FoodCalculator(visibleFoods: _newMyFavorites), foods: _newMyFavorites, onFoodsChanged: updateChangedFavoriteFoods,
                                                      onFavoriteButtonClicked: addOrRemoveFavorite, foodsTypeRequested: const [FoodType.groceryProduct, FoodType.meal],
                                                      foodBackGroundColor: MY_FAVORITE_FOOD_BACKGROUND_COLOR, foodIcon: const Icon(Icons.favorite, color: RED_ERROR_COLOR,),
                                                      macroEdition: true,),
                                                  ],
                                                ),
                                              ),

                                              logFavoriteFoodButton(),

                                              BlocConsumer<MyFavoriteFoodsBloc, MyFavoriteFoodsState>(
                                                  builder: (context, state) {
                                                    if (state is MyFavoriteFoodsLoadingState) {
                                                      return const GFLoader(
                                                        type: GFLoaderType.circle,
                                                        loaderColorOne: DARK_PRIMARY_COLOR,
                                                        loaderColorTwo: DARK_PRIMARY_COLOR,
                                                        loaderColorThree: DARK_PRIMARY_COLOR,
                                                      );

                                                    }else if(state is MyFavoriteFoodsLoadedState){
                                                      Future.delayed(Duration.zero,(){
                                                        _myFavoriteFoodsBloc.add(const MyFavoriteFoodsEvent.onReset());
                                                        checkIfFavoriteFoodsAddedBefore(state.foods);
                                                      });
                                                    }else if(state is MyFavoriteFoodsLoadedImmediatelyState){
                                                      Future.delayed(Duration.zero,(){
                                                        _myFavoriteFoodsBloc.add(const MyFavoriteFoodsEvent.onReset());
                                                        checkIfFavoriteFoodsAddedBefore(state.foods);
                                                      });
                                                    }else if(state is MyFavoriteFoodsErrorState){
                                                      _myFavoriteFoodsBloc.add(const MyFavoriteFoodsEvent.onReset());
                                                      Future.delayed(Duration.zero,(){
                                                        return showErrorToast(context, state.message);
                                                      });
                                                    }
                                                    return Container();
                                                  },
                                                  listener: (context, state){

                                                  }
                                              ),
                                              BlocConsumer<AddOrUpdateMyFavoriteBloc, AddOrUpdateMyFavoriteState>(
                                                  builder: (context, state) {
                                                    return Container(height: 1,);
                                                  },
                                                  listener: (context, state){
                                                    if(state is AddOrUpdateMyFavoriteLoadedState){
                                                      requestMyFavoriteFoods();
                                                    }else if(state is AddOrUpdateMyFavoriteErrorState){
                                                      _addToMyFavoriteBloc.add(const AddOrUpdateMyFavoriteEvent.onReset());
                                                      Future.delayed(Duration.zero,(){
                                                        if(state.message == ERROR_FREE_USER_FAVORITE_FOOD_NOT_ALLOWED){
                                                          return showUpgradePopupForFreeUsers(context, UPGRADE_MSG_FAVORITE_FOOD);
                                                        }
                                                        return showErrorToast(context, state.message);
                                                      });
                                                    }else{
                                                    }
                                                  }
                                              ),
                                              BlocConsumer<RemoveFromMyFavoriteBloc, RemoveFromMyFavoriteState>(
                                                  builder: (context, state) {
                                                    if(state is RemoveFromMyFavoriteLoadedState){
                                                      Future.delayed(Duration.zero,(){
                                                        _removeFromMyFavoriteBloc.add(const RemoveFromMyFavoriteEvent.onReset());
                                                        requestMyFavoriteFoods();
                                                        showSuccessToast(context, REMOVED_FROM_FAVORITE_SUCCESSFULLY);
                                                      });
                                                    }
                                                    return Container(height: 1,);
                                                  },
                                                  listener: (mcontext, state){
                                                  }
                                              ),



                                              Visibility(
                                                visible: _newMyFavorites.isEmpty,
                                                child: Center(
                                                    child: Container(
                                                      margin: const EdgeInsets.all(64),

                                                      child: const Text(EMPTY_FAVORITE_LABEL, style: TextStyle(color: PRIMARY_COLOR, fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                                                    )
                                                ),
                                              ),

                                            ],
                                          ),




                                          /**
                                           * Macro tracking Tab
                                           */
                                          Container(
                                            color: Colors.white,
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
                                                          child: LoggedFoodsListUi(foodCalculator: FoodCalculator(visibleFoods: _foods), foods: _foods, onFoodsChanged: updateScreenAfterEatenFoodsChanges,
                                                            onFavoriteButtonClicked: addOrRemoveFavorite, foodsTypeRequested:  const [FoodType.groceryProduct, FoodType.meal],
                                                            foodBackGroundColor: DEFAULT_FOOD_BACKGROUND_COLOR, foodIcon: const Icon(Icons.fastfood, color: Colors.blueGrey,),
                                                           macroEdition: _macroEdition,)
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
                                        Future.delayed(Duration.zero,(){
                                          _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
                                          _macroEdition = state.loggedFoods.macroEdition;
                                          updateScreenWithNewLoggedFoods(state.loggedFoods.foods);
                                        });
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
                                        _logFoodsBloc.add(const LogFoodsEvent.onReset());
                                        Future.delayed(Duration.zero,(){
                                          showSuccessToast(context, LOG_UPDATED_SUCCESSFULLY);
                                          setState(() {
                                            _addedMyFavorites.clear();
                                            for(int i = 0; i < _newMyFavorites.length; i++){
                                              if(_newMyFavorites[i].count > 0){
                                                _newMyFavorites[i]= _newMyFavorites[i].copyWith(count: 0);
                                              }
                                            }
                                            requestLoggedFoodsImmediately(_focusedDay);
                                          });
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

  Widget logFavoriteFoodButton(){
    bool isAnyFoodAdded= false;
    List<Food> foodsLog = [];
    _addedMyFavorites.forEach((element) {
      if(element.count > 0){
        isAnyFoodAdded= true;
        foodsLog.add(element);
      }
    });

    return Visibility(
      visible: isAnyFoodAdded,
      child: Positioned(
        bottom: 16,
        left: 16,
        right: 16,
        child: Column(
          children: [

            /// up arrow
            GestureDetector(
              onTap: (){
                if(_isAddedFoodBannerOpen){
                  setState(() {
                    _isAddedFoodBannerOpen= false;
                  });
                }else{
                  setState(() {
                    _isAddedFoodBannerOpen= true;
                  });
                }
              },

              child: Column(
                children: [
                  Visibility(
                    visible: !_isAddedFoodBannerOpen,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: LOG_FOOD_BTN_COLOR
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_drop_up,
                          color: DARK_PRIMARY_COLOR,
                        ),
                      ),
                    ),
                  ),

                  Visibility(
                      visible: _isAddedFoodBannerOpen,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: LOG_FOOD_BTN_COLOR
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              width: double.infinity,
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: DARK_PRIMARY_COLOR,
                              ),
                            ),


                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Wrap(
                                  spacing: 8.0,
                                  children: List.generate(
                                    foodsLog.length,
                                        (index) => LoggedFoodChipWidget(
                                      text: foodsLog[index].name,
                                      onRemove: () {
                                        setState(() {

                                          for(int i = 0; i < _newMyFavorites.length; i++){
                                            if(_newMyFavorites[i].id == foodsLog[index].id){
                                              _newMyFavorites[i]= _newMyFavorites[i].copyWith(count: 0);
                                            }
                                          }


                                          for(int i = 0; i < _addedMyFavorites.length; i++){
                                            if(_addedMyFavorites[i].id == foodsLog[index].id){
                                              _addedMyFavorites[i]= _addedMyFavorites[i].copyWith(count: 0);
                                            }
                                          }

                                          updateChangedFavoriteFoods(_newMyFavorites);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      )
                  )
                ],
              ),
            ),

            /// log food button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: LOG_FOOD_BTN_COLOR
                  ),
                  onPressed: () {
                    logFoodsOfToday(true);
                  },
                  child: const Text(SUBMIT_LOG_FOODS_LABEL,
                    style: TextStyle( color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),)
              ),
            ),
          ],
        ),
      ),
    );
  }



  void checkIfFavoriteFoodsAddedBefore(List<Food> foods){
    setState(() {
      List<Food> favorites = [];
      foods.forEach((element) {
        List<Food> foodsExisted = _addedMyFavorites.where((addedFavorite) => element.id == addedFavorite.id).toList();
        if(foodsExisted.isEmpty){
          favorites.add(element);
        }else{
          for(int i = 0; i < _addedMyFavorites.length; i++){
            if(_addedMyFavorites[i].id == element.id){
              favorites.add(_addedMyFavorites[i]);
            }
          }
        }
      });
      _newMyFavorites = favorites;
    });
  }


  void updateChangedFavoriteFoods(List<Food> foods) {
    setState(() {

      _newMyFavorites = foods;

      List<Food> myFavorites = [];
      _newMyFavorites.forEach((element) {
        List<Food> foodsExisted = _addedMyFavorites.where((addedFavorite) => element.id == addedFavorite.id).toList();
        if(foodsExisted.isEmpty && element.count > 0){
          myFavorites.add(element);
        }else{
          for(int i = 0; i < _addedMyFavorites.length; i++){
            if(_addedMyFavorites[i].id == element.id){
              _addedMyFavorites[i] = _addedMyFavorites[i].copyWith(
                  count: element.count,
                  units: element.units,
                  servingAmounts: element.servingAmounts,
                  calorie: element.calorie,
                  protein: element.protein,
                  carb: element.carb,
                  fat: element.fat,
                  unit: element.unit,
                  servingAmount: element.servingAmount
              );
            }
          }
        }
      });
      _addedMyFavorites.addAll(myFavorites);
    });
  }

  void myCookBookClickListener() async{
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyCookBookScreen(),
      ),
    );
  }

  void searchFoodClickListener() async{
     await Navigator.push(
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

  void logFoodsOfToday(bool isSubmitLogFavoriteButtonClicked){
    List<Food> foods = [];

    foods.addAll(_foods);

    if(isSubmitLogFavoriteButtonClicked){
      foods.addAll(_addedMyFavorites);
    }

    _logFoodsBloc.add(
        LogFoodsEvent.onLogFoods(foods)
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





