import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/suggested_different_foods_combination_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/custom_radio_button.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/debouncer.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/foods_macro_list_ui.dart';
import '../../../../main_screen.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../data/repository_impl/foods_repository_impl.dart';
import '../../domain/model/food_model.dart';
import '../../domain/model/food_type.dart';
import '../../domain/model/logged_foods_model.dart';
import '../bloc/get_logged_foods_bloc/get_logged_foods_bloc.dart';
import '../bloc/get_logged_foods_bloc/state_event/get_logged_foods_state_event.dart';
import '../bloc/groceries_bloc/groceries_bloc.dart';
import '../bloc/groceries_bloc/state_event/groceries_state_event.dart';
import '../bloc/my_favorite_foods/my_favorite_foods_bloc.dart';
import '../bloc/my_favorite_foods/state_event/my_favorite_foods_state_event.dart';
import '../bloc/suggest_portion_bloc/state_event/suggest_portion_state_event.dart';
import '../bloc/suggest_portion_bloc/suggest_portion_bloc.dart';


const int MAX_CALORIES = 10000;
const int MAX_PROTEIN = 500;
const int MAX_CARB = 2000;
const int MAX_FAT = 5000;

class RequestFoodsPortionsScreen extends StatefulWidget {

  const RequestFoodsPortionsScreen({super.key});

  @override
  State<RequestFoodsPortionsScreen> createState() => _RequestFoodsPortionsScreenState();
}

class _RequestFoodsPortionsScreenState extends State<RequestFoodsPortionsScreen> {




  late TextEditingController _minCalorieGoalController;
  late TextEditingController _minProteinGoalController;
  late TextEditingController _minCarbGoalController;
  late TextEditingController _minFatGoalController;

  late TextEditingController _maxCalorieGoalController;
  late TextEditingController _maxProteinGoalController;
  late TextEditingController _maxCarbGoalController;
  late TextEditingController _maxFatGoalController;

  String _foodType = GROCERY_LABEL;
  late TextEditingController _calorieController;
  late TextEditingController _proteinController;
  late TextEditingController _carbController;
  late TextEditingController _fatController;
  late TextEditingController _servingController;
  late TextEditingController _foodNameController;
  late TextEditingController _unitController;
  final List<bool> _foodsExpansionState = [];
  Color _foodNameBorderColor = DARK_PRIMARY_COLOR;
  List<String> _addNewFoodOptions= [];
  String _selectedAddFoodOption = '';
  bool _searchedFoodsVisible = false;

  List<Food> _foods = [];
  List<RangeValues> _foodsServingRanges= [];
  late GroceriesBloc _groceriesBloc;
  late MyFavoriteFoodsBloc _myFavoriteFoodsBloc;
  late GetLoggedFoodsBloc _getLoggedFoodsBloc;

  RangeValues _servingRangeValues = const RangeValues(SERVING_MIN_DEFAULT, SERVING_MAX_DEFAULT);


  final List<String> _restrictionOptions= [NONE_LABEL, PORTION_MIN_CALORIE, PORTION_MAX_CALORIE, PORTION_MIN_PROTEIN, PORTION_MAX_PROTEIN,
    PORTION_MIN_CARB, PORTION_MAX_CARB, PORTION_MIN_FAT, PORTION_MAX_FAT];

  int _selectedRestrictionOption= -1;

  bool _isRestrictionExpanded= false;

  List<GenericFood> _suggestedGroceries= [];

  late SuggestPortionsBloc _suggestPortionsBloc;

  final _debouncer = Debouncer(milliseconds: 1000);



