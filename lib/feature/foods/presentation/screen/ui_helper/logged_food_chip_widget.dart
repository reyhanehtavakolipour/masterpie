import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masterpie/util/design/color/app_colors.dart';
import 'package:masterpie/util/design/text/app_assets.dart';

class ChipWidget extends StatelessWidget {
  final String text;
  final Function onRemove;

  ChipWidget({required this.text, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.white,
      label: Text(text, style: const TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 12, color: DARK_PRIMARY_COLOR),),
      deleteIcon: const Icon(Icons.cancel, color: DARK_PRIMARY_COLOR,),
      onDeleted: () {
        onRemove();
      },
    );
  }
}