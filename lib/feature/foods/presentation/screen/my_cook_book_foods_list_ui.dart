

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/edit_food_information_dialog.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/edit_food_info_ui_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/food_detail_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/view_cook_book_food_screen.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import '../../../../../util/core/constant/messages_constants.dart';
import '../../../../../util/design/color/app_colors.dart';
import '../../../../../util/design/size/app_widget_size.dart';
import '../../../../../util/design/text/app_assets.dart';
import '../../domain/model/food_model.dart';
import '../../domain/model/food_type.dart';
import '../bloc/add_or_update_my_favorite_bloc/add_or_update_my_favorite_bloc.dart';
import '../bloc/add_or_update_my_favorite_bloc/state_event/add_or_update_my_favorite_state_event.dart';
import '../food_calculator/food_calculator.dart';



class MyCookBookFoodsListUi extends StatefulWidget {

  final FoodCalculator foodCalculator;
  final Function(List<Food>) onFoodsChanged;
  final List<Food> foods;
  final Function(Food food, bool addToFavorite) onFavoriteButtonClicked;
  final List<FoodType> foodsTypeRequested;
  final Color foodBackGroundColor;
  final Icon foodIcon;
  final bool macroEdition;

  const MyCookBookFoodsListUi({super.key,required this.foodCalculator, required this.foods, required this.onFoodsChanged,
    required this.onFavoriteButtonClicked, required this.foodsTypeRequested,
  required this.foodBackGroundColor, required this.foodIcon, required this.macroEdition});


  @override
  State<MyCookBookFoodsListUi> createState() => _MyCookBookFoodsListUiState();

  static _MyCookBookFoodsListUiState? of(BuildContext context) {
    return context.findAncestorStateOfType<_MyCookBookFoodsListUiState>();
  }
}

class _MyCookBookFoodsListUiState extends State<MyCookBookFoodsListUi> {


  List<Food> foodsChanged= [];


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


