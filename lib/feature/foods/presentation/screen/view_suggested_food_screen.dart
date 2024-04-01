import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/presentation/screen/edit_suggested_food_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/debouncer.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/food_detail_argument_model.dart';
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
import '../bloc/add_or_update_my_favorite_bloc/add_or_update_my_favorite_bloc.dart';
import '../bloc/add_or_update_my_favorite_bloc/state_event/add_or_update_my_favorite_state_event.dart';
import '../bloc/get_logged_foods_bloc/get_logged_foods_bloc.dart';
import '../bloc/get_logged_foods_bloc/state_event/get_logged_foods_state_event.dart';
import '../bloc/log_foods_bloc/log_foods_bloc.dart';
import '../bloc/log_foods_bloc/state_event/log_foods_state_event.dart';



class ViewSuggestedFoodScreen extends StatefulWidget {

  final FoodDetailArgumentModel foodDetailArgumentModel;

  const ViewSuggestedFoodScreen({super.key, required this.foodDetailArgumentModel});

  @override
  State<ViewSuggestedFoodScreen> createState() => _ViewSuggestedFoodScreenState();
}

class _ViewSuggestedFoodScreenState extends State<ViewSuggestedFoodScreen> {

  /// for whole meal OR grocery,
   /// groceries: the first(the only item in the list) element is the value
   late TextEditingController _totalCalorieController;
   late TextEditingController _totalProteinController;
   late TextEditingController _totalCarbController;
   late TextEditingController _totalFatController;
   late TextEditingController _totalServingController;
   late TextEditingController _totalUnitController;


   final _debouncer = Debouncer(milliseconds: 1000);


   ///only meal
   /// only for ingredient of the meal
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

   late TextEditingController _mealNameController;
   late TextEditingController _ingredientServingCountController;
   late TextEditingController _recipeController;
   Color _mealNameBorderColor = DARK_PRIMARY_COLOR;


  String _foodType = GROCERY_LABEL;
  Food newFood = Food();
  late AddOrUpdateMyFavoriteBloc _addOrUpdateMyFavoriteBloc;
   late GetLoggedFoodsBloc _getLoggedFoodsBloc;
   late LogFoodsBloc _logFoodsBloc;


  @override
  void initState() {
    super.initState();
    _addOrUpdateMyFavoriteBloc = context.read<AddOrUpdateMyFavoriteBloc>();
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();
    _logFoodsBloc = context.read<LogFoodsBloc>();
    _addOrUpdateMyFavoriteBloc.add(
      const AddOrUpdateMyFavoriteEvent.onReset(),
    );
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

    init();
  }


   void requestLoggedFoods(){
     String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
     _getLoggedFoodsBloc.add(
         GetLoggedFoodsEvent.onGetImmediateLoggedFoods(formattedDate)
     );
   }



