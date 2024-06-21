import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/my_cook_book_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/debouncer.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/meal_ingredients_list_ui.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/food_detail_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/generic_food_detail_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model_converter.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/recipe_ingredients_list_ui.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/unit_options.dart';
import 'package:masterpie/main_screen.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../data/remote/datasource/fat_secret_food_remote_datasource_impl.dart';
import '../../data/repository_impl/foods_repository_impl.dart';
import '../../domain/model/food_model.dart';
import '../../domain/model/food_type.dart';
import '../bloc/add_or_update_my_cook_book_bloc/add_or_update_my_cook_book_bloc.dart';
import '../bloc/add_or_update_my_cook_book_bloc/state_event/add_or_update_my_cook_book_state_event.dart';
import '../bloc/get_logged_foods_bloc/get_logged_foods_bloc.dart';
import '../bloc/get_logged_foods_bloc/state_event/get_logged_foods_state_event.dart';
import '../bloc/groceries_bloc/groceries_bloc.dart';
import '../bloc/groceries_bloc/state_event/groceries_state_event.dart';
import '../bloc/log_foods_bloc/log_foods_bloc.dart';
import '../bloc/log_foods_bloc/state_event/log_foods_state_event.dart';



class EditRecipeScreen extends StatefulWidget {

  final GenericFoodDetailArgumentModel foodDetailArgumentModel;

  const EditRecipeScreen({super.key, required this.foodDetailArgumentModel});

  @override
  State<EditRecipeScreen> createState() => _EditRecipeScreenState();
}

class _EditRecipeScreenState extends State<EditRecipeScreen> {

   late TextEditingController _totalCalorieController;
   late TextEditingController _totalProteinController;
   late TextEditingController _totalCarbController;
   late TextEditingController _totalFatController;
   late TextEditingController _totalServingController;
   late TextEditingController _totalUnitController;

   GenericFood _selectedGenericIngredient = GenericFood();
   int _selectedUnitIndex = 0;
   List<String> _searchUnitOptions = [];

   final _debouncer = Debouncer(milliseconds: 1000);

   GenericFood _initialStateFood = GenericFood();

   late TextEditingController _calorieController;
   late TextEditingController _proteinController;
   late TextEditingController _carbController;
   late TextEditingController _fatController;
   late TextEditingController _ingredientNameController;
   late TextEditingController _groceryNameController;
   late TextEditingController _unitController;
   final List<bool> _ingredientsExpansionState = [];
   Color _ingredientNameBorderColor = DARK_PRIMARY_COLOR;
   late TextEditingController _foodCountController;

   late TextEditingController _mealNameController;
   List<String> _addNewIngredientOptions= [];
   String _selectedAddIngredientOption = '';
   late TextEditingController _ingredientServingCountController;
   late TextEditingController _recipeController;
   Color _mealNameBorderColor = DARK_PRIMARY_COLOR;

   double _previousCoefficient= 1.0;

   bool _searchedGroceriesVisible = false;
   late GetLoggedFoodsBloc _getLoggedFoodsBloc;
   late LogFoodsBloc _logFoodsBloc;

   List<int> _selectedIngredientsUnitIndexList= [];
   List<String> _selectedIngredientsUnit= [];


   late GroceriesBloc _groceriesBloc;
  GenericFood newFood = GenericFood();
  late AddOrUpdateMyCookBookBloc _addOrUpdateMyCookBookBloc;


   List<GenericFood> _suggestedGroceries= [];


