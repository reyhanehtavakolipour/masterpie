

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




class SearchGroceriesListUiForMacroWizard extends StatefulWidget {

  final GenericFoodCalculator foodCalculator;
  final List<GenericFood> foods;
  final Function(Food food) onAddButtonClicked;
  final Function(GenericFood food) onGroceryClicked;
  final Color foodBackGroundColor;
  final Icon foodIcon;

  const SearchGroceriesListUiForMacroWizard({super.key, required this.foodCalculator, required this.foods,
    required this.onAddButtonClicked, required this.onGroceryClicked, required this.foodBackGroundColor, required this.foodIcon});


  @override
  State<SearchGroceriesListUiForMacroWizard> createState() => _SearchGroceriesListUiForMacroWizardState();

  static _SearchGroceriesListUiForMacroWizardState? of(BuildContext context) {
    return context.findAncestorStateOfType<_SearchGroceriesListUiForMacroWizardState>();
  }
}

class _SearchGroceriesListUiForMacroWizardState extends State<SearchGroceriesListUiForMacroWizard> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.foods.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              GenericFood food = widget.foods[index];
              final foodInformation= widget.foodCalculator.initFoodListBuilder(food);
              String calorie= foodInformation.calorie[0][0].toStringAsFixed(foodInformation.calorie[0][0].truncateToDouble() == foodInformation.calorie[0][0] ? 0 : 2);


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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    food.image.isEmpty ? IconButton(
                                      icon: Image.asset(HOW_MUCH_EAT_PATH, color: DARK_PRIMARY_COLOR, width: 32, height: 32,),
                                      onPressed: () {
                                      },
                                    ) : ClipOval(child: Image.network(food.image, width: 32, height: 32,)),
                                    const SizedBox(width: 6 ,),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          Text(food.name.capitalize(),
                                            style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 16, fontWeight: FontWeight.bold, fontFamily: MONTSERRAT_FONT),
                                          ),

                                          Visibility(
                                            visible: food.brandName.isNotEmpty,
                                            child: Text(food.brandName.capitalize(),
                                              style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 13, fontWeight: FontWeight.normal, fontFamily: MONTSERRAT_FONT),
                                            ),
                                          ),
                                        ],
                                      )
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

                              /// add food button
                              GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  // margin: const EdgeInsets.only(bottom: 16, right: 12),
                                  decoration: BoxDecoration(
                                    color: DARK_PRIMARY_COLOR,
                                    borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
                                  ),
                                  child: const Text(ADD_FOOD_LABEL, style: TextStyle(color: Colors.white, fontFamily: MONTSERRAT_FONT, fontWeight: FontWeight.bold, fontSize: 10),),
                                ),
                                onTap: (){
                                  widget.onAddButtonClicked(fromGenericGrocery(food));
                                },
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



}
