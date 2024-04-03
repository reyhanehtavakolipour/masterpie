import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/suggested_different_foods_combination_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/custom_radio_button.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/debouncer.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/foods_macro_list_ui.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/meal_ingredients_list_ui.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/request_wizard_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/unit_options.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../data/repository_impl/foods_repository_impl.dart';
import '../../domain/model/food_model.dart';
import '../../domain/model/food_type.dart';
import '../bloc/groceries_bloc/groceries_bloc.dart';
import '../bloc/groceries_bloc/state_event/groceries_state_event.dart';
import '../bloc/my_cook_book_foods_bloc/my_cook_book_foods_bloc.dart';
import '../bloc/my_cook_book_foods_bloc/state_event/my_cook_book_foods_state_event.dart';
import '../bloc/my_favorite_foods/my_favorite_foods_bloc.dart';
import '../bloc/my_favorite_foods/state_event/my_favorite_foods_state_event.dart';
import '../bloc/suggest_portion_bloc/state_event/suggest_portion_state_event.dart';
import '../bloc/suggest_portion_bloc/suggest_portion_bloc.dart';



class ManualFoodMacroWizardScreen extends StatefulWidget {

  final RequestWizardArgumentModel requestWizardArgumentModel;

  const ManualFoodMacroWizardScreen({super.key, required this.requestWizardArgumentModel});

  @override
  State<ManualFoodMacroWizardScreen> createState() => _ManualFoodMacroWizardScreenState();
}

class _ManualFoodMacroWizardScreenState extends State<ManualFoodMacroWizardScreen> {


  late TextEditingController _totalCalorieController;
  late TextEditingController _totalProteinController;
  late TextEditingController _totalCarbController;
  late TextEditingController _totalFatController;
  late TextEditingController _totalServingController;


  final _debouncer = Debouncer(milliseconds: 1000);

  late TextEditingController _calorieController;
  late TextEditingController _proteinController;
  late TextEditingController _carbController;
  late TextEditingController _fatController;
  late TextEditingController _servingController;
  late TextEditingController _ingredientNameController;
  late TextEditingController _groceryNameController;
  int _selectedUnitIndex = 0;
  List<String> _searchUnitOptions = manualUnitOptions;


  late TextEditingController _minServingController;
  late TextEditingController _maxServingController;

  final List<bool> _ingredientsExpansionState = [];
  Color _ingredientNameBorderColor = DARK_PRIMARY_COLOR;

  late TextEditingController _mealNameController;
  List<String> _addNewIngredientOptions= [];
  String _selectedAddIngredientOption = ADD_INGREDIENT_BY_SEARCH;
  late TextEditingController _ingredientServingCountController;
  late TextEditingController _recipeController;
  Color _mealNameBorderColor = DARK_PRIMARY_COLOR;

  GenericFood _selectedGenericIngredient = GenericFood();

  String _selectedAddGroceryOption = ADD_GROCERY_BY_SEARCH_LABEL;
  bool _searchedGroceriesVisible = false;


  late GroceriesBloc _groceriesBloc;
  Food newFood = Food();
  double _previousCoefficient= 1.0;
  Food _initialStateFood = Food();



  List<GenericFood> _suggestedGroceries= [];


  @override
  void initState() {
    super.initState();
    _mealNameController= TextEditingController();
    _totalCalorieController= TextEditingController(text: '0');
    _totalProteinController= TextEditingController(text: '0');
    _totalCarbController= TextEditingController(text: '0');
    _totalFatController= TextEditingController(text: '0');
    _totalServingController= TextEditingController(text: '1.0');
    _calorieController= TextEditingController(text: '0');
    _proteinController= TextEditingController(text: '0');
    _carbController= TextEditingController(text: '0');
    _fatController= TextEditingController(text: '0');
    _servingController= TextEditingController(text: '0');
    _ingredientServingCountController= TextEditingController(text: '1.0');
    _ingredientNameController= TextEditingController();
    _groceryNameController= TextEditingController();
    _recipeController= TextEditingController();
    _minServingController= TextEditingController(text: '0.5');
    _maxServingController= TextEditingController(text: '5.0');
    _addNewIngredientOptions = [ADD_INGREDIENT_BY_SEARCH, ADD_INGREDIENT_MANUALLY];

    _ingredientNameController.addListener(_onSearchIngredientChanged);
    _groceryNameController.addListener(_onSearchGroceryChanged);

    _groceriesBloc = context.read<GroceriesBloc>();

    _totalServingController.addListener(_onTotalServingChanged);

  }


