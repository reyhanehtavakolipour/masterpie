import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/foods/presentation/screen/edit_favorite_food_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/custom_radio_button.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/debouncer.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/food_detail_argument_model.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../domain/model/food_model.dart';
import '../../domain/model/food_type.dart';
import '../bloc/remove_from_favorite_bloc/remove_from_my_favorite_bloc.dart';
import '../bloc/remove_from_favorite_bloc/state_event/remove_from_favorite_state_event.dart';
import 'my_favorite_foods_screen.dart';



class ViewFavoriteFoodScreen extends StatefulWidget {

  final FoodDetailArgumentModel foodDetailArgumentModel;

  const ViewFavoriteFoodScreen({super.key, required this.foodDetailArgumentModel});

  @override
  State<ViewFavoriteFoodScreen> createState() => _ViewFavoriteFoodScreenState();
}

class _ViewFavoriteFoodScreenState extends State<ViewFavoriteFoodScreen> {

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

   late TextEditingController _mealNameController;
   late TextEditingController _ingredientServingCountController;
   late TextEditingController _recipeController;


  String _foodType = GROCERY_LABEL;
  late RemoveFromMyFavoriteBloc _removeFromMyFavoriteBloc;
  Food newFood = Food();

  @override
  void initState() {
    super.initState();
    _removeFromMyFavoriteBloc = context.read<RemoveFromMyFavoriteBloc>();
    _removeFromMyFavoriteBloc.add(
      const RemoveFromMyFavoriteEvent.onReset(),
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
    return PopScope(
      canPop: false,
      onPopInvoked : (didPop){
      },
      child: MaterialApp(
        theme: ThemeData(fontFamily: MONTSERRAT_FONT),
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
                  FoodDetailArgumentModel argumentModel = FoodDetailArgumentModel(food: newFood, macroEdition: widget.foodDetailArgumentModel.macroEdition);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditFavoriteFoodScreen(foodDetailArgumentModel: argumentModel,),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.white,),
                onPressed: () {
                  _showDeleteConfirmation(context);
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

                    const Text('$FOOD_TYPE_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

                    /// food type
                    CustomRadioListTile(
                      options: [_foodType],
                      onSelectedOptionChanged: updateSelectedFoodType,
                      selectedOption: _foodType,
                      orientation: HORIZONTAL_ORIENTATION,
                      isEditable: false,
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


                    const SizedBox(height: 8,),


                    /// added ingredients
                    addedIngredients(),

                    recipe(),

                    const SizedBox(height: 16,),

                    const Text('$TOTAL_MACRO_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

                    const SizedBox(height: 16,),

                    /// total macros
                    macroAmountsWidgets(_totalServingController, _totalCalorieController, _totalProteinController, _totalCarbController, _totalFatController, _totalUnitController, true),

                    const SizedBox(height: 36,),


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
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyFavoriteFoodsScreen(),
                                  ),
                                  (route) => false
                                );
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
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }


  void init(){
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
                   controller: _mealNameController,
                   decoration: const InputDecoration(
                     border: OutlineInputBorder(
                       borderSide: BorderSide(),
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(width: 2),
                     ),
                     contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                   ),
                   style: const TextStyle(color: DARK_PRIMARY_COLOR),
                 ),
               ),
             ),
           ],
         ),
     );
   }

  void updateSelectedFoodType(String type){

  }

}
