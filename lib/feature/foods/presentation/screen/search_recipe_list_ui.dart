

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




class SearchRecipesListUi extends StatefulWidget {

  final GenericFoodCalculator foodCalculator;
  final List<GenericFood> foods;
  final Function(GenericFood food) onRecipeClicked;
  final Color foodBackGroundColor;
  final Icon foodIcon;

  const SearchRecipesListUi({super.key,required this.foodCalculator, required this.foods,
  required this.onRecipeClicked, required this.foodBackGroundColor, required this.foodIcon});


  @override
  State<SearchRecipesListUi> createState() => _SearchRecipesListUiState();

  static _SearchRecipesListUiState? of(BuildContext context) {
    return context.findAncestorStateOfType<_SearchRecipesListUiState>();
  }
}

class _SearchRecipesListUiState extends State<SearchRecipesListUi> {


  List<GenericFood> foodsChanged= [];



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.foods.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              GenericFood food = widget.foods[index];
              final foodInformation= widget.foodCalculator.initFoodListBuilder(food);
              // String calorie= foodInformation.calorie[0][0].toStringAsFixed(foodInformation.calorie[0][0].truncateToDouble() == foodInformation.calorie[0][0] ? 0 : 2);


              double calorie= 0;
              foodInformation.calorie.forEach((element) {
                calorie= calorie + element[0];
              });


              return GestureDetector(
                onTap: (){
                  widget.onRecipeClicked(food);
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
                                Text('~ $calorie cal $PER_SERVING_LABEL',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontFamily: MONTSERRAT_FONT,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),

                                const SizedBox(height: 24,),

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



}