  void _onTotalServingChanged() {
    setState(() {
    });
    _debouncer.run(() {
      setState(() {
        if(num.parse(_totalServingController.text.isEmpty ? '0' : _totalServingController.text) > 0){
          double coefficient = num.parse(_totalServingController.text)/_initialStateFood.servingAmount;
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
    });
  }


  void _onSearchGroceryChanged() {
    setState(() {

    });
    _debouncer.run(() {
      _suggestedGroceries.clear();
      if(_groceryNameController.text.isNotEmpty && _selectedAddGroceryOption == ADD_GROCERY_BY_SEARCH_LABEL){
        _groceriesBloc.add(
          GroceriesEvent.onGetGroceries(_groceryNameController.text),
        );
        setState(() {
          _searchedGroceriesVisible = true;
        });
      }
    });
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
      _totalCalorieController = TextEditingController(text: '0.0');
      _totalProteinController = TextEditingController(text: '0.0');
      _totalCarbController = TextEditingController(text: '0.0');
      _totalFatController = TextEditingController(text: '0.0');
    }
  }

  @override
  Widget build(BuildContext context) {
    handleMealMacrosWithoutIngredient();
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(ADD_NEW_LABEL, style: TextStyle(color: Colors.white),),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  mealNameWidget(),

                  const SizedBox(height: 16,),

                  /// add ingredient chips
                  addIngredientChips(),

                  const SizedBox(height: 8,),

                  /// new ingredient
                  newIngredient(),

                  /// added ingredients
                  addedIngredients(),

                  recipe(),

                  const SizedBox(height: 16,),

                  const Text('$TOTAL_MACRO_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

                  const SizedBox(height: 16,),


                  macroAmountsMeal(),

                  const SizedBox(height: 36,),

                  foodServingRange(),

                  const SizedBox(height: 36,),


                  /// button
                  addFoodButton(context),
                ],
              ),
            )
        ),
      ),
    );
  }


  Widget recipe(){
    return Container(
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
    );
  }



  void calculateTotalMacros(){
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

  Widget addedIngredients(){
    return Visibility(
        visible: newFood.ingredients.isNotEmpty,
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
      _initialStateFood= newFood;
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


  Widget addFoodButton(BuildContext context){
    return  Column(
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
                addFoodClickListener(context);
              },
              child: const Text(ADD_TO_MY_COOK_BOOK,
                style: TextStyle( color: Colors.white),)
          ),
        ),
      ],
    );
  }


  void addFoodClickListener(BuildContext context){
    if(_mealNameController.text.isEmpty){
      setState(() {
        _mealNameBorderColor = Colors.red;
        showErrorToast(context, ERROR_MEAL_NAME_EMPTY);
      });
      return;
    }

    if( num.parse(_totalServingController.text.isEmpty ? '0' : _totalServingController.text) <= 0){
      setState(() {
        showErrorToast(context, ERROR_MEAL_SERVING_AMOUNT);
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


    if(newFood.ingredients.isEmpty){
      showErrorToast(context, ERROR_ADD_INGREDIENT);
      return;
    }

    if(_minServingController.text.isEmpty || _maxServingController.text.isEmpty){
      showErrorToast(context, ERROR_FOOD_SERVING_RANGE_EMPTY);
      return;
    }

    setState(() {
      _mealNameBorderColor = Colors.black;
    });


    List<Food> foods= [];
    foods.addAll(widget.requestWizardArgumentModel.foods);


    newFood = newFood.copyWith(
        foodType: FoodType.meal,
        name: _mealNameController.text,
        servingAmount: double.parse(_totalServingController.text.isEmpty ? '1.0' : _totalServingController.text),
        unit: SERVING_LABEL,
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

    foods.add(newFood);

    List<RangeValues> rangeValues= [];
    rangeValues.addAll(widget.requestWizardArgumentModel.servingRanges);
    rangeValues.add(RangeValues(double.parse(_minServingController.text), double.parse(_maxServingController.text)));

    RequestWizardArgumentModel model= RequestWizardArgumentModel(
      restriction: widget.requestWizardArgumentModel.restriction,
      macroGoalRanges: widget.requestWizardArgumentModel.macroGoalRanges,
      servingRanges: rangeValues,
      foods: foods,
    );
    Navigator.pop(context, model);

  }


  Widget foodServingRange(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('$SERVINGS_RANGE:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

        const SizedBox(height: 16,),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ///min
            const Text(MIN_LABEL, style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: SizedBox(
                  width: 60,
                  height: MACRO_HEIGHT,
                  child: TextField(
                    controller: _minServingController,
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


            const SizedBox(width: 8,),

            ///max
            const Text(MAX_LABEL, style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: SizedBox(
                  width: 60,
                  height: MACRO_HEIGHT,
                  child: TextField(
                    controller: _maxServingController,
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

          ],
        )
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
            value: dropDownList[_selectedUnitIndex],
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
                _selectedUnitIndex = selectedIndex;
                _servingController = TextEditingController(text: _selectedGenericIngredient.servingAmounts[0][_selectedUnitIndex].toString());
                _calorieController = TextEditingController(text: _selectedGenericIngredient.calorie[0][_selectedUnitIndex].toString());
                _proteinController = TextEditingController(text: _selectedGenericIngredient.protein[0][_selectedUnitIndex].toString());
                _carbController = TextEditingController(text: _selectedGenericIngredient.carb[0][_selectedUnitIndex].toString());
                _fatController = TextEditingController(text: _selectedGenericIngredient.fat[0][_selectedUnitIndex].toString());
                _totalServingController.addListener(_onTotalServingChanged);
              });

            },
            // style: Theme.of(context).textTheme.title,
          ),
        ),
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
                controller: _carbController,
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
                controller: _fatController,
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

  Widget macroAmountsMeal(){
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
                controller: _totalServingController,
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
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: TextEditingController(text: SERVING_LABEL),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 13),
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
                enabled: false,
                controller: _totalCalorieController,
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
                enabled: false,
                controller: _totalProteinController,
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
                enabled: false,
                controller: _totalCarbController,
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
                enabled: false,
                controller: _totalFatController,
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
          _searchUnitOptions = manualUnitOptions;
          _searchedGroceriesVisible = false;

          resetMacroAmounts();
        });
      },
      child: Chip(
        label: Text(option),
      ),
    );
  }

  Widget mealNameWidget(){
    return  Row(
      children: [
        const Text('$NAME_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),),
        const SizedBox(width: 4,),
        Expanded(
          child: SizedBox(
            height: SEARCH_BAR_HEIGHT,
            child: TextField(
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
          ),
        ),
      ],
    );
  }


  Widget addIngredientChips(){
    /// add ingredients chips
    return Wrap(
      spacing: 4,
      children: _addNewIngredientOptions.map((item) {
        if(_selectedAddIngredientOption == item){
          return addIngredientOptionChipSelected(item);
        }else{
          return addIngredientChipNotSelected(item);
        }
      },).toList(),
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
                _selectedUnitIndex= 0;
                _ingredientNameController= TextEditingController(text: grocery.name.replaceAll(',', ''));
                _ingredientServingCountController= TextEditingController(text: '1.0');
                _servingController = TextEditingController(text: grocery.servingAmounts[0][_selectedUnitIndex].toString());
                _calorieController = TextEditingController(text: grocery.calorie[0][_selectedUnitIndex].toString());
                _proteinController = TextEditingController(text: grocery.protein[0][_selectedUnitIndex].toString());
                _carbController = TextEditingController(text: grocery.carb[0][_selectedUnitIndex].toString());
                _fatController = TextEditingController(text: grocery.fat[0][_selectedUnitIndex].toString());
                _ingredientNameController.addListener(_onSearchIngredientChanged);
              });
            },
          );
        }
    );
  }


  Widget newIngredient(){
    return Visibility(
      visible: _selectedAddIngredientOption.isNotEmpty,
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
      servingIngredientsCount.add(_ingredientServingCountController.text);
      List<String> ingredientsUnit = List<String>.from(newFood.units);
      ingredientsUnit.add(_selectedAddIngredientOption == ADD_INGREDIENT_BY_SEARCH ? _selectedGenericIngredient.units[0][_selectedUnitIndex] : manualUnitOptions[_selectedUnitIndex]);
      List<String> ingredientsServingAmount = List<String>.from(newFood.servingAmounts);
      ingredientsServingAmount.add(_servingController.text);
      List<String> ingredientsCalorie = List<String>.from(newFood.calorie);
      ingredientsCalorie.add(_calorieController.text);
      List<String> ingredientsProtein = List<String>.from(newFood.protein);
      ingredientsProtein.add(_proteinController.text);
      List<String> ingredientsCarb = List<String>.from(newFood.carb);
      ingredientsCarb.add(_carbController.text);
      List<String> ingredientsFat = List<String>.from(newFood.fat);
      ingredientsFat.add(_fatController.text);

      newFood = newFood.copyWith(
        ingredients: ingredients,
        servingIngredientsCount: servingIngredientsCount,
        servingAmounts: ingredientsServingAmount,
        units: ingredientsUnit,
        calorie: ingredientsCalorie,
        protein: ingredientsProtein,
        carb: ingredientsCarb,
        fat: ingredientsFat,
      );

      newFood= newFood.copyWith(
        servingAmount: 1.0,
        foodType: FoodType.meal,
      );


      _initialStateFood= newFood;
      _selectedAddIngredientOption = '';
      _ingredientNameBorderColor = Colors.black;
      _selectedUnitIndex= 0;
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
    _selectedUnitIndex= 0;
  }


  void resetTotalMacroAmounts(){
    _groceryNameController.text = '';
    _totalCalorieController.text = '0';
    _totalProteinController.text = '0';
    _totalCarbController.text = '0';
    _totalFatController.text = '0';
    _selectedUnitIndex= 0;
    _totalServingController.text = '1.0';
  }


}
