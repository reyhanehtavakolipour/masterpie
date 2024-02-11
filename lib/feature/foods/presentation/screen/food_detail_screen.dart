import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/presentation/screen/search_food_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/custom_radio_button.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/debouncer.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/foods_list_ui.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/meal_ingredients_list_ui.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/food_detail_argument_model.dart';
import '../../../../main_screen.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../../user/presentation/screen/user_plan_screen.dart';
import '../../data/repository_impl/foods_repository_impl.dart';
import '../../domain/model/food_model.dart';
import '../../domain/model/food_type.dart';
import '../bloc/add_or_update_my_favorite_bloc/add_or_update_my_favorite_bloc.dart';
import '../bloc/add_or_update_my_favorite_bloc/state_event/add_or_update_my_favorite_state_event.dart';
import '../bloc/get_logged_foods_bloc/get_logged_foods_bloc.dart';
import '../bloc/get_logged_foods_bloc/state_event/get_logged_foods_state_event.dart';
import '../bloc/groceries_bloc/groceries_bloc.dart';
import '../bloc/groceries_bloc/state_event/groceries_state_event.dart';
import '../bloc/log_foods_bloc/log_foods_bloc.dart';
import '../bloc/log_foods_bloc/state_event/log_foods_state_event.dart';
import '../bloc/my_favorite_foods/my_favorite_foods_bloc.dart';
import '../bloc/my_favorite_foods/state_event/my_favorite_foods_state_event.dart';
import '../bloc/remove_from_favorite_bloc/remove_from_my_favorite_bloc.dart';
import '../bloc/remove_from_favorite_bloc/state_event/remove_from_favorite_state_event.dart';
import 'my_favorite_foods_screen.dart';


enum FoodDetailScreenType{
  ADD_NEW_FAVORITE,
  EDIT_FAVORITE,
  VIEW_FAVORITE,
  VIEW,
  LOGGED_FOOD_VIEW,
  LOGGED_FOOD_EDIT,
  SUGGEST_FOOD_EDIT
}

class FoodDetailScreen extends StatefulWidget {

  static const routeName = '/food-detail-screen';

  final FoodDetailArgumentModel foodDetailArgumentModel;

