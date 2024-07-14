
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/util/design/color/app_colors.dart';
import 'package:masterpie/util/design/text/app_assets.dart';

import '../../../../../util/core/constant/messages_constants.dart';


class WaitPopup extends StatefulWidget {

  final String message;

  WaitPopup({required this.message});

  @override
  _SelectContainerPopupState createState() => _SelectContainerPopupState();
}

class _SelectContainerPopupState extends State<WaitPopup> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(WAIT_LABEL, style: TextStyle(fontSize: 16, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),),
      content: Container(
        width: double.maxFinite,
        height: 400,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.asset(SAND_CLOCK_PATH, width: 100, height: 100,)
                ),


                const SizedBox(height: 16,),

                const Text(
                  GENERATE_MEAL_PLAN,
                  style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),


                const SizedBox(height: 24,),

                const GFLoader(
                  type: GFLoaderType.circle,
                  loaderColorOne: DARK_PRIMARY_COLOR,
                  loaderColorTwo: DARK_PRIMARY_COLOR,
                  loaderColorThree: DARK_PRIMARY_COLOR,
                )

              ],
            ),
          ),
        ),
      ),
      actions: [

      ],
    );
  }
}