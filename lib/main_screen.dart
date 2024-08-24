
import 'dart:convert';

import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/foods/presentation/screen/my_cook_book_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/view_auto_generate_meals_screen.dart';
import 'package:masterpie/feature/user/presentation/screen/onboarding_screen.dart';
import 'package:masterpie/util/core/constant/api_constant.dart';
import 'package:masterpie/util/core/constant/hive_constants.dart';
import 'package:masterpie/util/core/constant/messages_constants.dart';
import 'package:masterpie/util/core/di/service_locator.dart';
import 'package:masterpie/util/core/helper/print.dart';
import 'package:masterpie/util/design/color/app_colors.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import 'package:masterpie/util/design/size/app_widget_size.dart';
import 'package:masterpie/util/design/text/app_assets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'feature/foods/data/repository_impl/foods_repository_impl.dart';
import 'feature/foods/domain/model/food_model.dart';
import 'feature/foods/presentation/bloc/suggest_portion_bloc/state_event/suggest_portion_state_event.dart';
import 'feature/foods/presentation/bloc/suggest_portion_bloc/suggest_portion_bloc.dart';
import 'feature/foods/presentation/screen/suggested_different_foods_combination_screen.dart';
import 'feature/foods/presentation/screen/ui_helper/foods_macro_list_ui.dart';
import 'feature/foods/presentation/screen/ui_helper/wait_popup.dart';
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

  List<Food> _mainDishFoods= [];

  List<Food> _sideDishFoods= [];

  late SuggestPortionsBloc _suggestPortionsBloc;

  late FoodsMacroListUi _foodsMacroListUi;


  @override
  void initState() {
    super.initState();
    isFromOnboard= widget.isFromOnboard ?? false;
    _getProfileBloc = context.read<GetProfileBloc>();
    _suggestPortionsBloc = context.read<SuggestPortionsBloc>();
    _logoutBloc = context.read<LogoutBloc>();
    _getProfileBloc.add(const GetProfileEvent.onReset());
    _foodsMacroListUi= FoodsMacroListUi(mainDishesFoods: [], sideDishesFoods: [],
        mainDishesTypes: [], sideDishesTypes: [], onRemoveDishClicked: updateUiAfterDishRemoved);
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

                          addFoodOptions(),


                          _buildWizardFoods(),


                        ],
                      ),
                    ),

                  ),

                  _buildMealPlanButton(),

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


            BlocConsumer<SuggestPortionsBloc, SuggestFoodsPortionState>(
                builder: (context, state) {
                  if (state is SuggestFoodsPortionLoadingState) {
                    _suggestPortionsBloc.add(const SuggestFoodsPortionEvent.onReset());
                    Future.delayed(Duration.zero,(){
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return WaitPopup(
                            message: GENERATE_MEAL_PLAN,
                            isForOneMeal: false,
                          );
                        },
                      );
                    });
                  }else if(state is SuggestFoodsPortionLoadedState){
                    _suggestPortionsBloc.add(const SuggestFoodsPortionEvent.onReset());
                    Future.delayed(Duration.zero,(){
                      final wizardModel= state.wizardResponseModel.copyWith(macroGoal: _macroGoal);
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

      _sideDishTypes.forEach((element) {
        _sideDishFoods.add(Food(name: ''));
      });

      _mainDishTypes.forEach((element) {
        _mainDishFoods.add(Food(name: ''));
      });

      _macroGoal= [int.parse(profile.dailyMacroGoal[0]),
        int.parse(profile.dailyMacroGoal[1]),
        int.parse(profile.dailyMacroGoal[2]),
        int.parse(profile.dailyMacroGoal[3]),];


      _foodsMacroListUi= FoodsMacroListUi(mainDishesFoods: _mainDishFoods, sideDishesFoods: _sideDishFoods,
        mainDishesTypes: _mainDishTypes, sideDishesTypes: _sideDishTypes,
        onRemoveDishClicked: updateUiAfterDishRemoved,);

    });
  }

  Widget _buildWizardFoods(){
    return Visibility(
      visible: _mainDishFoods.isNotEmpty || _sideDishFoods.isNotEmpty ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4,),

          _foodsMacroListUi
        ],
      ),
    );
  }



  void _generateMealPlan(List<String> dishIngredients, List<Food> newMainDishesFoods,
      List<Food> newSideDishesFoods, List<String> newMainDishTypes, List<String> newSideDishTypes){
    print('dfgds: ${dishIngredients}');


    Future.delayed(Duration.zero,(){
      if(dishIngredients.isEmpty){
        showErrorToast(context, ERROR_ADD_FOOD);
        return;
      }
    });



  }


  void updateUiAfterDishRemoved(int index, String type){
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





  Future<List<Food>> requestFoodsIngredientsMacroFromChatGPT(List<List<String>> foodsIngredients) async{
    final openAIKey= await FlutterConfig.get(OPENAI_API_KEY);
    OpenAI.apiKey = openAIKey;

    try{

      String promptMessage= 'Provide the calories,protein,carbohydrates,fat, recommended amount and unit for the ingredients: ${foodsIngredients[0]}.'
          'For ingredients like an egg, use \'1\' as the amount and use \'medium\' as the unit. For ingredients like rice, use \'1\' as the amount and use \'cup\' as the unit. Ensure that no extra words are added to the response.';
      print('show_prompt: $promptMessage');

      final systemMessage = OpenAIChatCompletionChoiceMessageModel(
        content: [
          OpenAIChatCompletionChoiceMessageContentItemModel.text(
            "return any message you are given as JSON object with this format: "
                "{\"ingredients\": [{\"name\": \"egg\",\"amount\": 1,\"unit\": \"medium\",\"calories\": 68,\"protein\": 6.3,\"carbohydrates\": 0.6,\"fat\": 4.8}]}",
          ),
        ],
        role: OpenAIChatMessageRole.assistant,
      );

      final userMessage = OpenAIChatCompletionChoiceMessageModel(
        content: [
          OpenAIChatCompletionChoiceMessageContentItemModel.text(
            promptMessage,
          ),
        ],
        role: OpenAIChatMessageRole.user,
      );

      final requestMessages = [systemMessage, userMessage,];
      OpenAIChatCompletionModel chatCompletion = await OpenAI.instance.chat.create(
        model: "gpt-3.5-turbo-1106",
        responseFormat: {"type": "json_object"},
        // seed: 6,
        messages: requestMessages,
        temperature: 1.2,
        maxTokens: 1024,
        // toolChoice: "auto",
      );

      printWrapped('MEALS_OPENAI_RESPONSE: ${chatCompletion.choices.first.message.content?.first.text}');


    }catch(e){
      print('gpt_error: $e');
      return [];
    }
    return [];
  }





  Widget _buildMealPlanButton(){
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(BORDER_RADIUS),
            ),
            backgroundColor: MASTERPIE_YELLOW_COLOR
        ),
        onPressed: () async {

          final dishesIngredientsModel= _foodsMacroListUi.getDishesIngredientsModel();

          if(dishesIngredientsModel.dishIngredients.isEmpty){
            showErrorToast(context, ERROR_ADD_FOOD);
            return;
          }


          final foodsWithMacro= await requestFoodsIngredientsMacroFromChatGPT(dishesIngredientsModel.dishIngredients);
          print('dfgpsd: ${foodsWithMacro}');





          //
          //
          //  List<List<double>> macroGoalsRange= [];
          // double minCalorie= 9/10 * _macroGoal[0];
          // double minProtein= 9/10 * _macroGoal[1];
          // double minCarb= 9/10 * _macroGoal[2];
          // double minFat= 9/10 * _macroGoal[3];
          //
          // double maxCalorie= 11/10 * _macroGoal[0];
          // double maxProtein= 11/10 * _macroGoal[1];
          // double maxCarb= 11/10 * _macroGoal[2];
          // double maxFat= 11/10 * _macroGoal[3];
          //
          //
          // macroGoalsRange.add([minCalorie, maxCalorie]);
          // macroGoalsRange.add([minProtein, maxProtein]);
          // macroGoalsRange.add([minCarb, maxCarb]);
          // macroGoalsRange.add([minFat, maxFat]);
          //
          //
          //
          // List<List<double>> servings = [];
          //   dishesIngredientsModel.newMainDishesFoods.forEach((element) {
          //   List<double> list = [];
          //   list.add(0.5);
          //   list.add(2.0);
          //   servings.add(list);
          // });
          //   dishesIngredientsModel.newSideDishesFoods.forEach((element) {
          //   List<double> list = [];
          //   list.add(0.5);
          //   list.add(2.0);
          //   servings.add(list);
          // });
          //
          // logEvent(MACRO_DIET_CALCULATE_BTN_CLICKED, null);
          //
          // List<bool> isMainDishList= [];
          //   dishesIngredientsModel.newMainDishTypes.forEach((element) {
          //   if(element != 'Breakfast'){
          //     isMainDishList.add(true);
          //   }else{
          //     isMainDishList.add(false);
          //   }
          // });
          //   dishesIngredientsModel.newSideDishTypes.forEach((element) {
          //   isMainDishList.add(false);
          // });
          //
          // List<Food> foods= [];
          // foods.addAll(dishesIngredientsModel.newMainDishesFoods);
          // foods.addAll(dishesIngredientsModel.newSideDishesFoods);
          //
          // _trackMacroWizard();
          //
          // _suggestPortionsBloc.add(
          //     SuggestFoodsPortionEvent.onSuggestFoodsPortion(
          //         foods,
          //         isMainDishList,
          //         servings,
          //         macroGoalsRange,
          //         [],
          //         BY_AMOUNT_LABEL,
          //         []
          //     )
          // );

        },

        child: const Text(REQUEST_PORTIONS_LABEL, style: TextStyle( color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
      ),
    );
  }


  void _trackMacroWizard() async{
    try{
      final supabase = Supabase.instance.client;

      String uuId= await getDeviceUUID() ?? '';

      final userResponse = await supabase
          .from(GUEST_USAGE_TABLE)
          .select<List<dynamic>>()
          .eq('device_id', uuId);


      final userHiveDataSource = serviceLocator<UserHiveDataSource>();
      String email = await userHiveDataSource.getString(KEY_EMAIL) ?? '';


      if(userResponse.isEmpty){

        final Map<String, dynamic> data = <String, dynamic>{};
        data['device_id'] = uuId;
        data['email'] = email;
        data['auto_generate_daily'] = 0;
        data['wizard'] = 1;


        await supabase.from(GUEST_USAGE_TABLE).insert(data);

      }else{
        final Map<String, dynamic> data = <String, dynamic>{};
        final previousCount= int.parse(userResponse[0]['wizard'].toString());
        data['wizard'] = previousCount + 1;
        data['email'] = email;


        await supabase.from(GUEST_USAGE_TABLE).update(data).eq('device_id', uuId);

      }


    }on PostgrestException catch (error) {
    } catch (error) {
    }
  }





  Widget addFoodOptions(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          const SizedBox(width: 8,),

          /// add new main dish
          Expanded(child: dishTypesDropDown(ADD_MAIN_DISH_WIZARD)),

          const SizedBox(width: 12,),

          /// add new side dish
          Expanded(child: dishTypesDropDown(ADD_SIDE_DISH_WIZARD)),


        ]
    );
  }


  Widget dishTypesDropDown(String title){

    List<String> items= [];
    items.add(title);
    if(title == ADD_MAIN_DISH_WIZARD){
      items.addAll(fatSecretMainDishTypes);
    }else{
      items.addAll(fatSecretSideDishTypes);
    }

    return  SizedBox(
      height: 40,
      child: DropdownButtonFormField<String?>(
        value: title,
        icon: Container(),
        isDense: true,
        isExpanded: false,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 1.0),
        ),
        focusColor: PRIMARY_COLOR,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Container(
              height: 30,
              width: 160,
              decoration: BoxDecoration(
                color: MASTERPIE_YELLOW_COLOR,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: Text(item, style: const TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            if(title == ADD_MAIN_DISH_WIZARD && newValue != ADD_MAIN_DISH_WIZARD){

              List<String> newDishType= [];
              newDishType.addAll(_mainDishTypes);
              newDishType.add(newValue.toString());
              _mainDishTypes= newDishType;

              List<Food> newDishFoods= [];
              newDishFoods.addAll(_mainDishFoods);
              newDishFoods.add(Food(name: ''));
              _mainDishFoods= newDishFoods;

              showSuccessToast(context, DISH_ADDED_TO_WIZARD_MSG);
            }else if(title == ADD_SIDE_DISH_WIZARD && newValue != ADD_SIDE_DISH_WIZARD){

              List<String> newDishType= [];
              newDishType.addAll(_sideDishTypes);
              newDishType.add(newValue.toString());
              _sideDishTypes= newDishType;

              List<Food> newDishFoods= [];
              newDishFoods.addAll(_sideDishFoods);
              newDishFoods.add(Food(name: ''));
              _sideDishFoods= newDishFoods;
              showSuccessToast(context, DISH_ADDED_TO_WIZARD_MSG);
            }
          });
        },

      ),
    );
  }



}