    List<String> servingAmounts = [];
    servingAmounts.addAll(food.servingAmounts);
    servingAmounts.removeWhere((item) => item.isEmpty);

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
        servingAmounts: servingAmounts,
        units: servingUnits,
        servingIngredientsCount: servingIngredientCounts
    );
  }




  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.foods.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Food food = widget.foods[index];
              if(!widget.foodsTypeRequested.contains(food.foodType)){
                return const SizedBox.shrink();
              }
              final foodInformation= widget.foodCalculator.initFoodListBuilder(food);
              double quantity = foodInformation.quantity;
              String calorie= foodInformation.calorie.toStringAsFixed(foodInformation.calorie.truncateToDouble() == foodInformation.calorie ? 0 : 2);
              String protein= foodInformation.protein.toStringAsFixed(foodInformation.protein.truncateToDouble() == foodInformation.protein ? 0 : 2);
              String carb= foodInformation.carb.toStringAsFixed(foodInformation.carb.truncateToDouble() == foodInformation.carb ? 0 : 2);
              String fat= foodInformation.fat.toStringAsFixed(foodInformation.fat.truncateToDouble() == foodInformation.fat ? 0 : 2);
              bool isFoodAdded= foodInformation.isFoodAdded;
              double servingQuantity= foodInformation.servingQuantity;
              String foodUnit= foodInformation.foodUnit;

              return GestureDetector(
                onTap: (){
                    FoodDetailArgumentModel argumentModel = FoodDetailArgumentModel(
                      food: checkFoodParameters(food),
                      macroEdition: widget.macroEdition
                    );


                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewCookBookFoodScreen(foodDetailArgumentModel: argumentModel,),
                      ),
                    );
                },
                child: Card(
                  color: widget.foodBackGroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(BORDER_RADIUS),
                  ),
                  child: Row(

                    children: [

                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                const SizedBox(height: 24,),

                                /// food name
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    widget.foodIcon,
                                    const SizedBox(width: 2,),
                                    Expanded(
                                      child: Text(food.name.capitalize(),
                                        style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 16, fontWeight: FontWeight.bold, fontFamily: MONTSERRAT_FONT),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 8,),


                                /// calorie
                                GestureDetector(
                                  child: Text('$calorie cal',
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontFamily: MONTSERRAT_FONT,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  onTap: (){
                                    // editMacrosClickListener(food.foodType, servingQuantity, foodUnit, double.parse(calorie), double.parse(protein),
                                    //     double.parse(carb), double.parse(fat), isFoodAdded, food);
                                  },
                                ),

                                const SizedBox(height: 24,),

                              ],
                            ),
                          ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [


                              /// more icon: add/remove favorite
                              PopupMenuButton<String>(
                                icon: const Icon(Icons.more_horiz),
                                onSelected: (String result) {
                                  if(result == ADD_TO_MY_FAVORTITE){
                                    widget.onFavoriteButtonClicked(food, true);
                                  }else{
                                    widget.onFavoriteButtonClicked(food, false);
                                  }
                                },
                                itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                                  PopupMenuItem<String>(
                                    value: widget.foodIcon.icon == Icons.favorite ? REMOVE_FROM_FAVORITE_LABEL : ADD_TO_MY_FAVORTITE,
                                    child: ListTile(
                                      leading: widget.foodIcon.icon == Icons.favorite ? const Icon(Icons.delete) : const Icon(Icons.favorite),
                                      title: Text(widget.foodIcon.icon == Icons.favorite ? REMOVE_FROM_FAVORITE_LABEL : ADD_TO_MY_FAVORTITE, style: const TextStyle(fontFamily: MONTSERRAT_FONT),),
                                    ),
                                  ),
                                ],
                              ),


                              /// plus button when no serving is added
                              Visibility(
                                visible: !isFoodAdded,
                                child: GestureDetector(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    // margin: const EdgeInsets.only(bottom: 16, right: 12),
                                    decoration: BoxDecoration(
                                      color: DARK_PRIMARY_COLOR,
                                      borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
                                    ),
                                    child: const Text(LOG_FOOD_LABEL, style: TextStyle(color: Colors.white, fontFamily: MONTSERRAT_FONT, fontWeight: FontWeight.bold, fontSize: 10),),
                                  ),
                                  onTap: (){
                                    setState(() {
                                      widget.foodCalculator.addFoodByOne(food);
                                      updateFoodsChanged();
                                    });
                                  },
                                ),
                              ),

                              /// plus button when at least one serving is added
                              Visibility(
                                visible: isFoodAdded,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6),
                                  margin: const EdgeInsets.only(bottom: 16, right: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
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
                                            widget.foodCalculator.removeFoodByOne(food);
                                            updateFoodsChanged();
                                          });
                                        },

                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 4),
                                          child: Text('$quantity', style: const TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold))
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
                                            widget.foodCalculator.addFoodByOne(food);
                                            updateFoodsChanged();
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 24,)
                            ],
                          ),
                        ),
                      ),

                    ],

                  ),
                ),
              );
            },
          );
  }


  void editMacrosClickListener(FoodType foodType, int servingQuantity, String foodUnit, double calorie, double protein, double carb, double fat, bool isFoodAdded, Food food){
    showEditServingAndCalorieDialog(context, foodType, servingQuantity.toString(), foodUnit.toString(), calorie.toString(), protein.toString(), carb.toString(), fat.toString()).then((value){
      if(isFoodAdded){
        setState(() {
          widget.foodCalculator.updateFoodsChangedAfterEditingServingMacro(food, value);
          updateFoodsChanged();
          insertOrUpdateMyFavoriteBasedOnServingMacrosChange(value.shouldSaveToFavorites, food, value);
        });
      }else{
        setState(() {
          widget.foodCalculator.updateFoodsChangedAfterEditingServingMacro(food, value);
          updateFoodsChanged();
          insertOrUpdateMyFavoriteBasedOnServingMacrosChange(value.shouldSaveToFavorites, food, value);
        });
      }
    });
  }


  void insertOrUpdateMyFavoriteBasedOnServingMacrosChange(bool shouldSaveToFavorites, Food food, ServingMacroDialogValues value){
      if(shouldSaveToFavorites){
        final addOrUpdateMyFavoriteBloc = context.read<AddOrUpdateMyFavoriteBloc>();
        /// only favorite groceries can be updated from the list screen
        final updatedFood = food.copyWith(calorie: value.calorie, protein: value.protein, carb: value.carb, fat: value.fat, units: [value.unit], servingAmounts: [value.serving.toString()]);
        addOrUpdateMyFavoriteBloc.add(
          AddOrUpdateMyFavoriteEvent.onAddOrUpdateMyFavorite(updatedFood),
        );
      }
  }


  void updateFoodsChanged(){
    foodsChanged = widget.foodCalculator.visibleFoods;
    widget.onFoodsChanged(foodsChanged);
  }
}