  @override
  void initState() {
    super.initState();
    _addOrUpdateMyCookBookBloc = context.read<AddOrUpdateMyCookBookBloc>();
    _addOrUpdateMyCookBookBloc.add(
      const AddOrUpdateMyCookBookEvent.onReset(),
    );
    _mealNameController= TextEditingController();
    _totalCalorieController= TextEditingController(text: '0');
    _totalProteinController= TextEditingController(text: '0');
    _totalCarbController= TextEditingController(text: '0');
    _totalFatController= TextEditingController(text: '0');
    _totalServingController= TextEditingController(text: '1.0');
    _totalUnitController= TextEditingController(text: 'g');
    _calorieController= TextEditingController(text: '0');
    _proteinController= TextEditingController(text: '0');
    _carbController= TextEditingController(text: '0');
    _fatController= TextEditingController(text: '0');
    _foodCountController= TextEditingController(text: '1.0');
    _ingredientServingCountController= TextEditingController(text: '1.0');
    _unitController= TextEditingController(text: 'g');
    _ingredientNameController= TextEditingController();
    _groceryNameController= TextEditingController();
    _recipeController= TextEditingController();
    _addNewIngredientOptions = [ADD_INGREDIENT_BY_SEARCH, ADD_INGREDIENT_MANUALLY];
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();
    _logFoodsBloc = context.read<LogFoodsBloc>();
    _ingredientNameController.addListener(_onSearchIngredientChanged);

    _groceriesBloc = context.read<GroceriesBloc>();

    init();

    _totalServingController.addListener(_onTotalServingChanged);
  }


