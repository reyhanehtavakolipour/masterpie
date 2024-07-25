
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/foods/presentation/bloc/auto_generate_bloc/auto_generate_foods_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/auto_generate_bloc/state_event/auto_generate_foods_state_event.dart';
import 'package:masterpie/feature/foods/presentation/screen/logged_foods_list_ui.dart';
import 'package:masterpie/feature/foods/presentation/screen/manual_meal_macro_wizard_dialog.dart';
import 'package:masterpie/feature/foods/presentation/screen/my_cook_book_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/search_recipe_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/generic_food_detail_macro_wizard_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/request_wizard_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model_converter.dart';
import 'package:masterpie/feature/user/presentation/screen/onboarding_screen.dart';
import 'package:masterpie/util/core/constant/api_constant.dart';
import 'package:masterpie/util/core/constant/hive_constants.dart';
import 'package:masterpie/util/core/constant/messages_constants.dart';
import 'package:masterpie/util/core/constant/sqflite_constants.dart';
import 'package:masterpie/util/core/di/service_locator.dart';
import 'package:masterpie/util/core/helper/print.dart';
import 'package:masterpie/util/core/helper/request_api.dart';
import 'package:masterpie/util/design/color/app_colors.dart';
import 'package:masterpie/util/design/helper_functions/video_player_screen.dart';
import 'package:masterpie/util/design/size/app_widget_size.dart';
import 'package:masterpie/util/design/text/app_assets.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'feature/foods/data/repository_impl/foods_repository_impl.dart';
import 'feature/foods/domain/model/food_model.dart';
import 'feature/foods/domain/model/logged_foods_model.dart';
import 'feature/foods/presentation/bloc/get_logged_foods_bloc/get_logged_foods_bloc.dart';
import 'feature/foods/presentation/bloc/get_logged_foods_bloc/state_event/get_logged_foods_state_event.dart';
import 'feature/foods/presentation/bloc/suggest_portion_bloc/state_event/suggest_portion_state_event.dart';
import 'feature/foods/presentation/bloc/suggest_portion_bloc/suggest_portion_bloc.dart';
import 'feature/foods/presentation/food_calculator/food_calculator.dart';
import 'feature/foods/presentation/screen/manual_food_macro_wizard_screen.dart';
import 'feature/foods/presentation/screen/my_favorite_foods_screen.dart';
import 'feature/foods/presentation/screen/search_grocery_macro_wizard_screen.dart';
import 'feature/foods/presentation/screen/search_grocery_screen.dart';
import 'feature/foods/presentation/screen/search_recipe_macro_wizard_screen.dart';
import 'feature/foods/presentation/screen/suggested_different_foods_combination_screen.dart';
import 'feature/foods/presentation/screen/ui_helper/custom_radio_button.dart';
import 'feature/foods/presentation/screen/ui_helper/foods_macro_list_ui.dart';
import 'feature/foods/presentation/screen/ui_helper/model/food_detail_argument_model.dart';
import 'feature/foods/presentation/screen/ui_helper/model/food_detail_macro_wizard_argument_model.dart';
import 'feature/foods/presentation/screen/ui_helper/wait_popup.dart';
import 'feature/foods/presentation/screen/view_logged_food_screen.dart';
import 'feature/user/data/local/datasource/user_hive_keyvalue_datasource.dart';
import 'feature/user/domain/model/profile_model.dart';
import 'feature/user/presentation/bloc/get_profile_bloc/get_profile_bloc.dart';
import 'feature/user/presentation/bloc/get_profile_bloc/state_event/get_profile_state_event.dart';
import 'feature/user/presentation/bloc/logout_bloc/logout_bloc.dart';
import 'feature/user/presentation/bloc/logout_bloc/state_event/logout_state_event.dart';
import 'feature/user/presentation/screen/calculate_user_macro_goal_screen.dart';
import 'feature/user/presentation/screen/landing_screen.dart';
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


  bool _userLoggedIn= false;

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

  final _key = GlobalKey<ExpandableFabState>();


  //wizard

  late RequestWizardArgumentModel _requestWizardArgumentModel;

  bool _addedFoodsVisible= true;


  late TextEditingController _proteinPercentageController;
  late TextEditingController _carbPercentageController;
  late TextEditingController _fatPercentageController;



  late TextEditingController _minCalorieGoalController;
  late TextEditingController _minProteinGoalController;
  late TextEditingController _minCarbGoalController;
  late TextEditingController _minFatGoalController;

  late TextEditingController _maxCalorieGoalController;
  late TextEditingController _maxProteinGoalController;
  late TextEditingController _maxCarbGoalController;
  late TextEditingController _maxFatGoalController;


  final List<String> _restrictionOptions= [NONE_LABEL, PORTION_MIN_CALORIE, PORTION_MAX_CALORIE, PORTION_MIN_PROTEIN, PORTION_MAX_PROTEIN,
    PORTION_MIN_CARB, PORTION_MAX_CARB, PORTION_MIN_FAT, PORTION_MAX_FAT];

  int _selectedRestrictionOption= -1;


  String _macroGoalInputType= BY_PERCENTAGE_LABEL;


  bool _step_1_expanded= false;


  late SuggestPortionsBloc _suggestPortionsBloc;

  late AutoGenerateFoodsBloc _autoGenerateFoodsBloc;


  List<Food> _mainDishFoods= [];
  List<Food> _sideDishFoods= [];
  List<String> _mainDishTypes= [];
  List<String> _sideDishTypes= [];

  // showcase tutorial
  final GlobalKey _tutorialOne = GlobalKey();
  final GlobalKey _tutorialTwo = GlobalKey();
  final GlobalKey _tutorialThree = GlobalKey();
  final GlobalKey _tutorialFour = GlobalKey();



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

    _proteinPercentageController= TextEditingController(text: '30');
    _carbPercentageController= TextEditingController(text: '40');
    _fatPercentageController= TextEditingController(text: '30');
    _minCalorieGoalController= TextEditingController(text: '0');
    _minProteinGoalController= TextEditingController(text: '0');
    _minCarbGoalController= TextEditingController(text: '0');
    _minFatGoalController= TextEditingController(text: '0');
    _maxCalorieGoalController= TextEditingController(text: '0');
    _maxProteinGoalController= TextEditingController(text: '0');
    _maxCarbGoalController= TextEditingController(text: '0');
    _maxFatGoalController= TextEditingController(text: '0');
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();
    _suggestPortionsBloc = context.read<SuggestPortionsBloc>();
    _autoGenerateFoodsBloc = context.read<AutoGenerateFoodsBloc>();
    _suggestPortionsBloc.add(const SuggestFoodsPortionEvent.onReset());
    _requestWizardArgumentModel= RequestWizardArgumentModel();

    checkIfFirstTimeAppOpened();
    checkIfUserCameFromOnBoard();
    requestProfile();

  }


  void _autoGenerateFoodsForDay(){
    _autoGenerateFoodsBloc.add(
        const AutoGenerateFoodsEvent.onAutoGenerateFoodsForDay()
    );
  }

  void _autoGenerateFood(String type, int index, bool isMainDish){
    _autoGenerateFoodsBloc.add(
       AutoGenerateFoodsEvent.onAutoGenerateFood(type, index, isMainDish)
    );
  }

  void checkIfUserCameFromOnBoard(){
    // auto generate meals for macro diet wizard if user just completed the onboard
    if(widget.isFromOnboard == true){
      Future.delayed(Duration.zero, () {
        _autoGenerateFoodsForDay();
      });
    }
  }


  void _showTutorial(){
    Future.delayed(Duration.zero,(){
      setState(() {
        ShowCaseWidget.of(context)
            .startShowCase([_tutorialOne, _tutorialTwo, _tutorialThree, _tutorialFour]);
      });
    });
  }


  void checkIfFirstTimeAppOpened() async{
    final userHiveDataSource = serviceLocator<UserHiveDataSource>();
    int firstTime = await userHiveDataSource.getInt(FIRST_TIME_OPEN_APP);
    if(firstTime == 0){
      userHiveDataSource.putInt(FIRST_TIME_OPEN_APP, 1);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LandingScreen(),
        ),
      );
    }
  }




  void _switchTab(int index) {
    _tabController.animateTo(index);
  }



  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  void onLoggedFoodClicked(Food food){
    FoodDetailArgumentModel argumentModel = FoodDetailArgumentModel(
        food: checkFoodParameters(food),
        macroEdition: true
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewLoggedFoodScreen(foodDetailArgumentModel: argumentModel,),
      ),
    );
  }



  Food checkFoodParameters(Food food){
    List<String> ingredients = [];
    ingredients.addAll(food.ingredients);
    ingredients.removeWhere((item) => item.isEmpty);


    List<String> calorie = [];
    calorie.addAll(food.calorie);
    calorie.removeWhere((item) => item.isEmpty);


    List<String> protein = [];
    protein.addAll(food.protein);
    protein.removeWhere((item) => item.isEmpty);


    List<String> carb = [];
    carb.addAll(food.carb);
    carb.removeWhere((item) => item.isEmpty);


    List<String> fat = [];
    fat.addAll(food.fat);
    fat.removeWhere((item) => item.isEmpty);


    List<String> servingUnits = [];
    servingUnits.addAll(food.units);
    servingUnits.removeWhere((item) => item.isEmpty);


    List<String> servingIngredientCounts = [];
    servingIngredientCounts.addAll(food.servingIngredientsCount);
    servingIngredientCounts.removeWhere((item) => item.isEmpty);


    return food.copyWith(
        ingredients: ingredients,
        calorie:  calorie,
        protein: protein,
        carb: carb,
        fat: fat,
        units: servingUnits,
        servingIngredientsCount: servingIngredientCounts
    );
  }

  void _handleTabSelection() {
    if(_tabController.index == 2){
      requestLoggedFoodsImmediately(DateTime.now());
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
      if(element.foodType == FoodType.groceryProduct){

        calorie= double.parse(element.calorie[0]);
        protein= double.parse(element.protein[0]);
        carb= double.parse(element.carb[0]);
        fat= double.parse(element.fat[0]);

      }else{
        if(element.ingredients.length == element.calorie.length){
          for(int i = 0; i < element.servingIngredientsCount.length; i++){
            calorie= calorie + (double.parse(element.calorie[i]) * num.parse(element.servingIngredientsCount[i]));
            protein= protein + (double.parse(element.protein[i]) * num.parse(element.servingIngredientsCount[i]));
            carb= carb + (double.parse(element.carb[i]) * num.parse(element.servingIngredientsCount[i]));
            fat= fat + (double.parse(element.fat[i]) * num.parse(element.servingIngredientsCount[i]));
          }
        }else{
          calorie= calorie + double.parse(element.calorie[0]);
          protein= protein + double.parse(element.protein[0]);
          carb= carb + double.parse(element.carb[0]);
          fat= fat + double.parse(element.fat[0]);
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
    requestLoggedFoods(DateTime.now());
  }

  void showMacroGoalsPopup(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MacroGoalsPopup(calorie: _calorieGoal.toString(), protein: _proteinGoal.toString(),
          carb: _carbGoal.toString(), fat: _fatGoal.toString(), onMacroGoalUpdated: onUpdatedGoalMacrosFromDialog,
          onCalculateMacroClicked: onCalculateMacroClicked);
      },
    );
  }

  void onCalculateMacroClicked(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CalculateUserMacroGoalScreen(),
      ),
    ).then((result) {
      setMacroGoals(result);
      requestLoggedFoods(DateTime.now());
    });
  }


  void onDietClicked(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(isOnBoard: false,),
      ),
    );
  }

  void showContactPage() async{
    final Uri url = Uri.parse(CONTACT_MASTERPIE);
    await launchUrl(url);
  }

  void showPrivacy() async{
    final Uri url = Uri.parse(PRIVACY_MASTERPIE);
    await launchUrl(url);
  }

  void showCredits() async{
    final Uri url = Uri.parse(CREDIT_MASTERPIE);
    await launchUrl(url);
  }


  @override
  Widget build(BuildContext context) {
    double caloriePercent = 0;
    if (_calorieGoal != 0) {
      caloriePercent = double.parse((_totalTakenCalories / _calorieGoal).toStringAsFixed(2));
    } else {
      caloriePercent = 0;
    }
    if(caloriePercent> 1.0){
      caloriePercent= 1.0;
    }


    double proteinPercent = 0;
    if (_proteinGoal != 0) {
      proteinPercent = double.parse((_totalTakenProteins / _proteinGoal).toStringAsFixed(2));
    } else {
      proteinPercent = 0;
    }
    if(proteinPercent> 1.0){
      proteinPercent= 1.0;
    }

    double carbPercent = 0;
    if (_carbGoal != 0) {
      carbPercent = double.parse((_totalTakenCarbs / _carbGoal).toStringAsFixed(2));
    } else {
      carbPercent = 0;
    }
    if(carbPercent> 1.0){
      carbPercent= 1.0;
    }

    double fatPercent = 0;
    if (_fatGoal != 0) {
      fatPercent = double.parse((_totalTakenFats / _fatGoal).toStringAsFixed(2));
    } else {
      fatPercent = 0;
    }
    if(fatPercent> 1.0){
      fatPercent= 1.0;
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
        backgroundColor: DARK_PRIMARY_COLOR,
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                /**
                 * date
                 */
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
              Showcase(
                key: _tutorialOne,
                title: TUTORIAL_STEP_1_TITLE,
                description: TUTORIAL_STEP_1_DESC,
                titlePadding: const EdgeInsets.all(16),
                titleTextStyle: const TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 18, fontWeight: FontWeight.bold, color: GREEN_COLOR),
                descriptionPadding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                targetBorderRadius: const BorderRadius.all(Radius.circular(BORDER_RADIUS)),

                child: GestureDetector(
                    onTap: (){
                      _showTutorial();
                    },
                    child: const Icon(Icons.info_outline, color: Colors.white,)
                ),
              )
            ],
          )
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
              Visibility(
                visible: _userLoggedIn,
                child: ListTile(
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
              ),
              ListTile(
                leading: const Icon(Icons.menu_book),
                title: const Text(MY_COOKBOOK_LABEL, style: TextStyle( fontSize: 14, color: DARK_PRIMARY_COLOR),),
                onTap: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                  myCookBookClickListener();
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text(MY_FAVORITE_LABEL, style: TextStyle( fontSize: 14, color: DARK_PRIMARY_COLOR),),
                onTap: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                  myFavoriteFoodsClickListener();
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
                visible: _userLoggedIn,
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
        body: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 0.0,
                    floating: true,
                    pinned: true,
                    backgroundColor: DARK_PRIMARY_COLOR,
                    flexibleSpace: FlexibleSpaceBar(
                      background: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints) {
                          double height = constraints.biggest.height;
                          return  Container();
                        },
                      ),
                    ),
                    bottom:  PreferredSize(
                      preferredSize: const Size.fromHeight(kToolbarHeight),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: MASTERPIE_YELLOW_COLOR,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        child: TabBar(
                          controller: _tabController,
                          indicatorColor: TAB_BAR_ICON_COLOR,
                          tabs:  [
                            Tab(icon: IconButton(icon: Image.asset(SUGGEST_FOOD_PATH, color: DARK_PRIMARY_COLOR), onPressed: (){_switchTab(0);})),
                            Tab(icon: IconButton(icon: Image.asset(MEASURE_PATH, color: DARK_PRIMARY_COLOR), onPressed: (){_switchTab(1);})),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: Stack(
                children: [
                  TabBarView(
                    controller: _tabController,
                    children: [


                      /**
                       * macro diet wizard Tab
                       */
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: Column(
                          children: [


                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [

                                    /// total macro goal ranges
                                    _totalMacroGoalsWizard(),

                                    const SizedBox(height: 16,),

                                    /// added foods part
                                    _addedFoodsWizard(),

                                    const SizedBox(height: 200,),

                                  ],
                                ),
                              ),

                            ),

                            calculatePortionsButton(),

                          ],
                        ),
                      ),


                      /**
                       * Macro tracking Tab
                       */
                      Scaffold(
                        body: SingleChildScrollView(
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
                               * logged foods
                               */
                              Container(
                                color: DARK_PRIMARY_COLOR,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    const SizedBox(height: 24,),


                                    const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12),
                                        child: Text('$YOUR_LOGGED_FOODS:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),)
                                    ),

                                    const SizedBox(height: 8,),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        /// calorie
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: (){
                                              showMacroGoalsPopup(context);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(BORDER_RADIUS),
                                                border: Border.all(
                                                  color: LIGHT_GREY_COLOR,
                                                  width: 0.25,
                                                ),
                                              ),
                                              padding: const EdgeInsets.all(16),
                                              margin: const EdgeInsets.symmetric(vertical: 16),
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
                                                    const SizedBox(height: 4,),
                                                    Container(
                                                      margin: const EdgeInsets.only(top: MACRO_LABEL_TOP_MARGIN),
                                                      child: const Text(
                                                        CALORIE_LABEL,
                                                        textAlign: TextAlign.center,
                                                        style:
                                                        TextStyle(fontWeight: FontWeight.bold, fontSize: MACRO_LABEL_FONT_SIZE, color: MASTERPIE_YELLOW_COLOR),
                                                      ),
                                                    ),

                                                    const SizedBox(height: 6,),

                                                    Text(
                                                      '$_totalTakenCalories/$_calorieGoal',
                                                      textAlign: TextAlign.center,
                                                      style:
                                                      const TextStyle(fontWeight: FontWeight.bold, fontSize: MACRO_LABEL_FONT_SIZE, color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(width: 8,),

                                        /// protein
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: (){
                                              showMacroGoalsPopup(context);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(BORDER_RADIUS),
                                                border: Border.all(
                                                  color: LIGHT_GREY_COLOR,
                                                  width: 0.25,
                                                ),
                                              ),
                                              margin: const EdgeInsets.symmetric(vertical: 16),
                                              padding: const EdgeInsets.all(16),
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
                                                    const SizedBox(height: 4,),
                                                    Container(
                                                      margin: const EdgeInsets.only(top: MACRO_LABEL_TOP_MARGIN),
                                                      child: const Text(
                                                        PROTEIN_LABEL,
                                                        textAlign: TextAlign.center,
                                                        style:
                                                        TextStyle(fontWeight: FontWeight.bold, fontSize: MACRO_LABEL_FONT_SIZE, color: MASTERPIE_YELLOW_COLOR),
                                                      ),
                                                    ),

                                                    const SizedBox(height: 6,),

                                                    Text(
                                                      '$_totalTakenProteins/$_proteinGoal',
                                                      textAlign: TextAlign.center,
                                                      style:
                                                      const TextStyle(fontWeight: FontWeight.bold, fontSize: MACRO_LABEL_FONT_SIZE, color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(width: 8,),

                                        /// carb
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: (){
                                              showMacroGoalsPopup(context);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(BORDER_RADIUS),
                                                border: Border.all(
                                                  color: LIGHT_GREY_COLOR,
                                                  width: 0.25,
                                                ),
                                              ),
                                              margin: const EdgeInsets.symmetric(vertical: 16),
                                              padding: const EdgeInsets.all(16),
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
                                                    const SizedBox(height: 4,),
                                                    Container(
                                                      margin: const EdgeInsets.only(top: MACRO_LABEL_TOP_MARGIN),
                                                      child: const Text(
                                                        CARB_LABEL,
                                                        textAlign: TextAlign.center,
                                                        style:
                                                        TextStyle(fontWeight: FontWeight.bold, fontSize: MACRO_LABEL_FONT_SIZE, color: MASTERPIE_YELLOW_COLOR),
                                                      ),

                                                    ),

                                                    const SizedBox(height: 6,),

                                                    Text(
                                                      '$_totalTakenCarbs/$_carbGoal',
                                                      textAlign: TextAlign.center,
                                                      style:
                                                      const TextStyle(fontWeight: FontWeight.bold, fontSize: MACRO_LABEL_FONT_SIZE, color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(width: 8,),

                                        /// fat
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: (){
                                              showMacroGoalsPopup(context);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(BORDER_RADIUS),
                                                border: Border.all(
                                                  color: LIGHT_GREY_COLOR,
                                                  width: 0.25,
                                                ),
                                              ),
                                              margin: const EdgeInsets.symmetric(vertical: 16),
                                              padding: const EdgeInsets.all(16),
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
                                                    const SizedBox(height: 4,),
                                                    Container(
                                                      margin: const EdgeInsets.only(top: MACRO_LABEL_TOP_MARGIN),
                                                      child: const Text(
                                                        FAT_LABEL,
                                                        textAlign: TextAlign.center,
                                                        style:
                                                        TextStyle(fontWeight: FontWeight.bold, fontSize: MACRO_LABEL_FONT_SIZE, color: MASTERPIE_YELLOW_COLOR),
                                                      ),
                                                    ),

                                                    const SizedBox(height: 6,),

                                                    Text(
                                                      '$_totalTakenFats/$_fatGoal',
                                                      textAlign: TextAlign.center,
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

                                    const SizedBox(height: 8,),

                                  ],
                                ),
                              ),


                              Visibility(
                                visible: _foods.isEmpty,
                                child: Center(
                                    child: Container(
                                      margin: const EdgeInsets.all(64),

                                      child: const Text(CLICK_FAB_TO_START, style: TextStyle(color: DARK_GREY_COLOR, fontSize: 13, fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
                                    )
                                ),
                              ),

                              Visibility(
                                  visible: _foods.isNotEmpty,
                                  child: LoggedFoodsListUi(foodCalculator: FoodCalculator(visibleFoods: _foods), foods: _foods, onFoodsChanged: updateScreenAfterEatenFoodsChanges,
                                    onFavoriteButtonClicked: addOrRemoveFavorite, onLoggedFoodClicked: onLoggedFoodClicked, foodsTypeRequested:  const [FoodType.groceryProduct, FoodType.meal],
                                    foodBackGroundColor: DEFAULT_FOOD_BACKGROUND_COLOR, foodIcon: const Icon(Icons.fastfood, color: Colors.blueGrey,),
                                    macroEdition: _macroEdition,)
                              ),

                            ],
                          ),
                        ),
                        floatingActionButtonLocation: ExpandableFab.location,
                        floatingActionButton: ExpandableFab(
                          key: _key,
                          type: ExpandableFabType.up,
                          // pos: ExpandableFabPos.left,
                          childrenOffset: const Offset(0, 20),
                          // fanAngle: 40,
                          distance: 70,
                          openButtonBuilder: RotateFloatingActionButtonBuilder(
                            child: const Icon(Icons.add),
                            fabSize: ExpandableFabSize.regular,
                            foregroundColor: Colors.white,
                            backgroundColor: DARK_PRIMARY_COLOR,
                            shape: const CircleBorder(),
                            angle: 3.14 * 2,
                          ),
                          closeButtonBuilder: FloatingActionButtonBuilder(
                            size: 56,
                            builder: (BuildContext context, void Function()? onPressed,
                                Animation<double> progress) {
                              return Container(
                                decoration: const BoxDecoration(
                                  color: MASTERPIE_YELLOW_COLOR, // Background color
                                  shape: BoxShape.circle, // If you want a circular background
                                ),
                                child: IconButton(
                                  onPressed: onPressed,
                                  icon: const Icon(
                                    Icons.close,
                                    size: 24,
                                    color: DARK_PRIMARY_COLOR,
                                  ),
                                ),
                              );
                            },
                          ),
                          children: [
                            Container(
                              width: FAB_SIZE,
                              height: FAB_SIZE,
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: DARK_PRIMARY_COLOR,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: Image.asset(SEARCH_GROCERY_PATH, color: Colors.white,),
                                onPressed: () {
                                  searchGroceriesClickListener();
                                },
                              ),
                            ),
                            Container(
                              width: FAB_SIZE,
                              height: FAB_SIZE,
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: DARK_PRIMARY_COLOR,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: Image.asset(SEARCH_RECIPE_PATH, color: Colors.white,),
                                onPressed: () {
                                  searchRecipesClickListener();
                                },
                              ),
                            ), Container(
                              width: FAB_SIZE,
                              height: FAB_SIZE,
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: DARK_PRIMARY_COLOR,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: Image.asset(COOK_FOOD_PATH, color: Colors.white,),
                                onPressed: () {
                                  myCookBookClickListener();
                                },
                              ),
                            ), Container(
                              width: FAB_SIZE,
                              height: FAB_SIZE,
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: DARK_PRIMARY_COLOR,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.favorite_outline_rounded, color: Colors.white,),
                                onPressed: () {
                                  myFavoriteFoodsClickListener();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),


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
                            setMacroRangesInWizard(state.loggedFoods);
                          });
                          return Container();
                        }else if(state is GetImmediateLoggedFoodsState){
                          Future.delayed(Duration.zero,(){
                            _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
                            _macroEdition = state.loggedFoods.macroEdition;
                            updateScreenWithNewLoggedFoods(state.loggedFoods.foods);
                            setMacroRangesInWizard(state.loggedFoods);
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
                              requestLoggedFoodsImmediately(DateTime.now());
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


                  BlocConsumer<AutoGenerateFoodsBloc, AutoGenerateFoodsState>(
                      builder: (mcontext, state) {
                        if (state is AutoGenerateFoodsLoadingState) {
                          _autoGenerateFoodsBloc.add(const AutoGenerateFoodsEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            showDialog(
                              context: context,
                              builder: (context) {
                                return WaitPopup(
                                  message: GENERATE_MEAL_PLAN,
                                );
                              },
                            );
                          });
                        }else if(state is AutoGenerateFoodsForDayLoadedState){
                          _autoGenerateFoodsBloc.add(const AutoGenerateFoodsEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            Navigator.of(context, rootNavigator: true).pop();
                            _showTutorial();
                            //todo show foods in wizard
                          });
                        }else if(state is AutoGenerateFoodLoadedState){
                          _autoGenerateFoodsBloc.add(const AutoGenerateFoodsEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            Navigator.of(context, rootNavigator: true).pop();
                            setState(() {
                              if(state.isMainDish){
                                _mainDishFoods[state.index]= state.food;
                              }else{
                                _sideDishFoods[state.index]= state.food;
                              }
                            });

                          });
                        }else if(state is AutoGenerateFoodsErrorState){
                          Navigator.of(context, rootNavigator: true).pop();
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


                  BlocConsumer<SuggestPortionsBloc, SuggestFoodsPortionState>(
                      builder: (context, state) {
                        if (state is SuggestFoodsPortionLoadingState) {
                          return const GFLoader(
                            type: GFLoaderType.circle,
                            loaderColorOne: DARK_PRIMARY_COLOR,
                            loaderColorTwo: DARK_PRIMARY_COLOR,
                            loaderColorThree: DARK_PRIMARY_COLOR,
                          );
                        }else if(state is SuggestFoodsPortionLoadedState){
                          _suggestPortionsBloc.add(const SuggestFoodsPortionEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            final wizardModel= state.wizardResponseModel.copyWith(macroGoal: _getMacroGoalInputInWizard());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SuggestedDifferentFoodsCombinationScreen(wizardResponse: wizardModel),
                              ),
                            );
                          });
                        }else if(state is SuggestFoodsPortionErrorState){
                          _suggestPortionsBloc.add(const SuggestFoodsPortionEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            if(state.message == ERROR_FREE_USER_FOODS_PORTION_NOT_ALLOWED){
                              return showUpgradePopupForFreeUsers(context, UPGRADE_MSG_FOODS_PORTION);
                            }else if(state.message == ERROR_PAID_USER_SUGGEST_FOOD_OVER_LIMIT){
                              return showOVerLimitPaidUsers(context, ERROR_OVER_LIMIT_FOODS_PORTION_MSG);
                            }
                            return showErrorToast(context, state.message);
                          });
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
                            _addEmptyFoodsInWizard(state.profile);
                            _userLoggedIn= state.profile.id.isEmpty ? false : true;
                            requestLoggedFoods(DateTime.now());
                            setMacros(state.profile);
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
          )
        ),
      ),
    );
  }



  void _addEmptyFoodsInWizard(Profile profile){
    setState(() {
      profile.mainDishTypes.forEach((element) {
        _mainDishFoods.add(Food(name: ''));
        _mainDishTypes.add(element);
      });
      profile.sideDishTypes.forEach((element) {
        _sideDishFoods.add(Food(name: ''));
        _sideDishTypes.add(element);
      });
    });
  }


  List<int> _getMacroGoalInputInWizard(){
    List<int> macro= [];

    int calorieGoal= 0;
    int proteinGoal= 0;
    int carbGoal= 0;
    int fatGoal= 0;

    if(_macroGoalInputType == BY_PERCENTAGE_LABEL){

      calorieGoal= (double.parse(_minCalorieGoalController.text.isEmpty ? '0.0' : _minCalorieGoalController.text)+
          double.parse(_maxCalorieGoalController.text.isEmpty ? '0.0' : _maxCalorieGoalController.text))~/2;

      final totalProteinCalorie= calorieGoal*int.parse(_proteinPercentageController.text)/100;
      proteinGoal= totalProteinCalorie~/4;

      final totalCarbCalorie= calorieGoal*int.parse(_carbPercentageController.text)/100;
      carbGoal= totalCarbCalorie~/4;

      final totalFatCalorie= calorieGoal*int.parse(_fatPercentageController.text)/100;
      fatGoal= totalFatCalorie~/9;
    }else{

      proteinGoal= (double.parse(_minProteinGoalController.text.isEmpty ? '0.0' : _minProteinGoalController.text)+
          double.parse(_maxProteinGoalController.text.isEmpty ? '0.0' : _maxProteinGoalController.text))~/2;

      carbGoal= (double.parse(_minCarbGoalController.text.isEmpty ? '0.0' : _minCarbGoalController.text)+
          double.parse(_maxCarbGoalController.text.isEmpty ? '0.0' : _maxCarbGoalController.text))~/2;

      fatGoal= (double.parse(_minFatGoalController.text.isEmpty ? '0.0' : _minFatGoalController.text)+
          double.parse(_maxFatGoalController.text.isEmpty ? '0.0' : _maxFatGoalController.text))~/2;

      calorieGoal= (proteinGoal * 4) + (carbGoal *4) + (fatGoal * 9);

    }


    macro.add(calorieGoal);
    macro.add(proteinGoal);
    macro.add(carbGoal);
    macro.add(fatGoal);

    return macro;
  }



  Widget _totalMacroGoalsWizard(){
    return GestureDetector(
      onTap: (){
        setState(() {
          _step_1_expanded= !_step_1_expanded;
        });
      },
      child: Container(
        decoration:  const BoxDecoration(
          color: WIZARD_STEP1_BACKGROUND_COLOR,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            _stepOneTitleWhenExpanded(),

            _stepOneTitleWhenNotExpanded(),


            Visibility(
                visible: _step_1_expanded,
                child: Column(
                  children: [
                    const SizedBox(height: 18,),

                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: WIZARD_BG_COLOR,
                        borderRadius: BorderRadius.circular(20), // Makes the container rounded
                      ),
                      child: CustomRadioListTile(
                        options: const [BY_PERCENTAGE_LABEL, BY_AMOUNT_LABEL],
                        onSelectedOptionChanged: updateMacroGoalInputUi,
                        selectedOption: _macroGoalInputType,
                        orientation: HORIZONTAL_ORIENTATION,
                        isEditable: true,
                      ),
                    ),

                    const SizedBox(height: 8,),


                    Visibility(
                        visible: _macroGoalInputType == BY_AMOUNT_LABEL,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              proteinGoalRangeWidgets(),

                              const SizedBox(width: 12,),

                              carbGoalRangeWidgets(),

                              const SizedBox(width: 12,),

                              fatGoalRangeWidgets()
                            ],
                          ),
                        )
                    ),


                    Visibility(
                        visible: _macroGoalInputType == BY_PERCENTAGE_LABEL,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Row(
                            children: [

                              calorieRangeWidgets(),

                              const SizedBox(width: 16,),


                              Expanded(
                                child: Container(
                                  height: 300,
                                  padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: WIZARD_BG_COLOR,
                                    borderRadius: BorderRadius.circular(20), // Makes the container rounded
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      fatPercentageWidget(),

                                      const SizedBox(height: 10,),

                                      carbPercentageWidget(),

                                      const SizedBox(height: 10,),

                                      proteinPercentageWidget(),

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    ),

                    const SizedBox(height: 16,),
                  ],
                )
            ),

          ],
        ),
      ),
    );
  }


  Widget _addedFoodsWizard(){
    return  GestureDetector(
      onTap: (){
        setState(() {
          _addedFoodsVisible= !_addedFoodsVisible;
        });
      },
      child: Container(
        decoration:  const BoxDecoration(
          color: WIZARD_STEP1_BACKGROUND_COLOR,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Showcase(
              key: _tutorialThree,
              title: TUTORIAL_STEP_3_TITLE,
              description: TUTORIAL_STEP_3_DESC,
              titlePadding: const EdgeInsets.all(16),
              titleTextStyle: const TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 18, fontWeight: FontWeight.bold, color: GREEN_COLOR),
              descriptionPadding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              targetBorderRadius: const BorderRadius.all(Radius.circular(BORDER_RADIUS)),
              child: Container(
                decoration:  BoxDecoration(
                  color: DARK_PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(BORDER_RADIUS),
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                child:  Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Icon(
                          _addedFoodsVisible ? Icons.arrow_drop_down : Icons.arrow_right,
                          color: Colors.white,
                        ),

                        const SizedBox(width: 8,),

                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: MASTERPIE_YELLOW_COLOR,
                          child: Text(
                            STEP_TWO,
                            style: TextStyle(
                              fontSize: 8,
                              color: DARK_PRIMARY_COLOR,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        const SizedBox(width: 8,),

                        const Flexible(
                          child: Text(ADD_FOODS_FOR_WIZARD,
                            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24,),


                    /// auto generate bt
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape:  RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(BORDER_RADIUS),
                            ),
                            backgroundColor: MASTERPIE_ORANGE_COLOR
                        ),
                        onPressed: () {
                          _autoGenerateFoodsForDay();
                        },

                        child: const Text(AUTO_GENERATE_MEALS_LABEL,
                          style: TextStyle( color: Colors.white,
                              fontWeight: FontWeight.bold, fontSize: 13), textAlign: TextAlign.center,),
                      ),
                    ),
                  ],
                )
              ),
            ),


            const SizedBox(height: 10,),

            /// add food options
            addFoodOptions(),


            /// foods
            _buildWizardFoods(),

            const SizedBox(height: 16,),


          ],
        ),
      ),
    );
  }



  void _showInformationPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const AlertDialog(
            title: Text(HOW_MUCH_TO_EAT, style: TextStyle(fontSize: 16, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text(FOOD_PORTION_INFO, style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal)),
                ],
              ),
            )
        );
      },
    );
  }


  Widget _buildWizardFoods(){
    return Visibility(
        visible: _mainDishFoods.isNotEmpty || _sideDishFoods.isNotEmpty ,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4,),
              FoodsMacroListUi(mainDishesFoods: _mainDishFoods, sideDishesFoods: _sideDishFoods, mainDishesTypes: _mainDishTypes, sideDishesTypes: _sideDishTypes,
                onRemoveFoodClicked: updateUiAfterFoodRemoved, onMainDishClicked: _onMinDishClicked, onSideDishClicked: _onSideDishClicked,
              )
            ],
          ),
        )
    );
  }



  void _onMinDishClicked(String source, int index){
    if(source == CREATE_MANUAL_LABEL){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return ManualMealMacroForWizardDialog(type: MAIN_DISH_LABEL, onAddMealBtnClicked: _addMealMacroManuallyToWizard,
            index: index, onCreateManualClickedClicked: _onCreateManualFromScratchWizardClicked,
            onSearchGroceryClicked: _onSearchGroceryWizardClicked, onSearchRecipeClicked:_onSearchRecipeWizardClicked,);
        },
      );
    }else if(source == AUTO_GENERATE_LABEL){
      _autoGenerateFood(_mainDishTypes[index], index, true);
    }
  }



  void _onSearchRecipeWizardClicked(String type, int index){
    final model= GenericFoodDetailForMacroWizardArgumentModel(
        type: type,
        index: index,
        food: null
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchRecipeMacroWizardScreen(genericFoodDetailForMacroWizardArgumentModel: model),
      ),
    ).then((result) {
      if(result != null){
        final foodDetail= result as FoodDetailForMacroWizardArgumentModel;
        if(foodDetail.food != null){
          setState(() {
            if(type == MAIN_DISH_LABEL){
              _mainDishFoods[index]= foodDetail.food!;
            }else{
              _sideDishFoods[index]= foodDetail.food!;
            }
          });
        }
      }
    });
  }

  void _onSearchGroceryWizardClicked(String type, int index){
    final model= GenericFoodDetailForMacroWizardArgumentModel(
        type: type,
        index: index,
        food: null
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchGroceryMacroWizardScreen(genericFoodDetailForMacroWizardArgumentModel: model)),
    ).then((result) {
      if(result != null){
        final foodDetail= result as FoodDetailForMacroWizardArgumentModel;
        if(foodDetail.food != null){
          setState(() {
            if(type == MAIN_DISH_LABEL){
              _mainDishFoods[index]= foodDetail.food!;
            }else{
              _sideDishFoods[index]= foodDetail.food!;
            }
          });
        }
      }
    });
  }

  void _onCreateManualFromScratchWizardClicked(String type, int index){
    final model= GenericFoodDetailForMacroWizardArgumentModel(
        type: type,
        index: index,
        food: null
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ManualFoodMacroWizardScreen(genericFoodDetailForMacroWizardArgumentModel: model),
      ),
    ).then((result) {
      if(result != null){
        final foodDetail= result as FoodDetailForMacroWizardArgumentModel;
        if(foodDetail.food != null){
          setState(() {
            if(type == MAIN_DISH_LABEL){
              _mainDishFoods[index]= foodDetail.food!;
            }else{
              _sideDishFoods[index]= foodDetail.food!;
            }
          });
        }
      }
    });
  }

  void _onSideDishClicked(String source, int index){
    if(source == CREATE_MANUAL_LABEL){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return ManualMealMacroForWizardDialog(type: SIDE_DISH_LABEL, onAddMealBtnClicked: _addMealMacroManuallyToWizard,
            index: index, onCreateManualClickedClicked: _onCreateManualFromScratchWizardClicked,
            onSearchGroceryClicked: _onSearchGroceryWizardClicked, onSearchRecipeClicked:_onSearchRecipeWizardClicked,);
        },
      );
    }else if(source == AUTO_GENERATE_LABEL){
      _autoGenerateFood(_sideDishTypes[index], index, false);
    }
  }


  void _addMealMacroManuallyToWizard(String mealName, List<String> macro, String type, int index){
    setState(() {
      if(type == MAIN_DISH_LABEL){
        _mainDishFoods[index]= Food(id: generateRandomId(), name: mealName, calorie: [macro[0]], protein: [macro[1]], carb: [macro[2]], fat: [macro[3]]);
      }else{
        _sideDishFoods[index]= Food(id: generateRandomId(), name: mealName, calorie: [macro[0]], protein: [macro[1]], carb: [macro[2]], fat: [macro[3]]);
      }
    });
  }


  void updateUiAfterFoodRemoved(int index, String type){
    setState(() {
        if(type == MAIN_DISH_LABEL){
          List<Food> foods= [];
          List<String> types= [];


          for(int i = 0; i < _mainDishTypes.length; i++){
            if( index != i){
              foods.add(_mainDishFoods[i]);
              types.add(_mainDishTypes[i]);
            }
          }
          _mainDishTypes= types;
          _mainDishFoods= foods;
        }else{
          List<Food> foods= [];
          List<String> types= [];


          for(int i = 0; i < _sideDishTypes.length; i++){
            if( index != i){
              foods.add(_sideDishFoods[i]);
              types.add(_sideDishTypes[i]);
            }
          }
          _sideDishTypes= types;
          _sideDishFoods= foods;
        }
    });
  }


  Widget addFoodOptions(){
    return   Row(
        children: [

          const SizedBox(width: 4,),

          /// add new main dish
          GestureDetector(
            onTap: (){
              setState(() {
                _mainDishTypes.add(MAIN_DISH_LABEL);
                _mainDishFoods.add(Food(name: ''));
                showSuccessToast(context, DISH_ADDED_TO_WIZARD_MSG);
              });
            },
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: DARK_GREY_COLOR,
                    width: 1, // Border width
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15), // Radius value
                  ),
                ),
                child: const Text(ADD_MAIN_DISH_WIZARD, style: TextStyle( color: DARK_GREY_COLOR, fontSize: 12, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
            ),
          ),


          const SizedBox(width: 28,),

          /// add new side dish
          GestureDetector(
            onTap: (){
              setState(() {
                _sideDishFoods.add(Food(name: ''));
                _sideDishTypes.add(SIDE_DISH_LABEL);
                showSuccessToast(context, DISH_ADDED_TO_WIZARD_MSG);
              });
            },
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: DARK_GREY_COLOR,
                    width: 1, // Border width
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15), // Radius value
                  ),
                ),
                child: const Text(ADD_SIDE_DISH_WIZARD, style: TextStyle( color: DARK_GREY_COLOR, fontSize: 12, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
            ),
          ),


        ]
    );
  }




  Widget _stepOneTitleWhenExpanded(){
    return Visibility(
      visible: _step_1_expanded,
        child:   Container(
          height: 120,
          decoration:  BoxDecoration(
            color: DARK_PRIMARY_COLOR,
            borderRadius: BorderRadius.circular(BORDER_RADIUS),
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Icon(
                _step_1_expanded ? Icons.arrow_drop_down : Icons.arrow_right,
                color: Colors.white,
                size: 25,
              ),

              const SizedBox(width: 4,),

               const CircleAvatar(
                radius: 20,
                backgroundColor: MASTERPIE_YELLOW_COLOR,
                child: Text(
                  STEP_ONE,
                  style: TextStyle(
                    fontSize: 8,
                    color: DARK_PRIMARY_COLOR,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(width: 8,),

              const Flexible(
                child: Text(ENTER_GOAL_RANGE,
                  style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
    );
  }


  Widget _stepOneTitleWhenNotExpanded(){

    String stepOneTitle= ENTER_GOAL_RANGE;
    String stepOneSubTitle= '';


    double minCalorie= _minCalorieGoalController.text.isEmpty ? 0.0 : double.parse(_minCalorieGoalController.text);
    double minProtein= _minProteinGoalController.text.isEmpty ? 0.0 : double.parse(_minProteinGoalController.text);
    double minCarb= _minCarbGoalController.text.isEmpty ? 0.0 : double.parse(_minCarbGoalController.text);
    double minFat= _minFatGoalController.text.isEmpty ? 0.0 : double.parse(_minFatGoalController.text);

    double maxCalorie= _maxCalorieGoalController.text.isEmpty ? 0.0 : double.parse(_maxCalorieGoalController.text);
    double maxProtein= _maxProteinGoalController.text.isEmpty ? 0.0 : double.parse(_maxProteinGoalController.text);
    double maxCarb= _maxCarbGoalController.text.isEmpty ? 0.0 : double.parse(_maxCarbGoalController.text);
    double maxFat= _maxFatGoalController.text.isEmpty ? 0.0 : double.parse(_maxFatGoalController.text);


    double proteinPercentage= _proteinPercentageController.text.isEmpty ? 0.0 : double.parse(_proteinPercentageController.text);
    double carbPercentage= _carbPercentageController.text.isEmpty ? 0.0 : double.parse(_carbPercentageController.text);
    double fatPercentage= _fatPercentageController.text.isEmpty ? 0.0 : double.parse(_fatPercentageController.text);


    if(_macroGoalInputType == BY_AMOUNT_LABEL){
      int protein= (minProtein + maxProtein)~/2;
      int carb= (minCarb + maxCarb)~/2;
      int fat= (minFat + maxFat)~/2;

      if(protein != 0 || carb != 0 || fat != 0){
        stepOneTitle= YOUR_MACRO_GOAL_LABEL;
        stepOneSubTitle= '$protein g protein, $carb g carb, $fat g fat';
      }

    }else{
      int calorie= (minCalorie + maxCalorie)~/2;
      if(calorie != 0){
        stepOneTitle= YOUR_MACRO_GOAL_LABEL;
        stepOneSubTitle= '$calorie cal with ${proteinPercentage.toInt()}% protein, ${carbPercentage.toInt()}% carb, ${fatPercentage.toInt()}% fat';
      }
    }




    return Visibility(
        visible: !_step_1_expanded,
        child: Showcase(
          key: _tutorialTwo,
          title: TUTORIAL_STEP_2_TITLE,
          description: TUTORIAL_STEP_2_DESC,
          titlePadding: const EdgeInsets.all(16),
          titleTextStyle: const TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 18, fontWeight: FontWeight.bold, color: GREEN_COLOR),
          descriptionPadding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          targetBorderRadius: const BorderRadius.all(Radius.circular(BORDER_RADIUS)),
          child: Container(
            height: 120,
            decoration:  BoxDecoration(
              color: DARK_PRIMARY_COLOR,
              borderRadius: BorderRadius.circular(BORDER_RADIUS),
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            child: Center(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Icon(
                    _step_1_expanded ? Icons.arrow_drop_down : Icons.arrow_right,
                    color: Colors.white,
                    size: 25,
                  ),

                  const SizedBox(width: 4,),

                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: MASTERPIE_YELLOW_COLOR,
                    child: Text(
                      STEP_ONE,
                      style: TextStyle(
                        fontSize: 8,
                        color: DARK_PRIMARY_COLOR,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),


                  const SizedBox(width: 16,),


                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(stepOneTitle,
                            style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),),
                        ),
                    
                        const SizedBox(height: 8,),
                    
                        Visibility(
                          visible: stepOneSubTitle.isNotEmpty,
                          child: Flexible(
                            child: Text(stepOneSubTitle,
                              style: const TextStyle(color: MASTERPIE_YELLOW_COLOR, fontSize: 13, fontWeight: FontWeight.bold),),
                          ),
                        ),
                    
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
    );

  }




  _prepareWizardParams(){
    List<List<double>> macroGoalsRange= [];
    double minCalorie= _minCalorieGoalController.text.isEmpty ? 0.0 : double.parse(_minCalorieGoalController.text);
    double minProtein= _minProteinGoalController.text.isEmpty ? 0.0 : double.parse(_minProteinGoalController.text);
    double minCarb= _minCarbGoalController.text.isEmpty ? 0.0 : double.parse(_minCarbGoalController.text);
    double minFat= _minFatGoalController.text.isEmpty ? 0.0 : double.parse(_minFatGoalController.text);

    double maxCalorie= _maxCalorieGoalController.text.isEmpty ? 0.0 : double.parse(_maxCalorieGoalController.text);
    double maxProtein= _maxProteinGoalController.text.isEmpty ? 0.0 : double.parse(_maxProteinGoalController.text);
    double maxCarb= _maxCarbGoalController.text.isEmpty ? 0.0 : double.parse(_maxCarbGoalController.text);
    double maxFat= _maxFatGoalController.text.isEmpty ? 0.0 : double.parse(_maxFatGoalController.text);


    double proteinPercentage= _proteinPercentageController.text.isEmpty ? 0.0 : double.parse(_proteinPercentageController.text);
    double carbPercentage= _carbPercentageController.text.isEmpty ? 0.0 : double.parse(_carbPercentageController.text);
    double fatPercentage= _fatPercentageController.text.isEmpty ? 0.0 : double.parse(_fatPercentageController.text);


    /// validate inputs
    if(_macroGoalInputType == BY_AMOUNT_LABEL){
      if(minProtein == 0.0 && maxProtein == 0.0 &&
          minCarb == 0.0 && maxCarb == 0.0 &&
          minFat == 0.0 && maxFat == 0.0){
        showErrorToast(context, ERROR_NO_GOAL);
        return;
      }

    }else{

      if(minCalorie == 0.0 && maxCalorie == 0.0){
        showErrorToast(context, ERROR_NO_GOAL_CALORIE);
        return;
      }

      if(proteinPercentage + carbPercentage + fatPercentage != 100.0){
        showErrorToast(context, ERROR_MACRO_PERCENTAGE);
        return;
      }

    }

    macroGoalsRange.add(maxCalorie > minCalorie ? [minCalorie, maxCalorie] : [maxCalorie, minCalorie]);
    macroGoalsRange.add(maxProtein > minProtein ? [minProtein, maxProtein] : [maxProtein, minProtein]);
    macroGoalsRange.add(maxCarb > minCarb ? [minCarb, maxCarb] : [maxCarb, minCarb]);
    macroGoalsRange.add(maxFat > minFat ? [minFat, maxFat] : [maxFat, minFat]);



    List<double> macroGoalPercentage= [proteinPercentage, carbPercentage, fatPercentage];


    List<String> restriction= [];
    if(_selectedRestrictionOption != -1 && _selectedRestrictionOption != 0){
      switch(_selectedRestrictionOption){
        case 1:
          restriction= ['0', 'min'];
          break;
        case 2:
          restriction= ['0', 'max'];
          break;
        case 3:
          restriction= ['1', 'min'];
          break;
        case 4:
          restriction= ['1', 'max'];
          break;
        case 5:
          restriction= ['2', 'min'];
          break;
        case 6:
          restriction= ['2', 'max'];
          break;
        case 7:
          restriction= ['3', 'min'];
          break;
        case 8:
          restriction= ['3', 'max'];
          break;
      }
    }


    List<Food> foods= [];
    foods.addAll(_mainDishFoods.where((element) => element.name.isNotEmpty));
    foods.addAll(_sideDishFoods.where((element) => element.name.isNotEmpty));




    _requestWizardArgumentModel = RequestWizardArgumentModel(
        foods: foods,
        restriction: restriction,
        macroGoalRanges: macroGoalsRange,
        goalType: _macroGoalInputType,
        macroPercentage: macroGoalPercentage
    );
  }


  void setMacroRangesInWizard(LoggedFoods loggedFoods){
    double totalTakenCalories= 0;
    double totalTakenProteins= 0;
    double totalTakenCarbs= 0;
    double totalTakenFats= 0;
    loggedFoods.foods.forEach((element) {
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

      totalTakenCalories= totalTakenCalories+ foodCalorie;
      totalTakenProteins= totalTakenProteins+ foodProtein;
      totalTakenCarbs= totalTakenCarbs+ foodCarb;
      totalTakenFats= totalTakenFats+ foodFat;

    });
    setState(() {

      int remainedCalorie= (loggedFoods.goals[0] - totalTakenCalories).toInt();
      int remainedProtein= (loggedFoods.goals[1] - totalTakenProteins).toInt();
      int remainedCarb= (loggedFoods.goals[2] - totalTakenCarbs).toInt();
      int remainedFat= (loggedFoods.goals[3] - totalTakenFats).toInt();


      if(remainedCalorie <= 0){
        remainedCalorie = 0;
      }

      if(remainedProtein <= 0){
        remainedProtein = 0;
      }

      if(remainedCarb <= 0){
        remainedCarb = 0;
      }

      if(remainedFat <= 0){
        remainedFat = 0;
      }

      _minCalorieGoalController.text = '${(9/10 * remainedCalorie).toInt()}';
      _minProteinGoalController.text = '${(9/10 * remainedProtein).toInt()}';
      _minCarbGoalController.text = '${(9/10 * remainedCarb).toInt()}';
      _minFatGoalController.text = '${(9/10 * remainedFat).toInt()}';

      _maxCalorieGoalController.text = '${(1.1 * remainedCalorie).toInt()}';
      _maxProteinGoalController.text = '${(1.1 * remainedProtein).toInt()}';
      _maxCarbGoalController.text = '${(1.1 * remainedCarb).toInt()}';
      _maxFatGoalController.text = '${(1.1 * remainedFat).toInt()}';


    });
  }


  void addOrRemoveFavorite(Food food, bool addToFavorite){
  }

  void myCookBookClickListener() async{
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyCookBookScreen(),
      ),
    );
  }


  void myFavoriteFoodsClickListener() async{
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyFavoriteFoodsScreen(),
      ),
    );
  }

  void searchGroceriesClickListener() async{
     await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchGroceryScreen(),
      ),
    );
  }


  void searchRecipesClickListener() async{
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchRecipeScreen(),
      ),
    );
  }



  void updateScreenWithNewLoggedFoods(List<Food> foods){
    setState(() {
      _foods= [];
      _foods.addAll(foods);
      printWrapped('dfhfd: ${_foods}');
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


  void setMacroGoals(List<String> dailyMacroGoal){
    setState(() {
      _calorieGoal = dailyMacroGoal[0].isEmpty ? 0 : int.parse(dailyMacroGoal[0]);
      _proteinGoal = dailyMacroGoal[1].isEmpty ? 0 : int.parse(dailyMacroGoal[1]);
      _carbGoal = dailyMacroGoal[2].isEmpty ? 0 : int.parse(dailyMacroGoal[2]);
      _fatGoal = dailyMacroGoal[3].isEmpty ? 0 : int.parse(dailyMacroGoal[3]);
    });
  }

  void logFoodsOfToday(){
    List<Food> foods = [];

    foods.addAll(_foods);

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








  //wizard

  void updateMacroGoalInputUi(String type){
    setState(() {
      _macroGoalInputType= type;
    });
  }


  Widget calculatePortionsButton(){
    return Showcase(
      key: _tutorialFour,
      title: TUTORIAL_STEP_4_TITLE,
      description: TUTORIAL_STEP_4_DESC,
      titlePadding: const EdgeInsets.all(16),
      titleTextStyle: const TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 18, fontWeight: FontWeight.bold, color: GREEN_COLOR),
      descriptionPadding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      targetBorderRadius: const BorderRadius.all(Radius.circular(BORDER_RADIUS)),
      child: Container(
        padding: const EdgeInsets.only(bottom: 24),
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(BORDER_RADIUS),
              ),
              backgroundColor: MASTERPIE_YELLOW_COLOR
          ),
          onPressed: () {

            _prepareWizardParams();


            if(_requestWizardArgumentModel.foods.isEmpty){
              showErrorToast(context, ERROR_ADD_FOOD);
              return;
            }


            List<List<double>> servings = [];
            _requestWizardArgumentModel.foods.forEach((element) {
              List<double> list = [];
              list.add(0.5);
              list.add(2.0);
              servings.add(list);
            });

            logEvent(MACRO_DIET_CALCULATE_BTN_CLICKED, null);

            _suggestPortionsBloc.add(
                SuggestFoodsPortionEvent.onSuggestFoodsPortion(
                    _requestWizardArgumentModel.foods,
                    servings,
                    _requestWizardArgumentModel.macroGoalRanges,
                    _requestWizardArgumentModel.restriction,
                    _requestWizardArgumentModel.goalType,
                    _requestWizardArgumentModel.macroPercentage
                )
            );

          },

          child: const Text(REQUEST_PORTIONS_LABEL, style: TextStyle( color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }



  Widget proteinPercentageWidget(){
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text('${PROTEIN_LABEL.toUpperCase()}%', style: const TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),),


          const SizedBox(width: 8,),

          Row(
            children: [

              SizedBox(
                width: 50,
                height: MACRO_HEIGHT,
                child: TextField(
                  controller: _proteinPercentageController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.allow(numericRegExp),
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  ),
                ),
              ),

              const SizedBox(width: 8,),

              const SizedBox(
                width: 100,
                child: Text(OF_TOTAL_CAL,
                  style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 8),),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget carbPercentageWidget(){
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text('${CARB_LABEL.toUpperCase()}%', style: const TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),),

          const SizedBox(width: 8,),

          Row(
            children: [
              SizedBox(
                width: 50,
                height: MACRO_HEIGHT,
                child: TextField(
                  controller: _carbPercentageController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.allow(numericRegExp),
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  ),
                ),
              ),

              const SizedBox(width: 8,),

              const SizedBox(
                width: 100,
                child: Text(OF_TOTAL_CAL,
                  style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 8),),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget fatPercentageWidget(){
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text('${FAT_LABEL.toUpperCase()}%', style: const TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),),

          const SizedBox(height: 8,),
          SizedBox(
            // width: 100,
            height: MACRO_HEIGHT,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  width: 50,
                  child: TextField(
                    controller: _fatPercentageController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.allow(numericRegExp),
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    ),
                  ),
                ),

                const SizedBox(width: 8,),

                const SizedBox(
                  width: 100,
                  child: Text(OF_TOTAL_CAL,
                  style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 8),),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget calorieRangeWidgets(){
    return Expanded(
      child: Container(
        height: 300,
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
        decoration: BoxDecoration(
          color: WIZARD_BG_COLOR,
          borderRadius: BorderRadius.circular(20), // Makes the container rounded
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const Text(
              CALORIE_RANGE_LABEL,
              style: TextStyle(
                color: DARK_PRIMARY_COLOR,
                fontWeight: FontWeight.bold,
                fontSize: FONT_HEADER,
              ),
            ),

            const SizedBox(height: 24,),

            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextFormField(
                controller: _minCalorieGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
                ],
                decoration: const InputDecoration(
                  labelText: MIN_LABEL,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                ),
              ),
            ),

            const SizedBox(height: 32,),


            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextFormField(
                controller: _maxCalorieGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
                ],
                decoration: const InputDecoration(
                  labelText: MAX_LABEL,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget proteinGoalRangeWidgets(){
    return Expanded(
      child: /// protein
      Container(
        height: 300,
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
        decoration: BoxDecoration(
          color: WIZARD_BG_COLOR,
          borderRadius: BorderRadius.circular(20), // Makes the container rounded
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(PROTEIN_RANGE_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER), textAlign: TextAlign.center,),

            const SizedBox(height: 24,),


            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextFormField(
                controller: _minProteinGoalController,
                cursorColor: DARK_PRIMARY_COLOR,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
                ],
                decoration: const InputDecoration(
                  labelText: MIN_LABEL,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                ),
              ),
            ),


            const SizedBox(height: 32,),


            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextFormField(
                controller: _maxProteinGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
                ],
                decoration: const InputDecoration(
                  labelText: MAX_LABEL,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget carbGoalRangeWidgets(){
    return Expanded(
      child:  ///  carb
      Container(
        height: 300,
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
        decoration: BoxDecoration(
          color: WIZARD_BG_COLOR,
          borderRadius: BorderRadius.circular(20), // Makes the container rounded
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const Text(CARB_RANGE_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER), textAlign: TextAlign.center,),


            const SizedBox(height: 24,),


            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextFormField(
                controller: _minCarbGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
                ],
                decoration: const InputDecoration(
                  labelText: MIN_LABEL,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                ),
              ),
            ),


            const SizedBox(height: 32,),

            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _maxCarbGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
                ],
                decoration: const InputDecoration(
                  labelText: MAX_LABEL,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget fatGoalRangeWidgets(){
    return Expanded(
      child: ///  fat
      Container(
        height: 300,
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
        decoration: BoxDecoration(
          color: WIZARD_BG_COLOR,
          borderRadius: BorderRadius.circular(20), // Makes the container rounded
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const Text(FAT_RANGE_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER), textAlign: TextAlign.center,),

            const SizedBox(height: 24,),

            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextFormField(
                controller: _minFatGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
                ],
                decoration: const InputDecoration(
                  labelText: MIN_LABEL,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                ),
              ),
            ),

            const SizedBox(height: 32,),

            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextFormField(
                controller: _maxFatGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
                ],
                decoration: const InputDecoration(
                  labelText: MAX_LABEL,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }


}





