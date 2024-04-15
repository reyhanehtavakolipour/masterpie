import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/debouncer.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/meal_ingredients_list_ui.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/food_detail_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/unit_options.dart';
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
import '../../domain/model/generic_food_model.dart';
import '../bloc/add_or_update_my_favorite_bloc/add_or_update_my_favorite_bloc.dart';
import '../bloc/add_or_update_my_favorite_bloc/state_event/add_or_update_my_favorite_state_event.dart';
import '../bloc/get_logged_foods_bloc/get_logged_foods_bloc.dart';
import '../bloc/get_logged_foods_bloc/state_event/get_logged_foods_state_event.dart';
import '../bloc/groceries_bloc/groceries_bloc.dart';
import '../bloc/groceries_bloc/state_event/groceries_state_event.dart';
import '../bloc/log_foods_bloc/log_foods_bloc.dart';
import '../bloc/log_foods_bloc/state_event/log_foods_state_event.dart';
import '../bloc/my_favorite_foods/my_favorite_foods_bloc.dart';


class EditLoggedFoodScreen extends StatefulWidget {

  final FoodDetailArgumentModel foodDetailArgumentModel;

  const EditLoggedFoodScreen({super.key, required this.foodDetailArgumentModel});

  @override
  State<EditLoggedFoodScreen> createState() => _EditLoggedFoodScreenState();
}

class _EditLoggedFoodScreenState extends State<EditLoggedFoodScreen> {
  
  late TextEditingController _totalCalorieController;
  late TextEditingController _totalProteinController;
  late TextEditingController _totalCarbController;
  late TextEditingController _totalFatController;
  late TextEditingController _totalServingController;
  late TextEditingController _totalUnitController;

  GenericFood _selectedGenericIngredient = GenericFood();
  int _selectedNewIngredientUnitIndex = 0;
  List<String> _searchUnitOptions = [];

  final _debouncer = Debouncer(milliseconds: 1000);


  late TextEditingController _calorieController;
  late TextEditingController _proteinController;
  late TextEditingController _carbController;
  late TextEditingController _fatController;
  late TextEditingController _servingController;
  late TextEditingController _ingredientNameController;
  late TextEditingController _groceryNameController;
  late TextEditingController _unitController;
  final List<bool> _ingredientsExpansionState = [];
  Color _ingredientNameBorderColor = DARK_PRIMARY_COLOR;
  Food _initialStateFood = Food();
  double _previousCoefficient= 1.0;

  late TextEditingController _mealNameController;
  List<String> _addNewIngredientOptions= [];
  String _selectedAddIngredientOption = '';
  late TextEditingController _ingredientServingCountController;
  late TextEditingController _recipeController;
  Color _mealNameBorderColor = DARK_PRIMARY_COLOR;


  String _selectedAddGroceryOption = ADD_GROCERY_BY_SEARCH_LABEL;
  bool _searchedGroceriesVisible = false;


  String _foodType = GROCERY_LABEL;
  late GroceriesBloc _groceriesBloc;
  Food newFood = Food();


  List<GenericFood> _suggestedGroceries= [];

   late GetLoggedFoodsBloc _getLoggedFoodsBloc;
   late LogFoodsBloc _logFoodsBloc;

  @override
  void initState() {
    super.initState();
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();
    _logFoodsBloc = context.read<LogFoodsBloc>();
    _mealNameController= TextEditingController();
    _totalCalorieController= TextEditingController(text: '0');
    _totalProteinController= TextEditingController(text: '0');
    _totalCarbController= TextEditingController(text: '0');
    _totalFatController= TextEditingController(text: '0');
    _totalServingController= TextEditingController(text: '100');
    _totalUnitController= TextEditingController(text: 'g');
    _calorieController= TextEditingController(text: '0');
    _proteinController= TextEditingController(text: '0');
    _carbController= TextEditingController(text: '0');
    _fatController= TextEditingController(text: '0');
    _servingController= TextEditingController(text: '0');
    _ingredientServingCountController= TextEditingController(text: '1.0');
    _unitController= TextEditingController(text: 'g');
    _ingredientNameController= TextEditingController();
    _groceryNameController= TextEditingController();
    _recipeController= TextEditingController();
    _addNewIngredientOptions = [ADD_INGREDIENT_BY_SEARCH, ADD_INGREDIENT_MANUALLY];

    _ingredientNameController.addListener(_onSearchIngredientChanged);

    _groceriesBloc = context.read<GroceriesBloc>();

    init();

    _totalServingController.addListener(_onTotalServingChanged);

  }


