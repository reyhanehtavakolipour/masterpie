
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masterpie/util/design/color/app_colors.dart';
import 'package:masterpie/util/design/text/app_assets.dart';

import '../../../../util/core/constant/messages_constants.dart';

class RecipeTypesPopup extends StatefulWidget {
  final List<String> types;

  RecipeTypesPopup({required this.types});

  @override
  _SelectContainerPopupState createState() => _SelectContainerPopupState();
}

class _SelectContainerPopupState extends State<RecipeTypesPopup> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(SELECT_MEAL_TYPE, style: TextStyle(fontSize: 16, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),),
      content: Container(
        width: double.maxFinite,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2,
          ),
          itemCount: widget.types.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: _selectedIndex == index ? MASTERPIE_YELLOW_COLOR : Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    widget.types[index],
                    style: TextStyle(color: _selectedIndex == index ? DARK_PRIMARY_COLOR : Colors.white , fontSize: 13, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_selectedIndex);
          },
          child: const Text(SUBMIT_LABEL, style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontFamily: MONTSERRAT_FONT, fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
}