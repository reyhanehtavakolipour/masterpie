

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/presentation/food_calculator/generic_food_calculator.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model_converter.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import '../../../../../util/core/constant/messages_constants.dart';
import '../../../../../util/design/color/app_colors.dart';
import '../../../../../util/design/size/app_widget_size.dart';
import '../../../../../util/design/text/app_assets.dart';
import '../../domain/model/food_model.dart';
import '../../domain/model/food_type.dart';




class SearchGroceriesListUi extends StatefulWidget {

  final GenericFoodCalculator foodCalculator;
  final Function(List<Food>) onFoodsChanged;
  final List<GenericFood> foods;
  final Function(Food food) onFavoriteButtonClicked;
  final Function(GenericFood food) onGroceryClicked;
  final List<FoodType> foodsTypeRequested;
  final Color foodBackGroundColor;
  final Icon foodIcon;
  final bool macroEdition;

  const SearchGroceriesListUi({super.key,required this.foodCalculator, required this.foods, required this.onFoodsChanged,
    required this.onFavoriteButtonClicked, required this.onGroceryClicked, required this.foodsTypeRequested,
  required this.foodBackGroundColor, required this.foodIcon, required this.macroEdition});


  @override
  State<SearchGroceriesListUi> createState() => _SearchGroceriesListUiState();

  static _SearchGroceriesListUiState? of(BuildContext context) {
    return context.findAncestorStateOfType<_SearchGroceriesListUiState>();
  }
}

class _SearchGroceriesListUiState extends State<SearchGroceriesListUi> {


  List<GenericFood> foodsChanged= [];



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.foods.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              GenericFood food = widget.foods[index];
              if(!widget.foodsTypeRequested.contains(food.foodType)){
                return const SizedBox.shrink();
              }
              final foodInformation= widget.foodCalculator.initFoodListBuilder(food);
              double quantity = foodInformation.count;
              String calorie= foodInformation.calorie[0][0].toStringAsFixed(foodInformation.calorie[0][0].truncateToDouble() == foodInformation.calorie[0][0] ? 0 : 2);
              String protein= foodInformation.protein[0][0].toStringAsFixed(foodInformation.protein[0][0].truncateToDouble() == foodInformation.protein[0][0] ? 0 : 2);
              String carb= foodInformation.carb[0][0].toStringAsFixed(foodInformation.carb[0][0].truncateToDouble() == foodInformation.carb[0][0] ? 0 : 2);
              String fat= foodInformation.fat[0][0].toStringAsFixed(foodInformation.fat[0][0].truncateToDouble() == foodInformation.fat ? 0 : 2);
              bool isFoodAdded= foodInformation.isFoodAdded;
              double servingQuantity= foodInformation.servingAmounts[0][0];
              String foodUnit= foodInformation.units[0][0];

              return GestureDetector(
                onTap: (){
                  widget.onGroceryClicked(food);
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
                                    widget.onFavoriteButtonClicked(fromGenericGrocery(food));
                                },
                                itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                                  const PopupMenuItem<String>(
                                    value: ADD_TO_MY_FAVORTITE,
                                    child: ListTile(
                                      leading: Icon(Icons.favorite),
                                      title: Text( ADD_TO_MY_FAVORTITE, style: TextStyle(fontFamily: MONTSERRAT_FONT),),
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


  void updateFoodsChanged(){
    foodsChanged = widget.foodCalculator.visibleFoods;

    List<Food> foods= [];
    foodsChanged.forEach((food) {
      foods.add(fromGenericGrocery(food));
    });

    widget.onFoodsChanged(foods);
  }

}
