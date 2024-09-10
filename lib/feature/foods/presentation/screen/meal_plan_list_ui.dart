

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/domain/model/meal_plan_model.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import '../../../../../util/design/color/app_colors.dart';
import '../../../../../util/design/size/app_widget_size.dart';
import '../../../../../util/design/text/app_assets.dart';


class MealPlanListUi extends StatefulWidget {

  final List<MealPlan> mealPlans;
  final Function(MealPlan mealPlan) onPlanClicked;

  const MealPlanListUi({super.key,required this.mealPlans, required this.onPlanClicked});


  @override
  State<MealPlanListUi> createState() => _MealPlanListUiState();

  static _MealPlanListUiState? of(BuildContext context) {
    return context.findAncestorStateOfType<_MealPlanListUiState>();
  }
}

class _MealPlanListUiState extends State<MealPlanListUi> {


  List<GenericFood> foodsChanged= [];



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.mealPlans.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        MealPlan mealPlan = widget.mealPlans[index];

        return GestureDetector(
          onTap: (){
            widget.onPlanClicked(mealPlan);
          },
          child: Card(
            color: CATEGORY_COLOR,
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

                        /// plan name
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(HOW_MUCH_EAT_PATH, color: DARK_PRIMARY_COLOR, width: 32, height: 32,),

                            const SizedBox(width: 6,),

                            Expanded(
                              child: Text(mealPlan.name.capitalize(),
                                style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 16, fontWeight: FontWeight.bold, fontFamily: MONTSERRAT_FONT),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8,),


                        /// macro
                        Text('${mealPlan.totalMacro[0]} cal, ${mealPlan.totalMacro[1]} g protein, ${mealPlan.totalMacro[2]} g carb, ${mealPlan.totalMacro[3]} g fat',
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