  @override
  void initState() {
    super.initState();
    _foodNameController= TextEditingController();
    _minCalorieGoalController= TextEditingController(text: '0');
    _minProteinGoalController= TextEditingController(text: '0');
    _minCarbGoalController= TextEditingController(text: '0');
    _minFatGoalController= TextEditingController(text: '0');
    _maxCalorieGoalController= TextEditingController(text: '0');
    _maxProteinGoalController= TextEditingController(text: '0');
    _maxCarbGoalController= TextEditingController(text: '0');
    _maxFatGoalController= TextEditingController(text: '0');
    _calorieController= TextEditingController(text: '0');
    _proteinController= TextEditingController(text: '0');
    _carbController= TextEditingController(text: '0');
    _fatController= TextEditingController(text: '0');
    _servingController= TextEditingController(text: '0');
    _unitController= TextEditingController(text: GRAM_LABEL);
    _addNewFoodOptions = [ADD_BY_SEARCH, ADD_MANUALLY];
    _groceriesBloc = context.read<GroceriesBloc>();
    _suggestPortionsBloc = context.read<SuggestPortionsBloc>();
    _myFavoriteFoodsBloc = context.read<MyFavoriteFoodsBloc>();
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();

    _foodNameController.addListener(_onSearchFoodChanged);

    _suggestPortionsBloc.add(const SuggestFoodsPortionEvent.onReset());

    requestLoggedFoods();
  }

  void requestLoggedFoods(){
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    _getLoggedFoodsBloc.add(
        GetLoggedFoodsEvent.onGetImmediateLoggedFoods(formattedDate)
    );
  }

  void _onSearchFoodChanged() {
    setState(() {

    });
    _debouncer.run(() {
      _suggestedGroceries.clear();
      if(_foodNameController.text.isNotEmpty && _selectedAddFoodOption == ADD_BY_SEARCH){
        if(_foodType == GROCERY_LABEL){
          _groceriesBloc.add(
            GroceriesEvent.onGetGroceries(_foodNameController.text,),
          );

          _myFavoriteFoodsBloc.add(
            MyFavoriteFoodsEvent.onGetMyFavoriteFoods(
              FoodType.groceryProduct,
              _foodNameController.text,
            ),
          );

          setState(() {
            _searchedFoodsVisible = true;
          });
        }else{
          _myFavoriteFoodsBloc.add(
            MyFavoriteFoodsEvent.onGetMyFavoriteFoods(
              FoodType.meal,
              _foodNameController.text,
            ),
          );

          setState(() {
            _searchedFoodsVisible = true;
          });
        }
      }
    });
  }


  void setMacroGoalsInScreen(LoggedFoods loggedFoods){
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

      _minCalorieGoalController.text = '${(4/5 * remainedCalorie).toInt()}';
      _minProteinGoalController.text = '${(4/5 * remainedProtein).toInt()}';
      _minCarbGoalController.text = '${(4/5 * remainedCarb).toInt()}';
      _minFatGoalController.text = '${(4/5 * remainedFat).toInt()}';

      _maxCalorieGoalController.text = '${(6/5 * remainedCalorie).toInt()}';
      _maxProteinGoalController.text = '${(6/5 * remainedProtein).toInt()}';
      _maxCarbGoalController.text = '${(6/5 * remainedCarb).toInt()}';
      _maxFatGoalController.text = '${(6/5 * remainedFat).toInt()}';

    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(HOW_MUCH_TO_EAT, style: TextStyle(color: Colors.white)),
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
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              Container(
                                color: LIGHT_GREY_COLOR,
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('$TOTAL_MACRO_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

                                    const SizedBox(height: 8,),

                                    /// total macros
                                    calorieGoalRangeWidgets(),

                                    proteinGoalRangeWidgets(),

                                    carbGoalRangeWidgets(),

                                    fatGoalRangeWidgets()

                                  ],
                                ),
                              ),

                              const SizedBox(height: 16,),

                              /// restriction
                              restrictionWidgets(),

                              const SizedBox(height: 16,),

                              Container(
                                color: LIGHT_GREY_COLOR,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Container(
                                      padding: const EdgeInsets.all(24),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('$ADD_FOOD_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

                                          const SizedBox(height: 8,),

                                          /// food type
                                          CustomRadioListTile(
                                            options: const [GROCERY_LABEL, MEAL_LABEL],
                                            onSelectedOptionChanged: updateSelectedFoodType,
                                            selectedOption: _foodType,
                                            orientation: HORIZONTAL_ORIENTATION,
                                            isEditable: true,
                                          ),

                                          /// add foods chips : add food by search or manual
                                          addFoodsChips(),
                                        ],
                                      ),
                                    ),