   void _onTotalServingChanged() {
     setState(() {

     });
     _debouncer.run(() {
       setState(() {
         if(num.parse(_totalServingController.text.isEmpty ? '0' : _totalServingController.text) > 0){
           double coefficient = num.parse(_totalServingController.text)/_initialStateFood.servingAmount[0];
           List<List<String>> servingIngredientsCount = [];
           List<List<String>> currentServingIngredientsCount = List<List<String>>.from(newFood.servingIngredientsCount);
           currentServingIngredientsCount.forEach((element) {
             servingIngredientsCount.add([(double.parse(element[0])*_previousCoefficient*coefficient).toString()]);
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

   void logFoodsOfToday(List<Food> foodsLoggedBefore){
     List<Food> foods = [];

     foods.addAll(foodsLoggedBefore);

     newFood= newFood.copyWith(count: num.parse(_foodCountController.text).toDouble());

     foods.add(fromGenericRecipe(newFood, _selectedIngredientsUnitIndexList));

     _logFoodsBloc.add(
         LogFoodsEvent.onLogFoods(foods)
     );
   }

@override
  Widget build(BuildContext context) {
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
            child: Stack(
              children: [
                SingleChildScrollView(
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


                      /// add to cookbook button
                      buildAddToCookBookButton(context),

                      const SizedBox(height: 16,),


                      foodCount(),

                      const SizedBox(height: 16,),

                      ///log food button
                      buildLogFoodButton(context),

                    ],
                  ),
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
                        _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
                        Future.delayed(Duration.zero,(){
                          logFoodsOfToday(state.loggedFoods.foods);
                        });
                      }else if(state is GetLoggedFoodsErrorState){
                        FocusScope.of(context).unfocus();
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
                          showSuccessToast(context, LOGGED_SUCCESSFULLY);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ),
                                  (route) => false
                          );
                        });
                      }else if(state is LogFoodsErrorState){
                        FocusScope.of(context).unfocus();
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
            )
        ),
      ),
    );
  }

   void requestLoggedFoods(){
     String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
     _getLoggedFoodsBloc.add(
         GetLoggedFoodsEvent.onGetLoggedFoods(formattedDate)
     );
   }

   Widget buildLogFoodButton(BuildContext context){
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
                 if(UserRegistrationStatus.userAccountId.isNotEmpty){
                   if(_foodCountController.text.isEmpty){
                     showErrorToast(context, ERROR_FOOD_COUNT_EMPTY);
                   }else{
                     requestLoggedFoods();
                   }
                 }else{
                   showRegisterDialog(context);
                 }
               },
               child: const Text(LOG_FOOD_LABEL,
                 style: TextStyle( color: Colors.white),)
           ),
         ),
       ],
     );
   }

   Widget foodCount(){
     return  Row(
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
               if(double.parse(_foodCountController.text) >= STEP_AMOUNT){
                 _foodCountController = TextEditingController(text: (double.parse(_foodCountController.text) - STEP_AMOUNT).toString());
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
                 controller: _foodCountController,
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
               _foodCountController = TextEditingController(text: (double.parse(_foodCountController.text) + STEP_AMOUNT).toString());
             });
           },
         ),
       ],
     );
   }


   void init(){
      double calorie = 0;
      for (int i = 0; i < widget.foodDetailArgumentModel.food!.calorie.length; i++) {
        if(i < widget.foodDetailArgumentModel.food!.servingIngredientsCount.length){
          _selectedIngredientsUnitIndexList.add(0);
          _selectedIngredientsUnit.add(widget.foodDetailArgumentModel.food!.units[i][0]);
          double servingCount = double.parse(widget.foodDetailArgumentModel.food!.servingIngredientsCount[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.servingIngredientsCount[i][0]);
          calorie = calorie + double.parse(widget.foodDetailArgumentModel.food!.calorie[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.calorie[i][0])*servingCount;
        }
      }

      double protein = 0;
      for (int i = 0; i < widget.foodDetailArgumentModel.food!.protein.length; i++) {
        if(i < widget.foodDetailArgumentModel.food!.servingIngredientsCount.length){
          double servingCount = double.parse(widget.foodDetailArgumentModel.food!.servingIngredientsCount[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.servingIngredientsCount[i][0]);
          protein = protein + double.parse(widget.foodDetailArgumentModel.food!.protein[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.protein[i][0])*servingCount;
        }
      }

      double carb = 0;
      for (int i = 0; i < widget.foodDetailArgumentModel.food!.carb.length; i++) {
        if(i < widget.foodDetailArgumentModel.food!.servingIngredientsCount.length){
          double servingCount = double.parse(widget.foodDetailArgumentModel.food!.servingIngredientsCount[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.servingIngredientsCount[i][0]);
          carb = carb + double.parse(widget.foodDetailArgumentModel.food!.carb[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.carb[i][0])*servingCount;
        }
      }


      double fat = 0;
      for (int i = 0; i < widget.foodDetailArgumentModel.food!.fat.length; i++) {
        if(i < widget.foodDetailArgumentModel.food!.servingIngredientsCount.length){
          double servingCount = double.parse(widget.foodDetailArgumentModel.food!.servingIngredientsCount[i].isEmpty ? '0': widget.foodDetailArgumentModel.food!.servingIngredientsCount[i][0]);
          fat = fat + double.parse(widget.foodDetailArgumentModel.food!.fat[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.fat[i][0])*servingCount;
        }
      }
      _mealNameController.text = widget.foodDetailArgumentModel.food!.name;
      _totalServingController.text = widget.foodDetailArgumentModel.food!.servingAmount[0].toString();
      _totalCalorieController.text = calorie.toString();
      _totalProteinController.text = protein.toString();
      _totalCarbController.text = carb.toString();
      _totalFatController.text = fat.toString();
      _totalUnitController.text = widget.foodDetailArgumentModel.food!.unit[0];
      _recipeController.text = widget.foodDetailArgumentModel.food!.recipe;
      widget.foodDetailArgumentModel.food!.ingredients.forEach((element) {
        _ingredientsExpansionState.add(false);
      });

    newFood = widget.foodDetailArgumentModel.food!;
    _initialStateFood= newFood;
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
                textInputAction: TextInputAction.done,
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
      if (i < newFood.servingIngredientsCount.length) {
        double servingCount = double.parse(
            newFood.servingIngredientsCount[i][0].isEmpty ? '0' : newFood.servingIngredientsCount[i][0]);
        calorie = calorie + double.parse(newFood.calorie[i].isEmpty ? '0' : newFood.calorie[i][_selectedIngredientsUnitIndexList[i]]) * servingCount;
      }
    }

    double protein = 0;
    for (int i = 0; i < newFood.protein.length; i++) {
      if (i < newFood.servingIngredientsCount.length) {
        double servingCount = double.parse(newFood.servingIngredientsCount[i][0].isEmpty ? '0' : newFood.servingIngredientsCount[i][0]);
        protein = protein + double.parse(newFood.protein[i].isEmpty ? '0' : newFood.protein[i][_selectedIngredientsUnitIndexList[i]]) * servingCount;
      }
    }

    double carb = 0;
    for (int i = 0; i < newFood.carb.length; i++) {
      if (i < newFood.servingIngredientsCount.length) {
        double servingCount = double.parse(newFood.servingIngredientsCount[i][0].isEmpty ? '0' : newFood.servingIngredientsCount[i][0]);
        carb = carb + double.parse(newFood.carb[i].isEmpty ? '0' : newFood.carb[i][_selectedIngredientsUnitIndexList[i]]) * servingCount;
      }
    }


    double fat = 0;
    for (int i = 0; i <
        newFood.fat.length; i++) {
      if (i < newFood.servingIngredientsCount.length) {
        double servingCount = double.parse(newFood.servingIngredientsCount[i][0].isEmpty ? '0' : newFood.servingIngredientsCount[i][0]);
        fat = fat + double.parse(newFood.fat[i].isEmpty ? '0' : newFood.fat[i][_selectedIngredientsUnitIndexList[i]]) * servingCount;
      }
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
             RecipeIngredientsListUi(meal: newFood, ingredientsExpansionState: _ingredientsExpansionState, selectedIngredientsUnitIndexList: _selectedIngredientsUnitIndexList,
               onExpansionStateChanged: updateIngredientsListUi, onIngredientUpdated: updateUiAfterIngredientUpdated,
               onServingCountChangeRequested: updateServingCountInUi,
               ingredients: newFood.ingredients,
             )
           ],
         )
     );
  }



  void updateServingCountInUi(int index, double count){
    setState(() {
      List<List<String>> servingIngredientsCount = List<List<String>>.from(newFood.servingIngredientsCount);
      servingIngredientsCount[index]= [count.toString()];
      newFood = newFood.copyWith(
        servingIngredientsCount: servingIngredientsCount
      );
      calculateTotalMacros();
    });
  }

  void updateUiAfterIngredientUpdated(GenericFood updatedFood, List<int> selectedUnitIndexList){
    setState(() {
      _selectedAddIngredientOption = '';
      newFood = newFood.copyWith(
          ingredients: updatedFood.ingredients,
          servingIngredientsCount: updatedFood.servingIngredientsCount,
          fat: updatedFood.fat,
          carb: updatedFood.carb,
          protein: updatedFood.protein,
          calorie: updatedFood.calorie,
          units: updatedFood.units
      );
      _initialStateFood= newFood;
      _selectedIngredientsUnitIndexList= selectedUnitIndexList;
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


  Widget buildAddToCookBookButton(BuildContext context){
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
                 addToCookBookButtonClickListener(context);
               },
               child: const Text(ADD_TO_MY_COOK_BOOK,
                 style: TextStyle( color: Colors.white),)
           ),
         ),
         BlocConsumer<AddOrUpdateMyCookBookBloc, AddOrUpdateMyCookBookState>(
             builder: (mcontext, state) {
               if (state is AddOrUpdateMyCookBookLoadingState) {
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
               }else if(state is AddOrUpdateMyCookBookLoadedState){
                 Future.delayed(Duration.zero,(){
                   _addOrUpdateMyCookBookBloc.add(const AddOrUpdateMyCookBookEvent.onReset());
                   showSuccessToast(context, FOOD_ADDED_COOKBOOK_SUCCESS);
                 });
               }else if(state is AddOrUpdateMyCookBookErrorState){
                 FocusScope.of(context).unfocus();
                 _addOrUpdateMyCookBookBloc.add(const AddOrUpdateMyCookBookEvent.onReset());
                 Future.delayed(Duration.zero,(){
                   if(state.message == ERROR_FREE_USER_COOKBOOK_FOOD_NOT_ALLOWED){
                     return showUpgradePopupForFreeUsers(context, UPGRADE_MSG_COOKBOOK_FOOD);
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


  void addToCookBookButtonClickListener(BuildContext context){
    if(UserRegistrationStatus.userAccountId.isNotEmpty){
      if(_mealNameController.text.isEmpty){
        setState(() {
          _mealNameBorderColor = Colors.red;
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

      setState(() {
        _mealNameBorderColor = Colors.black;
      });
      requestOperationOnFood(context);
    }else{
      showRegisterDialog(context);
    }
  }


  void requestOperationOnFood(BuildContext context){
    newFood = newFood.copyWith(
        foodType: FoodType.meal,
        name: _mealNameController.text,
        servingAmount: [double.parse(_totalServingController.text.isEmpty ? _initialStateFood.servingAmount.toString() : _totalServingController.text)],
        unit: [_totalUnitController.text],
        recipe: _recipeController.text
    );

    if(widget.foodDetailArgumentModel.macroEdition){
      _addOrUpdateMyCookBookBloc.add(
        AddOrUpdateMyCookBookEvent.onAddToMyCookBook(
          fromGenericRecipe(newFood, _selectedIngredientsUnitIndexList),
        ),
      );
      return;
    }
    showUpgradePopupForFreeUsers(context, UPGRADE_MSG_MACRO_EDITION);
  }

  Widget macroAmountsWidgets(TextEditingController servingController,TextEditingController calorieController,
      TextEditingController proteinController,TextEditingController carbController,TextEditingController fatController, TextEditingController unitController){

    bool isEditable= true;

    if(calorieController == _totalCalorieController){
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
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
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
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
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
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
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
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
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
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
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
     return Column(
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
     );
   }


   Widget addIngredientChips(){
     /// add ingredients chips
     return Column(
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

                 fatSecretAttribute(),


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
                 child: Text('$UNIT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
             ),
             const SizedBox(width: 4,),

             ingredientUnitDropDown()

           ],
         ),
         const SizedBox(height: 16,),

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
                 if(_selectedAddIngredientOption != ADD_INGREDIENT_MANUALLY){
                   _calorieController = TextEditingController(text: _selectedGenericIngredient.calorie[0][_selectedUnitIndex].toString());
                   _proteinController = TextEditingController(text: _selectedGenericIngredient.protein[0][_selectedUnitIndex].toString());
                   _carbController = TextEditingController(text: _selectedGenericIngredient.carb[0][_selectedUnitIndex].toString());
                   _fatController = TextEditingController(text: _selectedGenericIngredient.fat[0][_selectedUnitIndex].toString());
                 }
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
       List<List<String>> servingIngredientsCount = List<List<String>>.from(newFood.servingIngredientsCount);
       if(_ingredientServingCountController.text.isEmpty){
         _ingredientServingCountController = TextEditingController(text: '1.0');
       }
       servingIngredientsCount.add([_ingredientServingCountController.text]);
       List<List<String>> ingredientsUnit = List<List<String>>.from(newFood.units);
       ingredientsUnit.add([_selectedAddIngredientOption == ADD_INGREDIENT_BY_SEARCH ? _selectedGenericIngredient.units[0][_selectedUnitIndex] : manualUnitOptions[_selectedUnitIndex]]);
       List<List<String>> ingredientsCalorie = List<List<String>>.from(newFood.calorie);
       ingredientsCalorie.add([_calorieController.text]);
       List<List<String>> ingredientsProtein = List<List<String>>.from(newFood.protein);
       ingredientsProtein.add([_proteinController.text]);
       List<List<String>> ingredientsCarb = List<List<String>>.from(newFood.carb);
       ingredientsCarb.add([_carbController.text]);
       List<List<String>> ingredientsFat = List<List<String>>.from(newFood.fat);
       ingredientsFat.add([_fatController.text]);
       _selectedIngredientsUnitIndexList.add(0);
       newFood = newFood.copyWith(
           ingredients: ingredients,
           servingIngredientsCount: servingIngredientsCount,
           units: ingredientsUnit,
           calorie: ingredientsCalorie,
           protein: ingredientsProtein,
           carb: ingredientsCarb,
           fat: ingredientsFat
       );
       _initialStateFood= newFood;
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
     _unitController.text= GRAM_LABEL;
     _selectedUnitIndex= 0;
   }


  void resetTotalMacroAmounts(){
    _groceryNameController.text = '';
    _totalCalorieController.text = '0';
    _totalProteinController.text = '0';
    _totalCarbController.text = '0';
    _totalFatController.text = '0';
    _selectedUnitIndex= 0;
    _totalServingController.text = '1';
    _totalUnitController.text= SERVING_LABEL;
  }



}
