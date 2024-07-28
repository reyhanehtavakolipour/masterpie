
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/util/design/color/app_colors.dart';
import 'package:masterpie/util/design/text/app_assets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../util/core/constant/messages_constants.dart';


class WaitPopup extends StatefulWidget {

  final String message;

  final bool isForOneMeal;

  WaitPopup({required this.message, required this.isForOneMeal});

  @override
  _SelectContainerPopupState createState() => _SelectContainerPopupState();
}

class _SelectContainerPopupState extends State<WaitPopup> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(WAIT_LABEL, style: TextStyle(fontSize: 16, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),),
      content: SizedBox(
        width: double.maxFinite,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
                padding: const EdgeInsets.all(4),
                child: Image.asset(widget.message == GENERATE_MEAL_PLAN ? SAND_CLOCK_PATH : WELCOME_PATH, width: 100, height: 100,)
            ),


            const SizedBox(height: 16,),

            Text(
              widget.message,
              style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),


            const SizedBox(height: 24,),


            LinearPercentIndicator(
              animation: true,
              lineHeight: 20.0,
              animationDuration: widget.isForOneMeal ? 2500 : 12000,
              percent: 0.8,
              barRadius: const Radius.circular(8),
              progressColor: MASTERPIE_YELLOW_COLOR,
            ),

          ],
        ),
      ),
      actions: [

      ],
    );
  }
}