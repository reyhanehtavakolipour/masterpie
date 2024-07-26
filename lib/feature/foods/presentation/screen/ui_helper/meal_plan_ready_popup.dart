import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../../../../util/core/constant/messages_constants.dart';
import '../../../../../util/design/color/app_colors.dart';
import '../../../../../util/design/text/app_assets.dart';



class MealPlanReadyPopup extends StatefulWidget {

  final Function(bool ready) readyForTutorial;


  const MealPlanReadyPopup({super.key, required this.readyForTutorial});

  @override
  State<MealPlanReadyPopup> createState() => _MealPlanReadyPopupState();
}


class _MealPlanReadyPopupState extends State<MealPlanReadyPopup> {




  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: DefaultTextStyle(
          style: const TextStyle(
            fontFamily: MONTSERRAT_FONT,
          ),
          child: contentBox(context)
      ),
    );
  }

  Widget contentBox(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 12, left: 16, right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            Padding(
                padding: const EdgeInsets.all(4),
                child: Image.asset(ROCEKT_PATH, width: 100, height: 100,)
            ),

            const SizedBox(height: 24.0),


            const Text(MEAL_PLAN_READY, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: DARK_PRIMARY_COLOR),),

            const SizedBox(height: 16.0),

            const Text(MEAL_PLAN_READY_DESC, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: DARK_PRIMARY_COLOR),),




            const SizedBox(height: 32.0),



            /// let's go button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  widget.readyForTutorial(true);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: MASTERPIE_YELLOW_COLOR
                ),
                child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(LETS_GO_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),)
                ),
              ),
            ),



            const SizedBox(height: 8,),

          ],
        ),
      ),
    );
  }


}