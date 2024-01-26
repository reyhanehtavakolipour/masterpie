


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../feature/user/presentation/screen/user_plan_screen.dart';
import '../../core/constant/messages_constants.dart';
import '../color/app_colors.dart';
import '../size/app_widget_size.dart';
import '../text/app_assets.dart';

extension StringExtension on String {
  String capitalize() {
    if(isEmpty){
      return '';
    }
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}


final RegExp numericRegExp = RegExp(r'^\d*\.?\d*$'); // Regular expression to allow numbers


bool isValidEmail(String email) {
  final emailRegex = RegExp(
    r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
  );
  return emailRegex.hasMatch(email);
}


bool isValidPassword(String password) {
  // Check if the password length is at least 6 characters
  if (password.length < 6) {
    return false;
  }

  // Check if the password contains at least one digit
  if (!password.contains(RegExp(r'\d'))) {
    return false;
  }

  // Check if the password contains at least one special character
  if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return false;
  }

  // Check if the password contains both uppercase and lowercase letters
  if (!password.contains(RegExp(r'[a-z]')) || !password.contains(RegExp(r'[A-Z]'))) {
    return false;
  }

  return true;
}


Future<void> showUpgradePopupForFreeUsers(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(UPGRADE_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset(PLANS_PATH, width: SIZE_IMAGE_UPGRADE_PLAN, height: SIZE_IMAGE_UPGRADE_PLAN,),

              const SizedBox(height: 16,),

              const Text(UPGRADE_MSG_FAVORITE_FOOD, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 14, color: DARK_PRIMARY_COLOR))

            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(MASTERPIE_YELLOW_COLOR),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserPlanScreen(),
                  ),
                );
              },
              child: const Text(CHECKOUT_PLANS_LABEL, style: TextStyle(fontSize: 13, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),),
          ),
        ],
      );
    },
  );
}