  const FoodDetailScreen({super.key, required this.foodDetailArgumentModel});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {

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
   List<String> _addNewIngredientOptions= [];
   String _selectedAddIngredientOption = '';
   late TextEditingController _ingredientServingCountController;
   late TextEditingController _recipeController;
   Color _mealNameBorderColor = DARK_PRIMARY_COLOR;



   ///only grocery
   List<String> _addNewGroceryOptions= [];
   String _selectedAddGroceryOption = ADD_GROCERY_BY_SEARCH_LABEL;
   bool _searchedGroceriesVisible = false;


  String _foodType = GROCERY_LABEL;
  late GroceriesBloc _groceriesBloc;
  late RemoveFromMyFavoriteBloc _removeFromMyFavoriteBloc;
  Food newFood = Food();
  late AddOrUpdateMyFavoriteBloc _addOrUpdateMyFavoriteBloc;
  late MyFavoriteFoodsBloc _myFavoriteFoodsBloc;
   late GetLoggedFoodsBloc _getLoggedFoodsBloc;
   late LogFoodsBloc _logFoodsBloc;


   List<Food> _suggestedGroceries= [];


   bool _enabled =  false;

   String _favoriteId= '';

   bool _updatebuttonClicked= false;

  @override
  void initState() {
    super.initState();
    _addOrUpdateMyFavoriteBloc = context.read<AddOrUpdateMyFavoriteBloc>();
    _removeFromMyFavoriteBloc = context.read<RemoveFromMyFavoriteBloc>();
    _myFavoriteFoodsBloc = context.read<MyFavoriteFoodsBloc>();
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();
    _logFoodsBloc = context.read<LogFoodsBloc>();
    _removeFromMyFavoriteBloc.add(
      const RemoveFromMyFavoriteEvent.onReset(),
    );
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
    _addNewIngredientOptions = [ADD_INGREDIENT_BY_SEARCH, ADD_INGREDIENT_MANUALLY];
    _addNewGroceryOptions = [ADD_GROCERY_BY_SEARCH_LABEL, ADD_GROCERY_MANUALLY_LABEL];

    _ingredientNameController.addListener(_onSearchIngredientChanged);
    _groceryNameController.addListener(_onSearchGroceryChanged);
    
    _groceriesBloc = context.read<GroceriesBloc>();

    init();
  }


   void requestLoggedFoods(){
     String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
     _getLoggedFoodsBloc.add(
         GetLoggedFoodsEvent.onGetImmediateLoggedFoods(formattedDate)
     );
   }

   void searchFoodInFavorites(Food food){
     _myFavoriteFoodsBloc.add(
       MyFavoriteFoodsEvent.onImmediateSearchInMyFavoriteFoods(
           food
       ),
     );
   }

   void logFoodsOfToday(List<Food> foodsLoggedBefore){
     if(widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.LOGGED_FOOD_EDIT){
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
     }else{
       List<Food> foods = [];
       foods.addAll(foodsLoggedBefore);
       foods.add(newFood);
       _logFoodsBloc.add(
           LogFoodsEvent.onLogFoods(foods)
       );
     }
   }


   void _onSearchGroceryChanged() {
     setState(() {

     });
     _debouncer.run(() {
       _suggestedGroceries.clear();
       if(_groceryNameController.text.isNotEmpty && _selectedAddGroceryOption == ADD_GROCERY_BY_SEARCH_LABEL && widget.foodDetailArgumentModel.food == null){
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
       if(_ingredientNameController.text.isNotEmpty && _selectedAddIngredientOption == ADD_INGREDIENT_BY_SEARCH && _enabled){
         _groceriesBloc.add(
           GroceriesEvent.onGetGroceries(_ingredientNameController.text),
         );
         setState(() {
           _searchedGroceriesVisible = true;
         });
       }
     });
   }

   Future<void> _showDeleteConfirmation(BuildContext context) async {
     return showDialog<void>(
       context: context,
       barrierDismissible: true, // User must tap a button to close the dialog
       builder: (BuildContext context) {
         return AlertDialog(
           title: const Text(DELETE_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
           content: const SingleChildScrollView(
             child: ListBody(
               children: <Widget>[
                 Text(DELETE_CONFIRMATION_QUESTION, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 14, color: DARK_PRIMARY_COLOR)),
               ],
             ),
           ),
           actions: <Widget>[
             TextButton(
               child: const Text(YES_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 13, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
               onPressed: () {
                 Navigator.of(context).pop();
                 _removeFromMyFavoriteBloc.add(
                   RemoveFromMyFavoriteEvent.onRemoveFromMyFavorite(
                       newFood
                   ),
                 );
               },
             ),
             TextButton(
               child: const Text(NO_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 13, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
               onPressed: () {
                 Navigator.of(context).pop(); // Close the dialog
               },
             ),
           ],
         );
       },
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
    String appBarTitle = '';
    if(widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.ADD_NEW_FAVORITE){
      appBarTitle = ADD_NEW_LABEL;
    }else if(widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.EDIT_FAVORITE){
      appBarTitle = UPDATE_LABEL;
    }else{
      appBarTitle = FOOD_DETAIL_LABEL;
    }
    return PopScope(
      canPop: false,
      onPopInvoked : (didPop){
      },
      child: MaterialApp(
        theme: ThemeData(fontFamily: MONTSERRAT_FONT),
        home: Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle, style: const TextStyle(color: Colors.white),),
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
              Visibility(
                visible: widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.VIEW_FAVORITE ||
                    widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.LOGGED_FOOD_VIEW,
                child: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white,),
                  onPressed: () {
                    FoodDetailScreenType type = FoodDetailScreenType.EDIT_FAVORITE;
                    if(widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.VIEW_FAVORITE){
                      type = FoodDetailScreenType.EDIT_FAVORITE;
                    }else if(widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.LOGGED_FOOD_VIEW){
                      type = FoodDetailScreenType.LOGGED_FOOD_EDIT;
                    }
                    FoodDetailArgumentModel argumentModel = FoodDetailArgumentModel(foodDetailScreenType: type, food: newFood,
                        foodsListScreen: widget.foodDetailArgumentModel.foodsListScreen, macroEdition: widget.foodDetailArgumentModel.macroEdition);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodDetailScreen(foodDetailArgumentModel: argumentModel,),
                      ),
                    );
                  },
                ),
              ),
              Visibility(
                visible: widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.VIEW_FAVORITE,
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.white,),
                  onPressed: () {
                    _showDeleteConfirmation(context);
                  },
                ),
              ),
            ],
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text('$FOOD_TYPE_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

                    /// food type
                    CustomRadioListTile(
                      options: widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.ADD_NEW_FAVORITE ? const [GROCERY_LABEL, MEAL_LABEL] : [_foodType],
                      onSelectedOptionChanged: updateSelectedFoodType,
                      selectedOption: _foodType,
                      orientation: HORIZONTAL_ORIENTATION,
                      isEditable: widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.ADD_NEW_FAVORITE,
                    ),

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

                    /// add ingredient chips
                    addIngredientChips(),

                    /// add grocery chips
                    addGroceryChips(),


                    const SizedBox(height: 8,),

                    /// new ingredient
                    newIngredient(),

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

                    BlocConsumer<RemoveFromMyFavoriteBloc, RemoveFromMyFavoriteState>(
                        builder: (mcontext, state) {
                          if (state is RemoveFromMyFavoriteLoadingState) {
                            return const GFLoader(
                                  type: GFLoaderType.circle,
                                  loaderColorOne: DARK_PRIMARY_COLOR,
                                  loaderColorTwo: DARK_PRIMARY_COLOR,
                                  loaderColorThree: DARK_PRIMARY_COLOR,
                                );
                          }else if(state is RemoveFromMyFavoriteLoadedState){
                            Future.delayed(Duration.zero,(){
                              _removeFromMyFavoriteBloc.add(const RemoveFromMyFavoriteEvent.onReset());
                              if(widget.foodDetailArgumentModel.foodsListScreen == FoodsListScreen.MY_FAVORITE_FOODS_SCREEN){
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyFavoriteFoodsScreen(),
                                  ),
                                  (route) => false
                                );
                              }else if(widget.foodDetailArgumentModel.foodsListScreen == FoodsListScreen.SEARCH_FOOD_SCREEN){
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SearchFoodScreen(),
                                  ),
                                 (route) => false
                                );
                              }else if(widget.foodDetailArgumentModel.foodsListScreen == FoodsListScreen.MAIN_SCREEN){
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MainScreen(),
                                    ),
                                        (route) => false
                                );
                              }
                            });
                          }else if(state is RemoveFromMyFavoriteErrorState){
                            _removeFromMyFavoriteBloc.add(const RemoveFromMyFavoriteEvent.onReset());
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
                            });
                          }else if(state is ImmediateSearchInFoodsLoadedState){
                            Future.delayed(Duration.zero,(){
                              _myFavoriteFoodsBloc.add(const MyFavoriteFoodsEvent.onReset());
                              setState(() {
                                _favoriteId= state.favoriteId;
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
                            if(_updatebuttonClicked){
                              _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
                              Future.delayed(Duration.zero,(){
                                logFoodsOfToday(state.loggedFoods.foods);
                              });
                            }
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
                            if(_updatebuttonClicked){
                              _logFoodsBloc.add(const LogFoodsEvent.onReset());
                              Future.delayed(Duration.zero,(){
                                _updatebuttonClicked= false;
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                  builder: (context) => const MainScreen(),
                                ), (route) => false);
                              });
                            }
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
      ),
    );
  }


  void init(){

    _enabled= widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.EDIT_FAVORITE ||
        widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.LOGGED_FOOD_EDIT ||
        widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.ADD_NEW_FAVORITE ||
        widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.SUGGEST_FOOD_EDIT;

    if(widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.VIEW ||
        widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.LOGGED_FOOD_VIEW ||
        widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.LOGGED_FOOD_EDIT){
      searchFoodInFavorites(widget.foodDetailArgumentModel.food ?? Food());
    }
    
    if(widget.foodDetailArgumentModel.foodDetailScreenType != FoodDetailScreenType.ADD_NEW_FAVORITE){
      ///food type, food name
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
                readOnly: !_enabled,
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


       _totalCalorieController = TextEditingController(text: '${calorie.toInt()}');
       _totalProteinController = TextEditingController(text: '${protein.toInt()}');
       _totalCarbController = TextEditingController(text: '${carb.toInt()}');
       _totalFatController = TextEditingController(text: '${fat.toInt()}');
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
               onServingCountChangeRequested: updateServingCountInUi, isEditable: _enabled,
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


  Widget buildBottomButton(BuildContext context){

    bool isVisible = false;
    String buttonText = '';
    if(widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.ADD_NEW_FAVORITE ||
        widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.SUGGEST_FOOD_EDIT){
      buttonText = ADD_TO_MY_FAVORTITE;
      isVisible = true;
    }else if(widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.LOGGED_FOOD_EDIT){
      buttonText = UPDATE_LOG_LABEL;
      isVisible = true;
    }else if(widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.EDIT_FAVORITE){
      buttonText = UPDATE_FAVORITE_LABEL;
      isVisible = true;
    }else if(widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.LOGGED_FOOD_VIEW || widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.VIEW){
      if(_favoriteId.isNotEmpty){
        buttonText = REMOVE_FROM_FAVORITE_LABEL ;
      }else{
        buttonText = ADD_TO_MY_FAVORTITE;
      }
      isVisible = true;
    }

     return  Visibility(
       visible: isVisible,
       child: Column(
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
          child: Text(buttonText,
            style: const TextStyle( color: Colors.white),)
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
                     if(widget.foodDetailArgumentModel.foodsListScreen == FoodsListScreen.MY_FAVORITE_FOODS_SCREEN){
                       Navigator.pushAndRemoveUntil(
                           context,
                           MaterialPageRoute(
                             builder: (context) => const MyFavoriteFoodsScreen(),
                           ),
                               (route) => false
                       );
                     }else if(widget.foodDetailArgumentModel.foodsListScreen == FoodsListScreen.SEARCH_FOOD_SCREEN){
                       Navigator.pushAndRemoveUntil(
                           context,
                           MaterialPageRoute(
                             builder: (context) => const SearchFoodScreen(),
                           ),
                               (route) => false
                       );
                     }else if(widget.foodDetailArgumentModel.foodsListScreen == FoodsListScreen.SUGGEST_FOOD_SCREEN){
                       showSuccessToast(context, FOOD_ADDED_TO_FAVORITE_MSG);
                       Navigator.pushAndRemoveUntil(
                           context,
                           MaterialPageRoute(
                             builder: (context) => const MainScreen(),
                           ),
                               (route) => false
                       );
                     }else if(widget.foodDetailArgumentModel.foodsListScreen == FoodsListScreen.MAIN_SCREEN){
                       if(widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.LOGGED_FOOD_VIEW){
                         Navigator.pushAndRemoveUntil(
                             context,
                             MaterialPageRoute(
                               builder: (context) => const MainScreen(),
                             ),
                                 (route) => false
                         );
                       }else if(widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.LOGGED_FOOD_EDIT){
                         _updatebuttonClicked= true;
                         requestLoggedFoods();
                       }
                     }
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
       ),
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
        servingAmount: int.parse(_totalServingController.text),
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

    if(widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.ADD_NEW_FAVORITE){
      _addOrUpdateMyFavoriteBloc.add(
        AddOrUpdateMyFavoriteEvent.onAddToMyFavorite(
            newFood
        ),
      );
    }else if(widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.EDIT_FAVORITE){
      if(widget.foodDetailArgumentModel.macroEdition){
        _addOrUpdateMyFavoriteBloc.add(
          AddOrUpdateMyFavoriteEvent.onUpdateMyFavorite(
            newFood,
          ),
        );
        return;
      }
      showUpgradePopupForFreeUsers(context, UPGRADE_MSG_MACRO_EDITION);

    }else if(widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.LOGGED_FOOD_EDIT){

      if(!widget.foodDetailArgumentModel.macroEdition){
        showUpgradePopupForFreeUsers(context, UPGRADE_MSG_MACRO_EDITION);
        return;
      }


      if(_favoriteId.isNotEmpty){
        _showUpdateLoggedFoodAndFavoriteConfirmation(context);
      }else{
        _updatebuttonClicked= true;
        requestLoggedFoods();
      }
    }else if(widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.VIEW ||
        widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.LOGGED_FOOD_VIEW){
      if(_favoriteId.isNotEmpty){
        _removeFromMyFavoriteBloc.add(
          RemoveFromMyFavoriteEvent.onRemoveFromMyFavorite(
            newFood.copyWith(id: _favoriteId),
          ),
        );
      }else{
        _addOrUpdateMyFavoriteBloc.add(
          AddOrUpdateMyFavoriteEvent.onAddToMyFavorite(
            newFood,
          ),
        );
      }
    }else if(widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.SUGGEST_FOOD_EDIT){
      _addOrUpdateMyFavoriteBloc.add(
        AddOrUpdateMyFavoriteEvent.onAddToMyFavorite(
          newFood,
        ),
      );
    }
  }


   Future<void> _showUpdateLoggedFoodAndFavoriteConfirmation(BuildContext context) async {
     return showDialog<void>(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(
           title: const Text(UPDATE_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
           content: const SingleChildScrollView(
             child: ListBody(
               children: <Widget>[
                 Text(UPDATE_FAVORITE_AND_LOGGED_FOOD_CONTENT, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 14, color: DARK_PRIMARY_COLOR)),
               ],
             ),
           ),
           actions: <Widget>[
             TextButton(
               child: const Text(YES_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 13, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
               onPressed: () {
                 Navigator.of(context).pop();
                 _addOrUpdateMyFavoriteBloc.add(
                   AddOrUpdateMyFavoriteEvent.onUpdateMyFavorite(
                     newFood.copyWith(id: _favoriteId),
                   ),
                 );
               },
             ),
             TextButton(
               child: const Text(ONLY_UPDATE_LOGGED_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 13, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
               onPressed: () {
                 Navigator.of(context).pop();
                 _updatebuttonClicked= true;
                 requestLoggedFoods();
               },
             ),
           ],
         );
       },
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
                enabled: _enabled,
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
                enabled: _enabled,
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
                enabled: _enabled,
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
                enabled: _enabled,
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
                enabled: _enabled,
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
                enabled: _enabled,
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
                      enabled: _enabled,
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
       child: Row(
           children: [
             const Text('$NAME_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),),
             const SizedBox(width: 4,),
             Expanded(
               child: SizedBox(
                 height: SEARCH_BAR_HEIGHT,
                 child: TextField(
                   enabled: _enabled,
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


   Widget addIngredientChips(){
     /// add ingredients chips
    return Visibility(
       visible: _foodType == MEAL_LABEL && (widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.EDIT_FAVORITE ||
           widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.LOGGED_FOOD_EDIT ||
           widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.ADD_NEW_FAVORITE ||
           widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.SUGGEST_FOOD_EDIT),
       child: Wrap(
         spacing: 4,
         children: _addNewIngredientOptions.map((item) {
           if(_selectedAddIngredientOption == item){
             return addIngredientOptionChipSelected(item);
           }else{
             return addIngredientChipNotSelected(item);
           }
         },).toList(),
       ),
     );
   }

  Widget addGroceryChips(){
    /// add grocery chips
    return Visibility(
      visible: _foodType == GROCERY_LABEL && widget.foodDetailArgumentModel.foodDetailScreenType == FoodDetailScreenType.ADD_NEW_FAVORITE,
      child: Wrap(
        spacing: 4,
        children: _addNewGroceryOptions.map((item) {
          if(_selectedAddGroceryOption == item){
            return addGroceryOptionChipSelected(item);
          }else{
            return addGroceryChipNotSelected(item);
          }
        },).toList(),
      ),
    );
  }


  Widget suggestedGroceriesBloc(bool isTotal){
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

        suggestedGroceriesList(isTotal),


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

  Widget suggestedGroceriesList(bool isTotal){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _suggestedGroceries.length,
      itemBuilder: (context, index){
        Food grocery = _suggestedGroceries[index];
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
              if(isTotal){
                  _searchedGroceriesVisible = false;
                  _groceryNameController= TextEditingController(text: grocery.name.replaceAll(',', ''));
                  _totalServingController = TextEditingController(text: grocery.servingAmounts[0].toString());
                  _totalCalorieController = TextEditingController(text: grocery.calorie[0].toString());
                  _totalProteinController = TextEditingController(text: grocery.protein[0].toString());
                  _totalCarbController = TextEditingController(text: grocery.carb[0].toString());
                  _totalFatController = TextEditingController(text: grocery.fat[0].toString());
                  _totalUnitController = TextEditingController(text: grocery.units[0].toString());
                  _groceryNameController.addListener(_onSearchGroceryChanged);
              }else{
                _searchedGroceriesVisible = false;
                _ingredientNameController= TextEditingController(text: grocery.name.replaceAll(',', ''));
                _ingredientServingCountController= TextEditingController(text: '1.0');
                _servingController = TextEditingController(text: grocery.servingAmount.toString() == '0' ? '100' : grocery.servingAmount.toString());
                _calorieController = TextEditingController(text: grocery.calorie[0].toString());
                _proteinController = TextEditingController(text: grocery.protein[0].toString());
                _carbController = TextEditingController(text: grocery.carb[0].toString());
                _fatController = TextEditingController(text: grocery.fat[0].toString());
                _unitController = TextEditingController(text: grocery.units[0].toString());
                _ingredientNameController.addListener(_onSearchIngredientChanged);
              }
            });
          },
        );
      }
  );
  }

  Widget newGrocery(){
     return Visibility(
       visible: _selectedAddGroceryOption.isNotEmpty && _foodType == GROCERY_LABEL,
         child:   Stack(
           children: [
             Row(
               children: [
                 Expanded(
                   child: SizedBox(
                     height: SEARCH_BAR_HEIGHT,
                     child: TextField(
                       enabled: _enabled,
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
                   ),
                 ),
                 const SizedBox(width: 12,),
                 Visibility(
                   visible: _selectedAddGroceryOption == ADD_GROCERY_BY_SEARCH_LABEL && _enabled,
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
                         GroceriesEvent.onGetGroceries(_groceryNameController.text),
                       );
                       setState(() {
                         _searchedGroceriesVisible = true;
                       });
                     },
                   ),
                 )
               ],
             ),
             suggestedGroceriesBloc(true)
           ],
         ),
     );
  }

   Widget newIngredient(){
     return Visibility(
       visible: _selectedAddIngredientOption.isNotEmpty && _foodType == MEAL_LABEL,
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
                                   enabled: _enabled,
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
                         suggestedGroceriesBloc(false)
                       ],
                     ),

                     const SizedBox(height: 16,),

                     macroAmountsWidgets(_servingController, _calorieController, _proteinController, _carbController, _fatController, _unitController, false),

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
