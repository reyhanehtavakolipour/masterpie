


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/getwidget.dart';

import '../color/app_colors.dart';
import '../size/app_widget_size.dart';

Widget showErrorToast(BuildContext context, String message){
  return  Container(
    child:GFToast.showToast(
        message,
        context,
        toastPosition: GFToastPosition.BOTTOM,
        textStyle: const TextStyle(fontSize: TITLE_FONT_SIZE, color: Colors.white),
        backgroundColor: DARK_PRIMARY_COLOR,
        toastBorderRadius: BORDER_RADIUS,
        trailing: const Icon(
          Icons.error,
          color: Colors.red,
        )
    ),
  );
}



Widget showSuccessToast(BuildContext context, String message){
  return  Container(
    child:GFToast.showToast(
        message,
        context,
        toastPosition: GFToastPosition.BOTTOM,
        textStyle: const TextStyle(fontSize: TITLE_FONT_SIZE, color: Colors.white),
        backgroundColor: DARK_PRIMARY_COLOR,
        toastBorderRadius: BORDER_RADIUS,
        trailing: const Icon(
          Icons.check,
          color: Colors.green,
        )
    ),
  );
}