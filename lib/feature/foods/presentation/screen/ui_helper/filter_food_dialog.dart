

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../util/core/constant/messages_constants.dart';
import '../../../../../util/design/color/app_colors.dart';
import '../../../../../util/design/text/app_assets.dart';
import 'custom_radio_button.dart';


Future<String> showFoodRequestDialog(BuildContext context, String selectedTypes) async{
  return await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return FilterFoodRequestDialog(selectedFoodRequest: selectedTypes,);
    },
  );
}


class FilterFoodRequestDialog extends StatefulWidget {

  final String selectedFoodRequest;


  const FilterFoodRequestDialog({super.key, required this.selectedFoodRequest}) ;


  @override
  State<FilterFoodRequestDialog> createState() => _FilterFoodRequestDialogState(selectedFoodRequest: selectedFoodRequest);
}

class _FilterFoodRequestDialogState extends State<FilterFoodRequestDialog> {

  String selectedFoodRequest;

  _FilterFoodRequestDialogState({required this.selectedFoodRequest}) ;



  void updateSelectedFoodRequest(String value){
    setState(() {
      selectedFoodRequest= value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(FILTER_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: MONTSERRAT_FONT),),
      /// Filter options
      content: SizedBox(
          height: 180,
          child: CustomRadioListTile(
            options: const [ALL_LABEL, MY_FAVORITE_LABEL],
            onSelectedOptionChanged: updateSelectedFoodRequest,
            selectedOption: selectedFoodRequest,
            orientation: VERTICAL_ORIENTATION,
            isEditable: true,
          )
      ),

      actions: [
        /// Filter button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: DARK_PRIMARY_COLOR
          ),
          child: const Text(FILTER_LABEL, style: TextStyle(color: Colors.white, fontFamily: MONTSERRAT_FONT),),
          onPressed: () {
            Navigator.pop(context, selectedFoodRequest);
          },
        ),
      ]
    );
  }
}
