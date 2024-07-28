


import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/wait_popup.dart';
import 'package:masterpie/feature/user/presentation/screen/register_screen.dart';
import 'package:masterpie/feature/user/presentation/screen/signin_screen.dart';
import 'package:masterpie/util/design/helper_functions/video_player_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../feature/foods/domain/model/food_model.dart';
import '../../../feature/foods/presentation/screen/ui_helper/debouncer.dart';
import '../../../feature/user/presentation/screen/user_plan_screen.dart';
import '../../core/constant/api_constant.dart';
import '../../core/constant/messages_constants.dart';
import '../color/app_colors.dart';
import '../size/app_widget_size.dart';
import '../text/app_assets.dart';
import 'package:fraction/fraction.dart';



const MACRO_DIET_GROCERY_VIEWED= 'macro_diet_grocery_viewed';
const MACRO_DIET_RECIPE_VIEWED= 'macro_diet_recipe_viewed';
const MACRO_DIET_MANUAL_VIEWED= 'macro_diet_manual_viewed';
const MACRO_DIET_CALCULATE_BTN_CLICKED= 'macro_diet_calculate_btn_clicked';
const MACRO_DIET_LOG_BTN_CLICKED= 'macro_diet_log_btn_clicked';
const IS_USER= 'isUser';
const VIDEO_CLICKED= 'video_clicked';


const SEARCH_GROCERY_VIEWED= 'search_grocery_viewed';
const SEARCH_RECIPE_VIEWED= 'search_recipe_viewed';
const COOKBOOK_VIEWED= 'cookbook_viewed';
const FAVORITE_VIEWED= 'favorite_viewed';


const PLUS_COOKBOOK_BTN_CLICKED= 'plus_cookbook_btn_clicked';
const ADD_COOKBOOK_BTN_CLICKED= 'add_cookbook_btn_clicked';


const REGISTER_BTN_CLICKED= 'register_btn_clicked';

const MAIN_PAGE_VIEWED_WITHOUT_ACCOUNT= 'main_page_viewed_without_account';


const ASK_LOGIN_POPUP_DISPLAYED= 'ask_login_popup_displayed';
const ASK_LOGIN_POPUP_FROM= 'from';
const MACRO_DIET_REQUEST= 'macro_diet_request';
const ADD_NEW_COOKBOOK_REQUEST= 'add_cookbook_request';
const EDIT_FAT_SECRET_REQUEST= 'edit_fat_secret_request';
const EDIT_RECIPE_REQUEST= 'edit_recipe_request';
const SEARCH_GROCERY_REQUEST= 'search_grocery_request';
const VIEW_RECIPE_REQUEST= 'view_recipe_request';
const CALCUALTE_MACRO_GOAL_REQUEST= 'calculate_macro_goal_request';


List<String> fatSecretMainDishTypes= ['Breakfast', 'Lunch', 'Dinner'];
List<String> fatSecretSideDishTypes= ['Appetizer', 'Beverage', 'Dessert', 'Snack', 'Soup'];





void logEvent(String eventName,  Map<String, Object>? parameters)async{
  await FirebaseAnalytics.instance.logEvent(
    name: eventName,
    parameters: parameters
  );
}


final debouncer = Debouncer(milliseconds: 500);

extension StringExtension on String {
  String capitalize() {
    if(isEmpty){
      return '';
    }
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}


final RegExp numericRegExp = RegExp(r'^\d+\.?\d{0,2}');

String checkNumberType(num number) {
  if (number is int) {
    return 'int';
  } else if (number is double) {
    return 'double';
  } else {
    return '';
  }
}

bool isValidDouble(String input) {
  return double.tryParse(input) != null;
}


bool isValidInteger(String input) {
  return int.tryParse(input) != null;
}

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

  // // Check if the password contains at least one digit
  // if (!password.contains(RegExp(r'\d'))) {
  //   return false;
  // }
  //
  // // Check if the password contains at least one special character
  // if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
  //   return false;
  // }
  //
  // // Check if the password contains both uppercase and lowercase letters
  // if (!password.contains(RegExp(r'[a-z]')) || !password.contains(RegExp(r'[A-Z]'))) {
  //   return false;
  // }

  return true;
}



Future<void> showUpgradePopupForFreeUsers(BuildContext context, String message) async {
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

              Text(message, style: const TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 14, color: DARK_PRIMARY_COLOR))

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
                Navigator.push(
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


Future<void> showOVerLimitPaidUsers(BuildContext context, String message) async {
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

              Image.asset(SAND_CLOCK_PATH, width: SIZE_IMAGE_UPGRADE_PLAN, height: SIZE_IMAGE_UPGRADE_PLAN,),

              const SizedBox(height: 16,),

              Text(message, style: const TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 14, color: DARK_PRIMARY_COLOR))

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


Future<void> launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  }
}

Widget fatSecretAttribute(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      InkWell(
        onTap: () => launchURL(FAT_SECRET_ATTRIBUTE),
        child: const Text(
          FAT_SECRET_LABEL,
          style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.underline,
              fontSize: 10
          ),
        ),
      ),
    ],
  );
}


void showRegisterDialog(BuildContext context, String from) {

  final parameters=  {
    ASK_LOGIN_POPUP_FROM: from,
  };

  logEvent(ASK_LOGIN_POPUP_DISPLAYED, parameters);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(SIGNIN_LABEL, style: TextStyle(fontSize: 15, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LOGIN_MSG, style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),),

            //todo delete this when free plan should be set after registration
            SizedBox(height: 16,),
            Text(
              REGISTER_FOR_PREMIUM_ACCOUNT_MSG,
              style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 12, color: GREEN_COLOR, fontWeight: FontWeight.bold),
            ),

          ],
        ),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(DARK_PRIMARY_COLOR),
            ),
            child: const Text(SIGNIN_LABEL, style: TextStyle(fontSize: 14, color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInScreen(),
                ),
              );
            },
          ),


          //todo delete this when free plan should be set after registration
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(DARK_PRIMARY_COLOR),
            ),
            child: const Text(REGISTER_LABEL, style: TextStyle(fontSize: 14, color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterScreen(),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}

String convertDoubleToFraction(double number) {
  // Convert the double to a Fraction
  final fraction = Fraction.fromDouble(number);

  // Split the fraction into integer part and fractional part
  final intPart = fraction.toMixedFraction().whole;
  final fracPart = fraction - Fraction(intPart);

  // Construct the result string
  if (intPart > 0 && fracPart.numerator > 0) {
    return '$intPart ${fracPart.numerator}/${fracPart.denominator}';
  } else if (intPart > 0) {
    return '$intPart';
  } else {
    return '${fracPart.numerator}/${fracPart.denominator}';
  }
}