  void _onTotalServingChanged() {
    setState(() {

    });
    _debouncer.run(() {
      if(_foodType == MEAL_LABEL){
        setState(() {
          if(num.parse(_totalServingController.text.isEmpty ? '0' : _totalServingController.text) > 0){
            double coefficient = num.parse(_totalServingController.text.isEmpty ? _initialStateFood.servingAmount.toString() : _totalServingController.text)/_initialStateFood.servingAmount;
            List<String> servingIngredientsCount = [];
            List<String> currentServingIngredientsCount = List<String>.from(newFood.servingIngredientsCount);
            currentServingIngredientsCount.forEach((element) {
              servingIngredientsCount.add((double.parse(element)*_previousCoefficient*coefficient).toString());
            });

            newFood= newFood.copyWith(
                servingIngredientsCount: servingIngredientsCount,
                calorie: _initialStateFood.calorie,
                protein: _initialStateFood.protein,
                carb: _initialStateFood.carb,
                fat: _initialStateFood.fat
            );
            _previousCoefficient= 1/coefficient;
            calculateTotalMacros();
          }
        });
      }else{
        setState(() {
          if(num.parse(_totalServingController.text.isEmpty ? '0' : _totalServingController.text) > 0){
            double count = num.parse(_totalServingController.text)/double.parse(_initialStateFood.servingAmounts[0]);
            newFood= newFood.copyWith(
                servingAmounts: [_totalServingController.text],
                calorie: [(double.parse(_initialStateFood.calorie[0]) * count).toString()],
                protein: [(double.parse(_initialStateFood.protein[0]) * count).toString()],
                carb: [(double.parse(_initialStateFood.carb[0]) * count).toString()],
                fat: [(double.parse(_initialStateFood.fat[0]) * count).toString()]
            );

            _totalCalorieController = TextEditingController(text: '${double.parse(_initialStateFood.calorie[0]) * count}');
            _totalProteinController = TextEditingController(text: '${double.parse(_initialStateFood.protein[0]) * count}');
            _totalCarbController = TextEditingController(text: '${double.parse(_initialStateFood.carb[0]) * count}');
            _totalFatController = TextEditingController(text: '${double.parse(_initialStateFood.fat[0]) * count}');
          }
        });
      }
    });
  }
  
   void requestLoggedFoods(){
     String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
     _getLoggedFoodsBloc.add(
         GetLoggedFoodsEvent.onGetImmediateLoggedFoods(formattedDate)
     );
   }

   void logFoodsOfToday(List<Food> foodsLoggedBefore){
     List<Food> foods = [];
     for(int i = 0; i < foodsLoggedBefore.length; i++){
       if(foodsLoggedBefore[i].name.toString() == widget.foodDetailArgumentModel.food!.name.toString() &&
           foodsLoggedBefore[i].foodType.name.toString() == widget.foodDetailArgumentModel.food!.foodType.name.toString() &&
           foodsLoggedBefore[i].calorie.toString() == widget.foodDetailArgumentModel.food!.calorie.toString() &&
           foodsLoggedBefore[i].protein.toString() == widget.foodDetailArgumentModel.food!.protein.toString() &&
           foodsLoggedBefore[i].carb.toString() == widget.foodDetailArgumentModel.food!.carb.toString() &&
           foodsLoggedBefore[i].fat.toString() == widget.foodDetailArgumentModel.food!.fat.toString()){
         foods.add(newFood);
       }else{
         foods.add(foodsLoggedBefore[i]);
       }
     }
     _logFoodsBloc.add(
         LogFoodsEvent.onLogFoods(foods)
     );
   }

