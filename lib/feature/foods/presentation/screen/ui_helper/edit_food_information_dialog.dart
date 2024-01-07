

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../util/core/constant/messages_constants.dart';
import '../../../../../util/design/color/app_colors.dart';
import '../../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../../util/design/text/app_assets.dart';
import '../../../domain/model/food_type.dart';
import '../../../domain/model/food_unit.dart';
import 'model/edit_food_info_ui_model.dart';


Future<ServingMacroDialogValues> showEditServingAndCalorieDialog(BuildContext context, FoodType foodType, String serving, String foodUnit, String calorie, String protein, String carb, String fat) async{
  return await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      /**
       * textField1: serving
       * textField2: calorie
       * textField3: protein
       * textField4: carb
       * textField5: fat
       */
      return EditFoodInfoDialog(
        foodInfoDialog: FoodInfoDialog.servingAndCalorie,
        foodType: foodType,
        textField1: serving,
        textField2: calorie,
        textField3: protein,
        textField4: carb,
        textField5: fat,
        foodUnit: foodUnit,
      );
    },
  );
}

Future<TotalMacroDialogValues> showEditTotalCalorieDialog(BuildContext context, FoodType foodType, String quantity, String totalCalorie, String totalProtein, String totalCarb, String totalFat) async{
  return await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      /**
       * textField1: quantity
       * textField2: total calorie
       * textField3: total protein
       * textField4: total carb
       * textField5: total fat
       */
      return EditFoodInfoDialog(
        foodInfoDialog: FoodInfoDialog.quantityAndTotalCalorie,
        foodType: foodType,
        textField1: quantity,
        textField2: totalCalorie,
        textField3: totalProtein,
        textField4: totalCarb,
        textField5: totalFat,
        foodUnit: GRAM_LABEL,
      );
    },
  );
}






class EditFoodInfoDialog extends StatefulWidget {

  final String textField1;
  final String textField2;
  final String textField3;
  final String textField4;
  final String textField5;
  final String foodUnit;
  final FoodInfoDialog foodInfoDialog;
  final FoodType foodType;

  const EditFoodInfoDialog({
    Key? key,
    required this.foodInfoDialog,
    required this.foodType,
    required this.textField1,
    required this.textField2,
    required this.textField3,
    required this.textField4,
    required this.textField5,
    required this.foodUnit
  }) : super(key: key);

  @override
  _EditFoodInfoDialogState createState() => _EditFoodInfoDialogState(this.foodInfoDialog, this.foodType, this.textField1, this.textField2, this.textField3, this.textField4, this.textField5, this.foodUnit);
}



class _EditFoodInfoDialogState extends State<EditFoodInfoDialog> {
  bool _isSaveToFavoriteChecked = false;
  final String textField1;
  final String textField2;
  final String textField3;
  final String textField4;
  final String textField5;
  final String foodUnit;
  final FoodType foodType;
  final FoodInfoDialog foodInfoDialog;

  late TextEditingController _textField1Controller;
  late TextEditingController _textField2Controller;
  late TextEditingController _textField3Controller;
  late TextEditingController _textField4Controller;
  late TextEditingController _textField5Controller;
  late String _selectedUnit;



  @override
  void initState() {
    super.initState();
    _textField1Controller = TextEditingController(text: textField1);
    _textField2Controller = TextEditingController(text: textField2);
    _textField3Controller = TextEditingController(text: textField3);
    _textField4Controller = TextEditingController(text: textField4);
    _textField5Controller = TextEditingController(text: textField5);
    _selectedUnit= foodUnit;
  }


  _EditFoodInfoDialogState(this.foodInfoDialog, this.foodType,  this.textField1, this.textField2, this.textField3, this.textField4, this.textField5, this.foodUnit);