   void logFoodsOfToday(List<Food> foodsLoggedBefore){
     List<Food> foods = [];
     foods.addAll(foodsLoggedBefore);
     foods.add(newFood);
     _logFoodsBloc.add(
         LogFoodsEvent.onLogFoods(foods)
     );
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

@override
  Widget build(BuildContext context) {
    handleMealMacrosWithoutIngredient();
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(FOOD_DETAIL_LABEL, style: TextStyle(color: Colors.white),),
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
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.white,),
              onPressed: () {
                FoodDetailArgumentModel argumentModel = FoodDetailArgumentModel(food: newFood,
                    macroEdition: widget.foodDetailArgumentModel.macroEdition);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditSuggestedFoodScreen(foodDetailArgumentModel: argumentModel,),
                  ),
                );
              },
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Visibility(
                      visible: _foodType == MEAL_LABEL,
                      child: const SizedBox(height: 12,)
                  ),

                  /// meal name
                  mealNameWidget(),

                  Visibility(
                      visible: _foodType == MEAL_LABEL,
                      child: const SizedBox(height: 24,)
                  ),

                  Visibility(
                      visible: _foodType == GROCERY_LABEL,
                      child: const SizedBox(height: 12,)
                  ),


                  Visibility(
                      visible: _foodType == GROCERY_LABEL,
                      child: const SizedBox(height: 12,)
                  ),
                  /// new grocery
                  newGrocery(),

                  /// added ingredients
                  addedIngredients(),

                  recipe(),

                  const SizedBox(height: 16,),

                  const Text('$TOTAL_MACRO_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

                  const SizedBox(height: 16,),

                  /// total macros
                  macroAmountsWidgets(_totalServingController, _totalCalorieController, _totalProteinController, _totalCarbController, _totalFatController, _totalUnitController, true),

                  const SizedBox(height: 36,),

                  /// button
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


  void init(){
      if(widget.foodDetailArgumentModel.food?.foodType == FoodType.groceryProduct){
        _foodType = GROCERY_LABEL;
        _groceryNameController.text = widget.foodDetailArgumentModel.food!.name;
        _totalServingController.text = widget.foodDetailArgumentModel.food!.servingAmounts[0].toString();
        _totalCalorieController.text = double.parse(widget.foodDetailArgumentModel.food!.calorie[0]).toStringAsFixed(2);
        _totalProteinController.text = double.parse(widget.foodDetailArgumentModel.food!.protein[0]).toStringAsFixed(2);
        _totalCarbController.text = double.parse(widget.foodDetailArgumentModel.food!.carb[0]).toStringAsFixed(2);
        _totalFatController.text = double.parse(widget.foodDetailArgumentModel.food!.fat[0]).toStringAsFixed(2);
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
        _totalCalorieController.text = calorie.toStringAsFixed(2);
        _totalProteinController.text = protein.toStringAsFixed(2);
        _totalCarbController.text = carb.toStringAsFixed(2);
        _totalFatController.text = fat.toStringAsFixed(2);
        _totalUnitController.text = widget.foodDetailArgumentModel.food!.unit;
        _recipeController.text = widget.foodDetailArgumentModel.food!.recipe;
        widget.foodDetailArgumentModel.food!.ingredients.forEach((element) {
          _ingredientsExpansionState.add(false);
        });
      }

      newFood = widget.foodDetailArgumentModel.food!;
  }


  Widget recipe(){
    return Visibility(
        visible: _foodType == MEAL_LABEL,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16,),
            const Text('$RECIPE_LABEL:', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 16),),
            Text(newFood.recipe, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 15),),
          ],
        )
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


       _totalCalorieController = TextEditingController(text: '${calorie.toInt()}');
       _totalProteinController = TextEditingController(text: '${protein.toInt()}');
       _totalCarbController = TextEditingController(text: '${carb.toInt()}');
       _totalFatController = TextEditingController(text: '${fat.toInt()}');
     }
  }

  Widget addedIngredients(){
    String ingredients = '';
    for (int i = 0; i < newFood.ingredients.length; i++){
      ingredients = '$ingredients\n- ${newFood.ingredients[i].capitalize()}, ${newFood.servingAmounts[i]} ${newFood.units[i]}';
    }

      return Visibility(
        visible: _foodType == MEAL_LABEL && newFood.ingredients.isNotEmpty,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16,),
            const Text('$INGREDIENTS_LABEL:', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 16),),
            Text(ingredients, style: const TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal, fontSize: 15),),
          ],
        )
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
               child: const Text(ADD_TO_MY_FAVORTITE,
                 style: TextStyle( color: Colors.white),)
           ),
         ),
         BlocConsumer<AddOrUpdateMyFavoriteBloc, AddOrUpdateMyFavoriteState>(
             builder: (mcontext, state) {
               if (state is AddOrUpdateMyFavoriteLoadingState) {
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
               }else if(state is AddOrUpdateMyFavoriteLoadedState){
                 Future.delayed(Duration.zero,(){
                   _addOrUpdateMyFavoriteBloc.add(const AddOrUpdateMyFavoriteEvent.onReset());
                   showSuccessToast(context, FOOD_ADDED_TO_FAVORITE_MSG);
                 });
               }else if(state is AddOrUpdateMyFavoriteErrorState){
                 _addOrUpdateMyFavoriteBloc.add(const AddOrUpdateMyFavoriteEvent.onReset());
                 Future.delayed(Duration.zero,(){
                   if(state.message == ERROR_FREE_USER_FAVORITE_FOOD_NOT_ALLOWED){
                     return showUpgradePopupForFreeUsers(context, UPGRADE_MSG_FAVORITE_FOOD);
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
     );
  }


  void bottomButtonClickListener(BuildContext context){
     if(_foodType == MEAL_LABEL){
       if(_mealNameController.text.isEmpty){
         setState(() {
           _mealNameBorderColor = Colors.red;
         });
         return;
       }

       newFood.ingredients.forEach((element) {
         if(element.isEmpty){
           showErrorToast(context, ERROR_ENTER_FOOD_NAME);
         }
       });

       setState(() {
         _mealNameBorderColor = Colors.black;
       });
       requestOperationOnFood(context);
     }else{
       if(_groceryNameController.text.isEmpty){
         setState(() {
           _ingredientNameBorderColor = Colors.red;
         });
         return;
       }
       setState(() {
         _ingredientNameBorderColor = Colors.black;
       });
       requestOperationOnFood(context);
     }
  }


  void requestOperationOnFood(BuildContext context){
    if(_foodType == GROCERY_LABEL){
      newFood = newFood.copyWith(
        foodType: FoodType.groceryProduct,
        name: _groceryNameController.text,
        servingAmounts: [_totalServingController.text],
        units: [_totalUnitController.text],
        calorie: [_totalCalorieController.text],
        protein: [_totalProteinController.text],
        carb: [_totalCarbController.text],
        fat: [_totalFatController.text]
      );
    }else{
      newFood = newFood.copyWith(
        foodType: FoodType.meal,
        name: _mealNameController.text,
        servingAmount: double.parse(_totalServingController.text),
        unit: _totalUnitController.text,
        recipe: _recipeController.text
      );

      if(newFood.ingredients.isEmpty){
        newFood= newFood.copyWith(
            calorie: [_totalCalorieController.text],
            protein: [_totalProteinController.text],
            carb: [_totalCarbController.text],
            fat: [_totalFatController.text]
        );
      }
    }

    _addOrUpdateMyFavoriteBloc.add(
      AddOrUpdateMyFavoriteEvent.onAddToMyFavorite(
          newFood
      ),
    );
  }

  Widget macroAmountsWidgets(TextEditingController servingController,TextEditingController calorieController,
      TextEditingController proteinController,TextEditingController carbController,TextEditingController fatController, TextEditingController unitController, bool isTotal){

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
                enabled: false,
                controller: servingController,
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
                child: Text('$UNIT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: 70,
              height: MACRO_HEIGHT,
              child: TextField(
                enabled: false,
                style: const TextStyle(fontSize: 11, color: DARK_PRIMARY_COLOR),
                controller: unitController,
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
                enabled: false,
                controller: calorieController,
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
                child: Text('$PROTEIN_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                enabled: false,
                controller: proteinController,
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
                enabled: false,
                controller: carbController,
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
                enabled: false,
                controller: fatController,
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


        Visibility(visible: !isTotal,child: const SizedBox(height: 48,),),

        /// how many serving?
        Visibility(
          visible: !isTotal,
          child: Row(
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
                      enabled: false,
                      controller: _ingredientServingCountController,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                        FilteringTextInputFormatter.allow(numericRegExp),
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
        ),
      ],
    );
  }


   Widget mealNameWidget(){
     return Visibility(
       visible: _foodType == MEAL_LABEL,
       child: Row(
           children: [
             const Text('$NAME_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),),
             const SizedBox(width: 4,),
             Expanded(
               child: SizedBox(
                 height: SEARCH_BAR_HEIGHT,
                 child: TextField(
                   enabled: false,
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
         ),
     );
   }


  Widget newGrocery(){
     return TextField(
       enabled: false,
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
       ingredientsUnit.add(_unitController.text);
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
           fat: ingredientsFat
       );
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
   }


  void resetTotalMacroAmounts(){
    _groceryNameController.text = '';
    _totalCalorieController.text = '0';
    _totalProteinController.text = '0';
    _totalCarbController.text = '0';
    _totalFatController.text = '0';
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