  Widget buildBottomButton(BuildContext context){
    return Column(
      children: [
        Container(
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
                bottomButtonClickListener(context);
              },
              child: const Text(UPDATE_LOG_LABEL,
                style: TextStyle( color: Colors.white),)
          ),
        ),
      ],
    );
  }

  void init(){
    if(widget.foodDetailArgumentModel.food?.foodType == FoodType.groceryProduct){
      _foodType = GROCERY_LABEL;
      _groceryNameController.text = widget.foodDetailArgumentModel.food!.name;
      _totalServingController.text = widget.foodDetailArgumentModel.food!.servingAmounts[0].toString();
      _totalCalorieController.text = widget.foodDetailArgumentModel.food!.calorie[0];
      _totalProteinController.text = widget.foodDetailArgumentModel.food!.protein[0];
      _totalCarbController.text = widget.foodDetailArgumentModel.food!.carb[0];
      _totalFatController.text = widget.foodDetailArgumentModel.food!.fat[0];
      _totalUnitController.text = widget.foodDetailArgumentModel.food!.units[0];
    }else{
      double calorie = 0;
      for (int i = 0; i < widget.foodDetailArgumentModel.food!.calorie.length; i++) {
        if(i < widget.foodDetailArgumentModel.food!.servingIngredientsCount.length){
          double servingCount = double.parse(widget.foodDetailArgumentModel.food!.servingIngredientsCount[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.servingIngredientsCount[i]);
          calorie = calorie + double.parse(widget.foodDetailArgumentModel.food!.calorie[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.calorie[i])*servingCount;
        }
      }

      double protein = 0;
      for (int i = 0; i < widget.foodDetailArgumentModel.food!.protein.length; i++) {
        if(i < widget.foodDetailArgumentModel.food!.servingIngredientsCount.length){
          double servingCount = double.parse(widget.foodDetailArgumentModel.food!.servingIngredientsCount[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.servingIngredientsCount[i]);
          protein = protein + double.parse(widget.foodDetailArgumentModel.food!.protein[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.protein[i])*servingCount;
        }
      }

      double carb = 0;
      for (int i = 0; i < widget.foodDetailArgumentModel.food!.carb.length; i++) {
        if(i < widget.foodDetailArgumentModel.food!.servingIngredientsCount.length){
          double servingCount = double.parse(widget.foodDetailArgumentModel.food!.servingIngredientsCount[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.servingIngredientsCount[i]);
          carb = carb + double.parse(widget.foodDetailArgumentModel.food!.carb[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.carb[i])*servingCount;
        }
      }


      double fat = 0;
      for (int i = 0; i < widget.foodDetailArgumentModel.food!.fat.length; i++) {
        if(i < widget.foodDetailArgumentModel.food!.servingIngredientsCount.length){
          double servingCount = double.parse(widget.foodDetailArgumentModel.food!.servingIngredientsCount[i].isEmpty ? '0': widget.foodDetailArgumentModel.food!.servingIngredientsCount[i]);
          fat = fat + double.parse(widget.foodDetailArgumentModel.food!.fat[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.fat[i])*servingCount;
        }
      }
      _foodType = MEAL_LABEL;
      _mealNameController.text = widget.foodDetailArgumentModel.food!.name;
      _totalServingController.text = widget.foodDetailArgumentModel.food!.servingAmount.toString();
      _totalCalorieController.text = calorie.toString();
      _totalProteinController.text = protein.toString();
      _totalCarbController.text = carb.toString();
      _totalFatController.text = fat.toString();
      _totalUnitController.text = widget.foodDetailArgumentModel.food!.unit;
      _recipeController.text = widget.foodDetailArgumentModel.food!.recipe;
      widget.foodDetailArgumentModel.food!.ingredients.forEach((element) {
        _ingredientsExpansionState.add(false);
      });
    }

    newFood = widget.foodDetailArgumentModel.food!;
    _initialStateFood= newFood;
  }

  void bottomButtonClickListener(BuildContext context){
    if(num.parse(_totalServingController.text.isEmpty ? '0' : _totalServingController.text) <= 0){
      setState(() {
        showErrorToast(context, ERROR_MEAL_SERVING_AMOUNT);
      });
      return;
    }
    if(_groceryNameController.text.isEmpty && _foodType == GROCERY_LABEL){
      setState(() {
        _ingredientNameBorderColor = Colors.red;
        showErrorToast(context, ERROR_GROCERY_NAME_EMPTY);
      });
      return;
    }
    if( _foodType == MEAL_LABEL){
      if(_mealNameController.text.isEmpty ){
        setState(() {
          _mealNameBorderColor = Colors.red;
          showErrorToast(context, ERROR_MEAL_NAME_EMPTY);
        });
        return;
      }

      bool isAnyIngredientEmpty= false;
      newFood.ingredients.forEach((element) {
        if(element.isEmpty){
          showErrorToast(context, ERROR_ENTER_FOOD_NAME);
          isAnyIngredientEmpty= true;
        }
      });

      if(isAnyIngredientEmpty){
        return;
      }
    }
    setState(() {
      _ingredientNameBorderColor = Colors.black;
    });
    requestOperationOnFood(context);
  }
@override
  Widget build(BuildContext context) {
    handleMealMacrosWithoutIngredient();
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(UPDATE_LABEL, style: TextStyle(color: Colors.white),),
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
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  /// meal name
                  mealNameWidget(),


                  /// add ingredient chips
                  addIngredientChips(),

                  const SizedBox(height: 8,),

                  /// new ingredient
                  newIngredient(),


                  /// grocery
                  groceryName(),

                  /// added ingredients
                  addedIngredients(),


                  /// recipe
                  recipe(),

                  const SizedBox(height: 16,),

                  const Text('$TOTAL_MACRO_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

                  const SizedBox(height: 16,),

                  /// total macros
                  macroAmountsWidgets(_totalServingController, _totalCalorieController, _totalProteinController, _totalCarbController, _totalFatController, _totalUnitController),

                  const SizedBox(height: 36,),

                  buildBottomButton(context),

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
                          _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            logFoodsOfToday(state.loggedFoods.foods);
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
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                              builder: (context) => const MainScreen(),
                            ), (route) => false);
                          });
                        }else if(state is LogFoodsErrorState){
                          _logFoodsBloc.add(const LogFoodsEvent.onReset());
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
              ),
            )
        ),
      ),
    );
  }





  void _onSearchIngredientChanged() {
    setState(() {

    });
    _debouncer.run(() {
      _suggestedGroceries.clear();
      if(_ingredientNameController.text.isNotEmpty && _selectedAddIngredientOption == ADD_INGREDIENT_BY_SEARCH){
        _groceriesBloc.add(
          GroceriesEvent.onGetGroceries(_ingredientNameController.text),
        );
        setState(() {
          _searchedGroceriesVisible = true;
        });
      }
    });
  }


  void handleMealMacrosWithoutIngredient(){
    if(newFood.foodType == FoodType.meal && newFood.ingredients.isEmpty){
      String calorie= newFood.calorie.isEmpty ? '0.0' : newFood.calorie[0];
      String protein= newFood.protein.isEmpty ? '0.0' : newFood.protein[0];
      String carb= newFood.carb.isEmpty ? '0.0' : newFood.carb[0];
      String fat= newFood.fat.isEmpty ? '0.0' : newFood.fat[0];

      _totalCalorieController = TextEditingController(text: calorie);
      _totalProteinController = TextEditingController(text: protein);
      _totalCarbController = TextEditingController(text: carb);
      _totalFatController = TextEditingController(text: fat);
    }
  }


  Widget recipe(){
    return Visibility(
      visible: _foodType == MEAL_LABEL,
      child: Container(
          margin: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('$RECIPE_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),
              const SizedBox(height: 16,),
              SizedBox(
                height: RECIPE_HEIGHT,
                child: TextField(
                  controller: _recipeController,
                  maxLines: null,
                  expands: true,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
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
                  style: const TextStyle(color: DARK_PRIMARY_COLOR),
                ),
              ),
            ],
          )
      ),
    );
  }



  void calculateTotalMacros(){
    if(_foodType == MEAL_LABEL){
      double calorie = 0;
      for (int i = 0; i < newFood.calorie.length; i++) {
        double servingCount = double.parse(newFood.servingIngredientsCount[i].isEmpty ? '1' : newFood.servingIngredientsCount[i]);
        calorie = calorie + double.parse(newFood.calorie[i].isEmpty ? '0' : newFood.calorie[i])*servingCount;
      }

      double protein = 0;
      for (int i = 0; i < newFood.protein.length; i++) {
        double servingCount = double.parse(newFood.servingIngredientsCount[i].isEmpty ? '1' : newFood.servingIngredientsCount[i]);
        protein = protein + double.parse(newFood.protein[i].isEmpty ? '0' : newFood.protein[i])*servingCount;
      }

      double carb = 0;
      for (int i = 0; i < newFood.carb.length; i++) {
        double servingCount = double.parse(newFood.servingIngredientsCount[i].isEmpty ? '1' : newFood.servingIngredientsCount[i]);
        carb = carb + double.parse(newFood.carb[i].isEmpty ? '0' : newFood.carb[i])*servingCount;
      }


      double fat = 0;
      for (int i = 0; i < newFood.fat.length; i++) {
        double servingCount = double.parse(newFood.servingIngredientsCount[i].isEmpty ? '1' : newFood.servingIngredientsCount[i]);
        fat = fat + double.parse(newFood.fat[i].isEmpty ? '0' : newFood.fat[i])*servingCount;
      }


      _totalCalorieController = TextEditingController(text: '$calorie');
      _totalProteinController = TextEditingController(text: '$protein');
      _totalCarbController = TextEditingController(text: '$carb');
      _totalFatController = TextEditingController(text: '$fat');
    }
  }

  Widget addedIngredients(){
    return Visibility(
        visible: _foodType == MEAL_LABEL && newFood.ingredients.isNotEmpty,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16,),
            const Text('$INGREDIENTS_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),
            const SizedBox(height: 16,),
            MealIngredientsListUi(meal: newFood, ingredientsExpansionState: _ingredientsExpansionState,
              onExpansionStateChanged: updateIngredientsListUi, onIngredientUpdated: updateUiAfterIngredientUpdated,
              onServingCountChangeRequested: updateServingCountInUi, isEditable: true,
              ingredients: newFood.ingredients,
            )
          ],
        )
    );
  }



  void updateServingCountInUi(int index, double count){
    setState(() {
      List<String> servingIngredientsCount = List<String>.from(newFood.servingIngredientsCount);
      servingIngredientsCount[index]= count.toString();
      newFood = newFood.copyWith(
          servingIngredientsCount: servingIngredientsCount
      );
      calculateTotalMacros();
    });
  }

  void updateUiAfterIngredientUpdated(Food updatedFood){
    setState(() {
      _selectedAddIngredientOption = '';
      newFood = newFood.copyWith(
          ingredients: updatedFood.ingredients,
          servingIngredientsCount: updatedFood.servingIngredientsCount,
          fat: updatedFood.fat,
          carb: updatedFood.carb,
          protein: updatedFood.protein,
          calorie: updatedFood.calorie,
          servingAmounts: updatedFood.servingAmounts,
          units: updatedFood.units
      );
      calculateTotalMacros();
    });
  }


  void updateIngredientsListUi(int index, bool state, bool isRemove){
    setState(() {
      if(isRemove){
        _ingredientsExpansionState.removeAt(index);
      }else{
        if(state == true){
          for (int i = 0; i < _ingredientsExpansionState.length; i++) {
            _ingredientsExpansionState[i] = false;
          }
        }
        _ingredientsExpansionState[index] = state;
      }
    });
  }


  void requestOperationOnFood(BuildContext context){
    if(_foodType == GROCERY_LABEL){
      newFood = newFood.copyWith(
          foodType: FoodType.groceryProduct,
          name: _groceryNameController.text,
          servingAmounts: [_totalServingController.text.isEmpty ? '1.0' : _totalServingController.text],
          units: [_totalUnitController.text],
          calorie: [_totalCalorieController.text.isEmpty ? '0.0' : _totalCalorieController.text],
          protein: [_totalProteinController.text.isEmpty ? '0.0' : _totalProteinController.text],
          carb: [_totalCarbController.text.isEmpty ? '0.0' : _totalCarbController.text],
          fat: [_totalFatController.text.isEmpty ? '0.0' : _totalFatController.text]
      );
    }else{
      newFood = newFood.copyWith(
          foodType: FoodType.meal,
          name: _mealNameController.text,
          servingAmount: double.parse(_totalServingController.text.isEmpty ? '1.0' : _totalServingController.text),
          unit: _totalUnitController.text,
          recipe: _recipeController.text
      );

      if(newFood.ingredients.isEmpty){
        newFood= newFood.copyWith(
            calorie: [_totalCalorieController.text.isEmpty ? '0.0' : _totalCalorieController.text],
            protein: [_totalProteinController.text.isEmpty ? '0.0' : _totalProteinController.text],
            carb: [_totalCarbController.text.isEmpty ? '0.0' : _totalCarbController.text],
            fat: [_totalFatController.text.isEmpty ? '0.0' : _totalFatController.text]
        );
      }
    }

    if(widget.foodDetailArgumentModel.macroEdition){
      requestLoggedFoods();
      return;
    }
    showUpgradePopupForFreeUsers(context, UPGRADE_MSG_MACRO_EDITION);
  }

  Widget macroAmountsWidgets(TextEditingController servingController,TextEditingController calorieController,
      TextEditingController proteinController,TextEditingController carbController,TextEditingController fatController, TextEditingController unitController){

    bool isEditable= true;

    if(_foodType.toLowerCase() == FoodType.meal.name.toLowerCase() && (calorieController == _totalCalorieController)){
      isEditable = false;
    }

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
                controller: servingController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
              ),
            ),
            const SizedBox(width: 20,),
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$UNIT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: 70,
              height: MACRO_HEIGHT,
              child: TextField(
                style: const TextStyle(fontSize: 11, color: DARK_PRIMARY_COLOR),
                controller: unitController,
                enabled: false,
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

        /// total calorie + protein
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
                enabled: isEditable,
                controller: calorieController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
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
                enabled: isEditable,
                controller: proteinController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12,),

        /// total carb + fat
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
                enabled: isEditable,
                controller: carbController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
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
                enabled: isEditable,
                controller: fatController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
              ),
            ),
          ],
        ),
      ],
    );
  }


  Widget addIngredientOptionChipSelected(String option){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedAddIngredientOption= '';
          _searchedGroceriesVisible = false;
          resetMacroAmounts();
        });
      },
      child: Chip(
        backgroundColor: DARK_PRIMARY_COLOR,
        label: Text(option, style: const TextStyle(color: Colors.white),),
      ),
    );
  }

  Widget addIngredientChipNotSelected(String option){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedAddIngredientOption= option;
          _searchedGroceriesVisible = false;
          _searchUnitOptions = manualUnitOptions;
          resetMacroAmounts();
        });
      },
      child: Chip(
        label: Text(option),
      ),
    );
  }


  Widget addGroceryOptionChipSelected(String option){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedAddGroceryOption= '';
          _searchedGroceriesVisible = false;
          resetTotalMacroAmounts();
        });
      },
      child: Chip(
        backgroundColor: DARK_PRIMARY_COLOR,
        label: Text(option, style: const TextStyle(color: Colors.white),),
      ),
    );
  }

  Widget addGroceryChipNotSelected(String option){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedAddGroceryOption= option;
          _searchedGroceriesVisible = false;
          resetTotalMacroAmounts();
        });
      },
      child: Chip(
        label: Text(option),
      ),
    );
  }


  Widget mealNameWidget(){
    return Visibility(
      visible: _foodType == MEAL_LABEL,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('$NAME_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),
          const SizedBox(height: 8,),
          TextField(
            controller: _mealNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: _mealNameBorderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: _mealNameBorderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: _mealNameBorderColor, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            ),
            style: const TextStyle(color: DARK_PRIMARY_COLOR),
          ),
        ],
      ),
    );
  }


  Widget addIngredientChips(){
    /// add ingredients chips
    return Visibility(
        visible: _foodType == MEAL_LABEL,
        child: Column(
          children: [
            const SizedBox(height: 16,),
            Wrap(
              spacing: 4,
              children: _addNewIngredientOptions.map((item) {
                if(_selectedAddIngredientOption == item){
                  return addIngredientOptionChipSelected(item);
                }else{
                  return addIngredientChipNotSelected(item);
                }
              },).toList(),
            ),
          ],
        )
    );
  }


  Widget suggestedGroceriesBloc(){
    return  Visibility(
      visible: _searchedGroceriesVisible,
      child: Container(
          width: 300,
          height: 200,
          padding: const EdgeInsets.only(top: 4, right: 4),
          decoration: BoxDecoration(
            color: LIGHT_GREY_COLOR,
            borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
          ),
          margin: const EdgeInsets.only(top: 36),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
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
                      _searchedGroceriesVisible = false;
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
            ),
          )
      ),
    );
  }

  Widget suggestedGroceriesList(){
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _suggestedGroceries.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          GenericFood grocery = _suggestedGroceries[index];
          return GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text(grocery.name.capitalize(), style: const TextStyle(color: Colors.blueGrey, fontSize: 12),)
                ),
                const SizedBox(height: 8,),
              ],
            ),
            onTap: (){
              setState(() {
                _selectedGenericIngredient = grocery;
                _searchedGroceriesVisible = false;
                _searchUnitOptions = grocery.units[0];
                _selectedNewIngredientUnitIndex= 0;
                _ingredientNameController= TextEditingController(text: grocery.name.replaceAll(',', ''));
                _ingredientServingCountController= TextEditingController(text: '1.0');
                _servingController = TextEditingController(text: grocery.servingAmounts[0][_selectedNewIngredientUnitIndex].toString());
                _calorieController = TextEditingController(text: grocery.calorie[0][_selectedNewIngredientUnitIndex].toString());
                _proteinController = TextEditingController(text: grocery.protein[0][_selectedNewIngredientUnitIndex].toString());
                _carbController = TextEditingController(text: grocery.carb[0][_selectedNewIngredientUnitIndex].toString());
                _fatController = TextEditingController(text: grocery.fat[0][_selectedNewIngredientUnitIndex].toString());
                _ingredientNameController.addListener(_onSearchIngredientChanged);
              });
            },
          );
        }
    );
  }

  Widget groceryName(){
    return Visibility(
      visible: _selectedAddGroceryOption.isNotEmpty && _foodType == GROCERY_LABEL,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('$NAME_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),
          const SizedBox(height: 8,),
          TextField(
            controller: _groceryNameController,
            decoration:  InputDecoration(
              hintText: CHEDDAR_CHEESE_LABEL,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: _ingredientNameBorderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: _ingredientNameBorderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: _ingredientNameBorderColor, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            ),
            style: const TextStyle(color: DARK_PRIMARY_COLOR),
          ),
        ],
      ),
    );
  }
  Widget newIngredient(){
    return Visibility(
      visible: _selectedAddIngredientOption.isNotEmpty && _foodType == MEAL_LABEL,
      child: Card(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 4),
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
                      _selectedAddIngredientOption = '';
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
                              controller: _ingredientNameController,
                              decoration:  InputDecoration(
                                hintText: CHEDDAR_CHEESE_LABEL,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: _ingredientNameBorderColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: _ingredientNameBorderColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: _ingredientNameBorderColor, width: 2),
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              ),
                              style: const TextStyle(color: DARK_PRIMARY_COLOR),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12,),
                        Visibility(
                          visible: _selectedAddIngredientOption == ADD_INGREDIENT_BY_SEARCH,
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
                                GroceriesEvent.onGetGroceries(_ingredientNameController.text),
                              );
                              setState(() {
                                _searchedGroceriesVisible = true;
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


                macroAmountsIngredient(),


                const SizedBox(height: 16,),


                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(PRIMARY_COLOR),
                        ),
                        onPressed: () {
                          addIngredientClickListener();
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

  Widget macroAmountsIngredient(){
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
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
              ),
            ),
            const SizedBox(width: 20,),
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$UNIT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),

            ingredientUnitDropDown()

          ],
        ),
        const SizedBox(height: 4,),

        /// total calorie + protein
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
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12,),

        /// total carb + fat
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
              ),
            ),
          ],
        ),


        const SizedBox(height: 48,),

        /// how many serving?
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('$HOW_MANY_SERVINGS:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

            const SizedBox(width: 16,),
            GestureDetector(
              child: const CircleAvatar(
                radius: 14,
                backgroundColor: DARK_PRIMARY_COLOR,
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
              onTap: (){
                setState(() {
                  if(double.parse(_ingredientServingCountController.text) >= STEP_AMOUNT){
                    _ingredientServingCountController = TextEditingController(text: (double.parse(_ingredientServingCountController.text) - STEP_AMOUNT).toString());
                  }
                });
              },

            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: SizedBox(
                  width: 60,
                  height: MACRO_HEIGHT,
                  child: TextField(
                    controller: _ingredientServingCountController,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: PRIMARY_COLOR),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: PRIMARY_COLOR),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: PRIMARY_COLOR, width: 2),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    ),
                  ),
                )
            ),
            GestureDetector(
              child: const CircleAvatar(
                radius: 14,
                backgroundColor: DARK_PRIMARY_COLOR,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              onTap: (){
                setState(() {
                  _ingredientServingCountController = TextEditingController(text: (double.parse(_ingredientServingCountController.text) + STEP_AMOUNT).toString());
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget ingredientUnitDropDown(){
    final dropDownList = _selectedAddIngredientOption == ADD_INGREDIENT_BY_SEARCH ? _searchUnitOptions : manualUnitOptions;
    return  SizedBox(
      width: MACRO_DROP_DOWN_WIDTH,
      height: MACRO_DROP_DOWN_HEIGHT,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            isExpanded: true,
            value: dropDownList[_selectedNewIngredientUnitIndex],
            items: dropDownList.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: const TextStyle(fontSize: 12),),
              );
            }).toList(),
            onChanged: (String? newValue){
              setState(() {
                int selectedIndex = 0;
                for (int i = 0; i < dropDownList.length; i++){
                  if(newValue.toString() == dropDownList[i]){
                    selectedIndex = i;
                  }
                }
                _selectedNewIngredientUnitIndex = selectedIndex;
                _servingController = TextEditingController(text: _selectedGenericIngredient.servingAmounts[0][_selectedNewIngredientUnitIndex].toString());
                _calorieController = TextEditingController(text: _selectedGenericIngredient.calorie[0][_selectedNewIngredientUnitIndex].toString());
                _proteinController = TextEditingController(text: _selectedGenericIngredient.protein[0][_selectedNewIngredientUnitIndex].toString());
                _carbController = TextEditingController(text: _selectedGenericIngredient.carb[0][_selectedNewIngredientUnitIndex].toString());
                _fatController = TextEditingController(text: _selectedGenericIngredient.fat[0][_selectedNewIngredientUnitIndex].toString());
              });

            },
            // style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }


  void addIngredientClickListener(){

    if(_ingredientNameController.text.isEmpty){
      setState(() {
        _ingredientNameBorderColor = Colors.red;
      });
      return;
    }

    setState(() {

      if(newFood.foodType == FoodType.meal && newFood.ingredients.isEmpty && _ingredientNameController.text.isNotEmpty){
        newFood= newFood.copyWith(
            calorie: [],
            protein: [],
            carb: [],
            fat: []
        );
      }
      List<String> ingredients = List<String>.from(newFood.ingredients);
      ingredients.add(_ingredientNameController.text);
      List<String> servingIngredientsCount = List<String>.from(newFood.servingIngredientsCount);
      if(_ingredientServingCountController.text.isEmpty){
        _ingredientServingCountController = TextEditingController(text: '1.0');
      }
      servingIngredientsCount.add(_selectedGenericIngredient.servingIngredientsCount[0][_selectedNewIngredientUnitIndex]);
      List<String> ingredientsUnit = List<String>.from(newFood.units);
      ingredientsUnit.add(_selectedAddIngredientOption == ADD_INGREDIENT_BY_SEARCH ? _selectedGenericIngredient.units[0][_selectedNewIngredientUnitIndex] : manualUnitOptions[_selectedNewIngredientUnitIndex]);
      List<String> ingredientsServingAmount = List<String>.from(newFood.servingAmounts);
      ingredientsServingAmount.add(_selectedGenericIngredient.servingAmounts[0][_selectedNewIngredientUnitIndex]);
      List<String> ingredientsCalorie = List<String>.from(newFood.calorie);
      ingredientsCalorie.add(_selectedGenericIngredient.calorie[0][_selectedNewIngredientUnitIndex]);
      List<String> ingredientsProtein = List<String>.from(newFood.protein);
      ingredientsProtein.add(_selectedGenericIngredient.protein[0][_selectedNewIngredientUnitIndex]);
      List<String> ingredientsCarb = List<String>.from(newFood.carb);
      ingredientsCarb.add(_selectedGenericIngredient.carb[0][_selectedNewIngredientUnitIndex]);
      List<String> ingredientsFat = List<String>.from(newFood.fat);
      ingredientsFat.add(_selectedGenericIngredient.fat[0][_selectedNewIngredientUnitIndex]);

      newFood = newFood.copyWith(
          ingredients: ingredients,
          servingIngredientsCount: servingIngredientsCount,
          servingAmounts: ingredientsServingAmount,
          units: ingredientsUnit,
          calorie: ingredientsCalorie,
          protein: ingredientsProtein,
          carb: ingredientsCarb,
          fat: ingredientsFat
      );
      _selectedAddIngredientOption = '';
      _ingredientNameBorderColor = Colors.black;
      _ingredientsExpansionState.add(false);
      calculateTotalMacros();
    });
  }


  void resetMacroAmounts(){
    _ingredientNameController.text = '';
    _ingredientServingCountController.text = '1.0';
    _calorieController.text = '0';
    _proteinController.text = '0';
    _carbController.text = '0';
    _fatController.text = '0';
    _servingController.text = '100';
    _unitController.text= GRAM_LABEL;
    _selectedNewIngredientUnitIndex= 0;
  }


  void resetTotalMacroAmounts(){
    _groceryNameController.text = '';
    _totalCalorieController.text = '0';
    _totalProteinController.text = '0';
    _totalCarbController.text = '0';
    _totalFatController.text = '0';
    _selectedNewIngredientUnitIndex= 0;
    if(_foodType == MEAL_LABEL){
      _totalServingController.text = '1';
      _totalUnitController.text= SERVING_LABEL;
    }else{
      _totalServingController.text = '100';
      _totalUnitController.text= GRAM_LABEL;
    }
  }


  void updateSelectedFoodType(String type){
    setState(() {
      _foodType = type;
      resetTotalMacroAmounts();
      resetMacroAmounts();
    });
  }


}