  @override
  Widget build(BuildContext context) {
    bool isServing= false;
    if(foodInfoDialog == FoodInfoDialog.servingAndCalorie){
      isServing = true;
    }else{
      isServing = false;
    }
    return AlertDialog(
      title: const Text(EDIT_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: MONTSERRAT_FONT),),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          ///edit text field 1
          Row(
            children: [
              Visibility(visible: isServing, child:  Text('${SERVING_LABEL.capitalize()}:', style: const TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 13, fontFamily: MONTSERRAT_FONT),)),
              Visibility(visible: !isServing, child: const Text('$QUANTITY_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 13, fontFamily: MONTSERRAT_FONT),)),
              const SizedBox(width: 12,),
              Expanded(
                child: TextField(
                  controller: _textField1Controller,
                  style: const TextStyle(fontFamily: MONTSERRAT_FONT),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.allow(numericRegExp),
                  ],
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  ),
                ),
              ),

              /// food unit drop down
              Expanded(
                child: Visibility(
                    visible: isServing,
                    child: Container(
                      margin: const EdgeInsets.only(left: 4),

                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        child: SizedBox(
                          width: 80,
                          height: 45,
                          child: DropdownButtonFormField<String?>(
                            value: _selectedUnit.isNotEmpty ? _selectedUnit : GRAM_LABEL,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                            focusColor: PRIMARY_COLOR,
                            items: foodUnitDropDownItems.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item, style: const TextStyle(fontFamily: MONTSERRAT_FONT),),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedUnit = newValue ?? GRAM_LABEL;
                              });
                            },
                      ),
                    ),
                  )
                ),
                ),
              )
            ],
          ),


          const SizedBox(height: 16,),


          ///edit text field 2
          Row(
            children: [
              Visibility(visible: isServing, child: const Text('$CALORIE_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 13, fontFamily: MONTSERRAT_FONT),)),
              Visibility(visible: !isServing, child: const Text('$TOTAL_CALORIE_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 13, fontFamily: MONTSERRAT_FONT),)),
              const SizedBox(width: 12,),
              Expanded(
                child: TextField(
                  controller: _textField2Controller,
                  style: const TextStyle(fontFamily: MONTSERRAT_FONT),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.allow(numericRegExp),
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16,),

          ///edit text field 3
          Row(
            children: [
              Visibility(visible: isServing, child: const Text('$PROTEIN_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 13, fontFamily: MONTSERRAT_FONT),)),
              Visibility(visible: !isServing, child: const Text('$TOTAL_PROTEIN_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 13, fontFamily: MONTSERRAT_FONT),)),
              const SizedBox(width: 12,),
              Expanded(
                child: TextField(
                  controller: _textField3Controller,
                  style: const TextStyle(fontFamily: MONTSERRAT_FONT),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.allow(numericRegExp),
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16,),

          ///edit text field 4
          Row(
            children: [
              Visibility(visible: isServing, child: const Text('$CARB_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 13, fontFamily: MONTSERRAT_FONT),)),
              Visibility(visible: !isServing, child: const Text('$TOTAL_CARB_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 13, fontFamily: MONTSERRAT_FONT),)),
              const SizedBox(width: 12,),
              Expanded(
                child: TextField(
                  controller: _textField4Controller,
                  style: const TextStyle(fontFamily: MONTSERRAT_FONT),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.allow(numericRegExp),
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16,),


          ///edit text field 5
          Row(
            children: [
              Visibility(visible: isServing, child: const Text('$FAT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 13, fontFamily: MONTSERRAT_FONT),)),
              Visibility(visible: !isServing, child: const Text('$TOTAL_FAT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 13, fontFamily: MONTSERRAT_FONT),)),
              const SizedBox(width: 12,),
              Expanded(
                child: TextField(
                  controller: _textField5Controller,
                  style: const TextStyle(fontFamily: MONTSERRAT_FONT),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.allow(numericRegExp),
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  ),
                ),
              ),
            ],
          ),



          /// save to favorite check box
          Visibility(
            visible: foodType == FoodType.groceryProduct,
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    activeColor: DARK_PRIMARY_COLOR,
                    checkColor: DARK_PRIMARY_COLOR,
                    value: _isSaveToFavoriteChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isSaveToFavoriteChecked = value!;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text(
                      SAVE_TO_FAVORITE,
                      style: TextStyle(fontSize: 12, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontFamily: MONTSERRAT_FONT),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
      actions: [

        /// use this calorie today button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: DARK_PRIMARY_COLOR
          ),
          child: const Text(USE_THIS_CALORIE_TODAY, style: TextStyle(color: Colors.white, fontFamily: MONTSERRAT_FONT),),
          onPressed: () {
            if(foodInfoDialog == FoodInfoDialog.servingAndCalorie){
              final values = ServingMacroDialogValues(
                serving: int.parse(_textField1Controller.text),
                calorie: [_textField2Controller.text],
                protein: [_textField3Controller.text],
                carb: [_textField4Controller.text],
                fat: [_textField5Controller.text],
                unit: _selectedUnit,
                shouldSaveToFavorites: _isSaveToFavoriteChecked
              );
              Navigator.pop(context, values);
            }else{
              final values = TotalMacroDialogValues(
                quantity: double.parse(_textField1Controller.text),
                totalCalorie: [_textField2Controller.text],
                totalProtein: [_textField3Controller.text],
                totalCarb: [_textField4Controller.text],
                totalFat: [_textField5Controller.text],
                shouldSaveToFavorites: _isSaveToFavoriteChecked
              );
              Navigator.pop(context, values);
            }
          },
        ),


      ],
    );
  }
}