                                    /// new food
                                    newGrocery(),
                                  ],
                                ),
                              ),

                              /// added foods
                              addedFoods(),

                            ],
                          ),
                        )
                    ),

                    /// request portions
                    requestPortionsButton(),

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
                      }else if(state is GetImmediateLoggedFoodsState){
                        Future.delayed(Duration.zero,(){
                          _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
                          setMacroGoalsInScreen(state.loggedFoods);
                        });
                      }else if(state is GetLoggedFoodsErrorState){
                        _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
                        Future.delayed(Duration.zero,(){
                          return showErrorToast(context, state.message);
                        });
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SuggestedDifferentFoodsCombinationScreen(suggestedPortionsList: state.suggestedFoodsPortions),
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
            )
        ),
      ),
    );
  }


  Widget restrictionWidgets(){
    return GestureDetector(
      onTap: (){
        setState(() {
          _isRestrictionExpanded= !_isRestrictionExpanded;
        });
      },
      child: Container(
        width: double.infinity,
        color: TOTAL_MACRO_RESTRICTION_BACKGROUND_COLOR,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  _isRestrictionExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
                  color: Colors.black,
                ),

                const SizedBox(width: 8,),


                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$RESTRICTION_LABEL($OPTIONAL_LABEL):', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

                      SizedBox(height: 4,),

                      Text(
                        ASK_RETRICTION_FOOD_PORTION,
                        style: TextStyle(fontSize: 12),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),

            Visibility(
              visible: _isRestrictionExpanded,
              child: Column(
                children: _restrictionOptions
                    .asMap()
                    .entries
                    .map(
                      (entry) {
                    return RadioListTile(
                      contentPadding: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
                      title: Text(entry.value, style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 12, fontFamily: MONTSERRAT_FONT)),
                      value: entry.key,
                      activeColor: DARK_PRIMARY_COLOR,
                      groupValue: _selectedRestrictionOption,
                      onChanged: (value) {
                        bool isEnabled= false;
                        switch(value){
                          case 0:
                            isEnabled= true;
                            break;
                          case 1:
                            if(_minCalorieGoalController.text.isNotEmpty && _minCalorieGoalController.text != '0' &&
                                _maxCalorieGoalController.text.isNotEmpty && _minCalorieGoalController.text != '0'){
                              isEnabled = true;
                            }else{
                              showErrorToast(context,ERROR_RESTRICTION_CALORIE);
                            }
                            break;
                          case 2:
                            if(_minCalorieGoalController.text.isNotEmpty && _minCalorieGoalController.text != '0' &&
                                _maxCalorieGoalController.text.isNotEmpty && _minCalorieGoalController.text != '0'){
                              isEnabled = true;
                            }else{
                              showErrorToast(context,ERROR_RESTRICTION_CALORIE);
                            }
                            break;
                          case 3:
                            if(_minProteinGoalController.text.isNotEmpty && _minProteinGoalController.text != '0' &&
                                _maxProteinGoalController.text.isNotEmpty && _minProteinGoalController.text != '0'){
                              isEnabled = true;
                            }else{
                              showErrorToast(context,ERROR_RESTRICTION_PROTEIN);
                            }
                            break;
                          case 4:
                            if(_minProteinGoalController.text.isNotEmpty && _minProteinGoalController.text != '0' &&
                                _maxProteinGoalController.text.isNotEmpty && _minProteinGoalController.text != '0'){
                              isEnabled = true;
                            }else{
                              showErrorToast(context,ERROR_RESTRICTION_PROTEIN);
                            }
                            break;
                          case 5:
                            if(_minCarbGoalController.text.isNotEmpty && _minCarbGoalController.text != '0' &&
                                _maxCarbGoalController.text.isNotEmpty && _minCarbGoalController.text != '0'){
                              isEnabled = true;
                            }else{
                              showErrorToast(context,ERROR_RESTRICTION_CARB);
                            }
                            break;
                          case 6:
                            if(_minCarbGoalController.text.isNotEmpty && _minCarbGoalController.text != '0' &&
                                _maxCarbGoalController.text.isNotEmpty && _minCarbGoalController.text != '0'){
                              isEnabled = true;
                            }else{
                              showErrorToast(context,ERROR_RESTRICTION_CARB);
                            }
                            break;
                          case 7:
                            if(_minFatGoalController.text.isNotEmpty && _minFatGoalController.text != '0' &&
                                _maxFatGoalController.text.isNotEmpty && _minFatGoalController.text != '0'){
                              isEnabled = true;
                            }else{
                              showErrorToast(context,ERROR_RESTRICTION_FAT);
                            }
                            break;
                          case 8:
                            if(_minFatGoalController.text.isNotEmpty && _minFatGoalController.text != '0' &&
                                _maxFatGoalController.text.isNotEmpty && _minFatGoalController.text != '0'){
                              isEnabled = true;
                            }else{
                              showErrorToast(context,ERROR_RESTRICTION_FAT);
                            }
                            break;
                        }
                        if(isEnabled){
                          setState(() {
                            _selectedRestrictionOption = value ?? -1;
                          });
                        }
                      },
                    );
                  },
                ).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget requestPortionsButton(){
    return Container(
            padding: const EdgeInsets.only(bottom: 24),
            width: double.infinity,
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: DARK_PRIMARY_COLOR
            ),
            onPressed: () {
              List<List<double>> servings = [];
              _foodsServingRanges.forEach((element) {
                List<double> list = [];
                list.add(element.start);
                list.add(element.end);
                servings.add(list);
              });

              List<List<double>> macroGoalsRange= [];
              double minCalorie= _minCalorieGoalController.text.isEmpty ? 0.0 : double.parse(_minCalorieGoalController.text);
              double minProtein= _minProteinGoalController.text.isEmpty ? 0.0 : double.parse(_minProteinGoalController.text);
              double minCarb= _minCarbGoalController.text.isEmpty ? 0.0 : double.parse(_minCarbGoalController.text);
              double minFat= _minFatGoalController.text.isEmpty ? 0.0 : double.parse(_minFatGoalController.text);

              double maxCalorie= _maxCalorieGoalController.text.isEmpty ? 0.0 : double.parse(_maxCalorieGoalController.text);
              double maxProtein= _maxProteinGoalController.text.isEmpty ? 0.0 : double.parse(_maxProteinGoalController.text);
              double maxCarb= _maxCarbGoalController.text.isEmpty ? 0.0 : double.parse(_maxCarbGoalController.text);
              double maxFat= _maxFatGoalController.text.isEmpty ? 0.0 : double.parse(_maxFatGoalController.text);


              if(minCalorie == 0.0 && maxCalorie == 0.0 &&
                minProtein == 0.0 && maxProtein == 0.0 &&
                minCarb == 0.0 && maxCarb == 0.0 &&
                minFat == 0.0 && maxFat == 0.0){
                showErrorToast(context, ERROR_NO_GOAL);
                return;
              }


              if(minCalorie >= MAX_CALORIES || maxCalorie >= MAX_CALORIES){
                showErrorToast(context, ERROR_MAX_CALORIE);
                return;
              }

              if(minProtein >= MAX_PROTEIN || maxProtein >= MAX_PROTEIN ){
                showErrorToast(context, ERROR_MAX_PROTEIN);
                return;
              }

              if(minCarb >= MAX_CARB|| maxCarb >= MAX_CARB){
                showErrorToast(context, ERROR_MAX_CARB);
                return;
              }

              if(minFat >= MAX_FAT || maxFat >= MAX_FAT){
                showErrorToast(context, ERROR_MAX_FAT);
                return;
              }

              if(_foods.isEmpty){
                showErrorToast(context, ERROR_ADD_FOOD);
                return;
              }

              if(maxCalorie == 0){
                maxCalorie= MAX_CALORIES.toDouble();
              }
              if(maxProtein == 0){
                maxProtein= MAX_PROTEIN.toDouble();
              }

              if(maxCarb == 0){
                maxCarb = MAX_CARB.toDouble();
              }

              if(maxFat == 0){
                maxFat = MAX_FAT.toDouble();
              }

              macroGoalsRange.add(maxCalorie > minCalorie ? [minCalorie, maxCalorie] : [maxCalorie, minCalorie]);
              macroGoalsRange.add(maxProtein > minProtein ? [minProtein, maxProtein] : [maxProtein, minProtein]);
              macroGoalsRange.add(maxCarb > minCarb ? [minCarb, maxCarb] : [maxCarb, minCarb]);
              macroGoalsRange.add(maxFat > minFat ? [minFat, maxFat] : [maxFat, minFat]);

              List<String> restriction= [];
              if(_selectedRestrictionOption != -1 && _selectedRestrictionOption != 0){
                switch(_selectedRestrictionOption){
                  case 1:
                    restriction= ['1', 'min'];
                    break;
                  case 2:
                    restriction= ['1', 'max'];
                    break;
                  case 3:
                    restriction= ['2', 'min'];
                    break;
                  case 4:
                    restriction= ['2', 'max'];
                    break;
                  case 5:
                    restriction= ['3', 'min'];
                    break;
                  case 6:
                    restriction= ['3', 'max'];
                    break;
                  case 7:
                    restriction= ['4', 'min'];
                    break;
                  case 8:
                    restriction= ['4', 'max'];
                    break;
                }
              }

              _suggestPortionsBloc.add(
                  SuggestFoodsPortionEvent.onSuggestFoodsPortion(
                      _foods,
                      servings,
                      macroGoalsRange,
                      restriction
                  )
              );
            },
            child: const Text(REQUEST_PORTIONS_LABEL, style: TextStyle( color: Colors.white),),
        ),
      );
  }



  void updateSelectedFoodType(String type){
    setState(() {
      _foodType = type;
      resetMacroAmounts();
    });
  }

  void resetMacroAmounts(){
    _foodNameController.text = '';
    _calorieController.text = '0';
    _proteinController.text = '0';
    _carbController.text = '0';
    _fatController.text = '0';
    _servingController.text = '0';
    _unitController.text= GRAM_LABEL;
     _servingRangeValues = const RangeValues(SERVING_MIN_DEFAULT, SERVING_MAX_DEFAULT);
  }

  void updateFoodsExpansionStateListUi(int index, bool state, bool isRemove){
    setState(() {
      if(isRemove){
        _foodsExpansionState.removeAt(index);
      }else{
        if(state == true){
          for (int i = 0; i < _foodsExpansionState.length; i++) {
            _foodsExpansionState[i] = false;
          }
        }
        _foodsExpansionState[index] = state;
      }
    });
  }

  Widget addedFoods(){
    return Visibility(
        visible: _foods.isNotEmpty,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16,),
            const Text('$FOODS_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),
            const SizedBox(height: 16,),
            FoodsMacroListUi(foods: _foods, foodsExpansionState: _foodsExpansionState,
              onExpansionStateChanged: updateFoodsExpansionStateListUi, onFoodsUpdated: updateUiAfterFoodsUpdated, foodsServingRanges: _foodsServingRanges,
            )
          ],
        )
    );
  }

  void updateUiAfterFoodsUpdated(List<Food> foods, List<RangeValues> ranges){
    setState(() {
      _selectedAddFoodOption = '';
      _foods = foods;
      _foodsServingRanges = ranges;
    });
  }

  Widget newGrocery(){
    return Visibility(
      visible: _selectedAddFoodOption == ADD_BY_SEARCH && _foodType == GROCERY_LABEL,
      child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                    onTap: () {
                      setState(() {
                        _selectedAddFoodOption = '';
                      });
                    },
                  ),
                  const SizedBox(height: 12,),
                  Stack(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: SEARCH_BAR_HEIGHT,
                              child: TextField(
                                controller: _foodNameController,
                                decoration:  InputDecoration(
                                  hintText: CHEDDAR_CHEESE_LABEL,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: _foodNameBorderColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: _foodNameBorderColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: _foodNameBorderColor, width: 2),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12,),
                          Visibility(
                            visible: _selectedAddFoodOption == ADD_BY_SEARCH,
                            child: GestureDetector(
                              child: const CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.orange,
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                _groceriesBloc.add(
                                  GroceriesEvent.onGetGroceries(_foodNameController.text,),
                                );
                                setState(() {
                                  _searchedFoodsVisible = true;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      suggestedGroceriesBloc()
                    ],
                  ),

                  const SizedBox(height: 16,),

                  newFoodMacroAmountsWidgets(),

                  const SizedBox(height: 16,),


                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(PRIMARY_COLOR),
                          ),
                          onPressed: () {
                            addFoodClickListener();
                          },
                          child: const Text(ADD_LABEL, style: TextStyle( color: Colors.white),),
                        ),
                      ]
                  ),
                ],
              ),
            )
        ),
    );
  }

  void addFoodClickListener(){

    if(_foodNameController.text.isEmpty){
      setState(() {
        _foodNameBorderColor = Colors.red;
      });
      return;
    }

    if((_calorieController.text.isEmpty || _calorieController.text == '0') && (_proteinController.text.isEmpty || _proteinController.text == '0') &&
        (_carbController.text.isEmpty || _carbController.text == '0') && (_fatController.text.isEmpty || _fatController.text == '0') && _selectedAddFoodOption == ADD_BY_SEARCH
    ){
      showErrorToast(context, ERROR_EMPTY_MACRO_SEARCH);
      return;
    }

    setState(() {
      Food newFood = Food();
      if(_foodType == GROCERY_LABEL){
        newFood = Food(
          foodType: FoodType.groceryProduct,
          name: _foodNameController.text,
          servingAmounts: [_servingController.text],
          units: [_unitController.text],
          calorie: [_calorieController.text],
          protein: [_proteinController.text],
          carb: [_carbController.text],
          fat: [_fatController.text],
        );
      }else{
        newFood = Food(
            foodType: FoodType.meal,
            name: _foodNameController.text,
            servingAmount: double.parse(_servingController.text),
            unit: _unitController.text,
            calorie: [_calorieController.text],
            protein: [_proteinController.text],
            carb: [_carbController.text],
            fat: [_fatController.text]
        );
      }
      _foods.add(newFood);
      _selectedAddFoodOption = '';
      _foodNameBorderColor = Colors.black;
      _foodsExpansionState.add(false);
      _foodsServingRanges.add(_servingRangeValues);
    });
  }


  Widget suggestedGroceriesBloc(){
    return  Visibility(
      visible: _searchedFoodsVisible,
      child: Container(
          width: 300,
          height: 200,
          padding: const EdgeInsets.only(top: 4, right: 4),
          decoration: BoxDecoration(
            color: LIGHT_GREY_COLOR,
            borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
          ),
          margin: const EdgeInsets.only(top: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onTap: () {
                  setState(() {
                    _searchedFoodsVisible = false;
                  });
                },
              ),


              suggestedGroceriesList(),


              BlocConsumer<GroceriesBloc, GroceriesState>(
                  builder: (context, state) {
                    if (state is GroceriesLoadingState) {
                      return const Stack(
                        children: [
                          GFLoader(
                            type: GFLoaderType.circle,
                            loaderColorOne: DARK_PRIMARY_COLOR,
                            loaderColorTwo: DARK_PRIMARY_COLOR,
                            loaderColorThree: DARK_PRIMARY_COLOR,
                          ),
                        ],
                      );
                    }else if(state is GroceriesLoadedState){
                      Future.delayed(Duration.zero,(){
                        setState(() {
                          _suggestedGroceries.addAll(state.foods);
                          _groceriesBloc.add(const GroceriesEvent.onReset());
                        });
                      });
                    }else if(state is GroceriesErrorState){
                      _groceriesBloc.add(const GroceriesEvent.onReset());
                      Future.delayed(Duration.zero,(){
                        return showErrorToast(context, state.message);
                      });
                    }
                    return Container();
                  },
                  listener: (context, state){

                  }
              ),
            ],
          )
      ),
    );
  }


  Widget suggestedFoodsBloc(){
    return  Visibility(
      visible: _searchedFoodsVisible,
      child: Container(
          width: 300,
          height: 200,
          padding: EdgeInsets.only(top: 4, right: 4),
          decoration: BoxDecoration(
            color: LIGHT_GREY_COLOR,
            borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
          ),
          margin: const EdgeInsets.only(top: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onTap: () {
                  setState(() {
                    _searchedFoodsVisible = false;
                  });
                },
              ),


              suggestedFoodsList(),


              BlocConsumer<GroceriesBloc, GroceriesState>(
                  builder: (context, state) {
                    if (state is GroceriesLoadingState) {
                      return const Stack(
                        children: [
                          GFLoader(
                            type: GFLoaderType.circle,
                            loaderColorOne: DARK_PRIMARY_COLOR,
                            loaderColorTwo: DARK_PRIMARY_COLOR,
                            loaderColorThree: DARK_PRIMARY_COLOR,
                          ),
                        ],
                      );
                    }else if(state is GroceriesLoadedState){
                      Future.delayed(Duration.zero,(){
                        setState(() {
                          // _suggestedFoods.addAll(state.foods);
                          _groceriesBloc.add(const GroceriesEvent.onReset());
                        });
                      });
                    }else if(state is GroceriesErrorState){
                      _groceriesBloc.add(const GroceriesEvent.onReset());
                      Future.delayed(Duration.zero,(){
                        return showErrorToast(context, state.message);
                      });
                    }
                    return Container();
                  },
                  listener: (context, state){

                  }
              ),

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
                        setState(() {
                          _myFavoriteFoodsBloc.add(const MyFavoriteFoodsEvent.onReset());
                          // _suggestedGroceries.addAll(state.foods);
                        });
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
            ],
          )
      ),
    );
  }


  Widget suggestedGroceriesList(){
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: _suggestedGroceries.length,
          itemBuilder: (context, index){
            GenericFood food = _suggestedGroceries[index];
            return GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Text(food.name.capitalize(), style: const TextStyle(color: Colors.blueGrey, fontSize: 12),)
                  ),
                  const SizedBox(height: 8,),
                ],
              ),
              onTap: (){
                setState(() {
                  _searchedFoodsVisible = false;
                  _foodNameController= TextEditingController(text: food.name);
                  _calorieController = TextEditingController(text: food.calorie[0].toString());
                  _proteinController = TextEditingController(text: food.protein[0].toString());
                  _carbController = TextEditingController(text: food.carb[0].toString());
                  _fatController = TextEditingController(text: food.fat[0].toString());
                  _foodType = GROCERY_LABEL;
                  _servingController = TextEditingController(text: food.servingAmounts[0]);
                  _unitController = TextEditingController(text: food.units[0]);
                  _foodNameController.addListener(_onSearchFoodChanged);
                });
              },
            );
          }
      ),
    );
  }

  Widget suggestedFoodsList(){
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: _suggestedGroceries.length,
          itemBuilder: (context, index){
            GenericFood food = _suggestedGroceries[index];
            return GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Text(food.name.capitalize(), style: const TextStyle(color: Colors.blueGrey, fontSize: 12),)
                  ),
                  const SizedBox(height: 8,),
                ],
              ),
              onTap: (){
                setState(() {
                  _searchedFoodsVisible = false;
                  _foodNameController= TextEditingController(text: food.name);
                  _calorieController = TextEditingController(text: food.calorie[0].toString());
                  _proteinController = TextEditingController(text: food.protein[0].toString());
                  _carbController = TextEditingController(text: food.carb[0].toString());
                  _fatController = TextEditingController(text: food.fat[0].toString());

                  // if(food.foodType == FoodType.groceryProduct){
                  //   _foodType = GROCERY_LABEL;
                  //   _servingController = TextEditingController(text: food.servingAmounts[0]);
                  //   _unitController = TextEditingController(text: food.units[0]);
                  // }else{
                  //   _foodType = MEAL_LABEL;
                  //   _servingController = TextEditingController(text: food.servingAmount.toString());
                  //   _unitController = TextEditingController(text: food.unit.toString());
                  // }

                  _foodNameController.addListener(_onSearchFoodChanged);
                });
              },
            );
          }
      ),
    );
  }

  Widget addFoodsChips(){
    /// add foods chips
    return Wrap(
        spacing: 4,
        children: _addNewFoodOptions.map((item) {
          if(_selectedAddFoodOption == item){
            return addFoodOptionChipSelected(item);
          }else{
            return addFoodChipNotSelected(item);
          }
        },).toList(),
      );
  }

  Widget addFoodOptionChipSelected(String option){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedAddFoodOption= '';
          _searchedFoodsVisible = false;
          resetMacroAmounts();
        });
      },
      child: Chip(
        backgroundColor: DARK_PRIMARY_COLOR,
        label: Text(option, style: const TextStyle(color: Colors.white),),
      ),
    );
  }

  Widget addFoodChipNotSelected(String option){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedAddFoodOption= option;
          _searchedFoodsVisible = false;
          resetMacroAmounts();
        });
      },
      child: Chip(
        label: Text(option),
      ),
    );
  }

  Widget newFoodMacroAmountsWidgets(){
    return Column(
      children: [
        ///  serving + unit
        Row(
          children: [


            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$SERVING_AMOUNT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _servingController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
            const SizedBox(width: 20,),
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$UNIT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _unitController,
                style: const TextStyle(fontSize: 11),
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

          ],
        ),

        const SizedBox(height: 4,),

        /// calorie + protein
        Row(
          children: [
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$CALORIE_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _calorieController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
            const SizedBox(width: 20,),
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$PROTEIN_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _proteinController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
          ],
        ),

        const SizedBox(height: 12,),

        ///  carb + fat
        Row(
          children: [
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$CARB_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _carbController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
            const SizedBox(width: 20,),
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$FAT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _fatController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
          ],
        ),


        const SizedBox(height: 48,),

        /// how many serving?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('$SERVINGS_RANGE:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),
            const SizedBox(height: 12,),
            servingRange()
          ],
        ),
      ],
    );
  }

  Widget calorieGoalRangeWidgets(){
    return Column(
      children: [
        /// calorie
        const SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _minCalorieGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
            const SizedBox(width: 16,),

            const SizedBox(
              width: MACRO_SIZE_WIDTH,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '$CALORIE_RANGE_LABEL',
                  style: TextStyle(
                    color: DARK_PRIMARY_COLOR,
                    fontWeight: FontWeight.bold,
                    fontSize: FONT_HEADER,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16,),


            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _maxCalorieGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
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

          ],
        ),
      ],
    );
  }
  Widget proteinGoalRangeWidgets(){
    return Column(
      children: [

        const SizedBox(height: 12,),

        /// protein
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _minProteinGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
            const SizedBox(width: 16,),

            const SizedBox(
              width: MACRO_SIZE_WIDTH,
              child: Align(
                alignment: Alignment.center,
                  child: Text('$PROTEIN_RANGE_LABEL', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
              ),
            ),

            const SizedBox(width: 16,),

            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _maxProteinGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
          ],
        ),
      ],
    );
  }
  Widget carbGoalRangeWidgets(){
    return Column(
      children: [

        const SizedBox(height: 12,),

        ///  carb
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _minCarbGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
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

            const SizedBox(width: 16,),

            const SizedBox(
              width: MACRO_SIZE_WIDTH,
              child: Align(
                alignment: Alignment.center,
                  child: Text('$CARB_RANGE_LABEL', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
              ),
            ),

            const SizedBox(width: 16,),

            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _maxCarbGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
          ],
        ),
      ],
    );
  }
  Widget fatGoalRangeWidgets(){
    return Column(
      children: [

        const SizedBox(height: 12,),

        ///  fat
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _minFatGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
            const SizedBox(width: 16,),

            const SizedBox(
              width: MACRO_SIZE_WIDTH,
              child: Align(
                alignment: Alignment.center,
                  child: Text('$FAT_RANGE_LABEL', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
              ),
            ),

            const SizedBox(width: 16,),

            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _maxFatGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
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

          ],
        ),
      ],
    );
  }


  Widget servingRange(){
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: Row(
        children: [
          SizedBox(
            width: 30,
              child: Text(_servingRangeValues.start.toStringAsFixed(1), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),)
          ),
          RangeSlider(
            values: _servingRangeValues,
            min: SERVING_MIN,
            max: SERVING_MAX,
            activeColor: DARK_PRIMARY_COLOR, // Set the active color here
            inactiveColor: Colors.grey,
            divisions: SERVING_DEVISION,
            onChanged: (values) {
              setState(() {
                _servingRangeValues = values;
              });
            },
          ),
          SizedBox(
              width: 30,
              child: Text(_servingRangeValues.end.toStringAsFixed(1), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),)
          ),
        ],
      ),
    );
  }





}
