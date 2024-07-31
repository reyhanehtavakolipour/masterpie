import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';







class ManualMealMacroForWizardDialog extends StatefulWidget {

  final Function(String mealName, List<String> macros, String type, int index) onAddMealBtnClicked;

  final String type;
  final int index;


  final Function(String type, int index) onSearchRecipeClicked;

  final Function(String type, int index) onSearchGroceryClicked;

  final Function(String type, int index) onCreateManualClickedClicked;


  const ManualMealMacroForWizardDialog({super.key, required this.onAddMealBtnClicked, required this.type, required this.index,
      required this.onSearchRecipeClicked, required this.onSearchGroceryClicked, required this.onCreateManualClickedClicked});

  @override
  State<ManualMealMacroForWizardDialog> createState() => _ManualMealMacroForWizardDialogState();
}


class _ManualMealMacroForWizardDialogState extends State<ManualMealMacroForWizardDialog> {


  TextEditingController _mealNameController = TextEditingController();


  TextEditingController _calorieController = TextEditingController();
  TextEditingController _proteinController = TextEditingController();
  TextEditingController _carbController = TextEditingController();
  TextEditingController _fatController = TextEditingController();


  String _selectedAdvanceOptions= ADVANCED_LABEL;



  @override
  void initState() {
    super.initState();
    _calorieController = TextEditingController();
    _proteinController = TextEditingController();
    _carbController = TextEditingController();
    _fatController = TextEditingController();
    _mealNameController = TextEditingController();

  }


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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: CATEGORY_COLOR,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: const Text(
              MEAL_LABEL,
              style: TextStyle(
                fontSize: 14.0,
                color: DARK_PRIMARY_COLOR,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),



          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                /// meal name
                SizedBox(
                  height: 48,
                  child: TextFormField(
                    cursorColor: DARK_PRIMARY_COLOR,
                    controller: _mealNameController,
                    style: const TextStyle(fontSize: 15, color: DARK_PRIMARY_COLOR),
                    decoration: const InputDecoration(
                      labelText: MEAL_NAME,
                      border:  OutlineInputBorder(borderSide: BorderSide(color: DARK_PRIMARY_COLOR),),
                      fillColor: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 16.0),


                /// calorie and protein
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: SizedBox(
                          height: 48,
                          child: TextFormField(
                            cursorColor: DARK_PRIMARY_COLOR,
                            controller: _calorieController,
                            style: const TextStyle(fontSize: 15, color: DARK_PRIMARY_COLOR),
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: const InputDecoration(
                              labelText: '$CALORIE_LABEL(cal)',
                              border:  OutlineInputBorder(borderSide: BorderSide(color: DARK_PRIMARY_COLOR),),
                              fillColor: Colors.white,
                            ),
                          ),
                        )
                    ),

                    const SizedBox(width: 16.0),

                    Expanded(
                        child: SizedBox(
                          height: 48,
                          child: TextFormField(
                            cursorColor: DARK_PRIMARY_COLOR,
                            controller: _proteinController,
                            style: const TextStyle(fontSize: 15, color: DARK_PRIMARY_COLOR),
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: const InputDecoration(
                              labelText: '$PROTEIN_LABEL(g)',
                              border:  OutlineInputBorder(borderSide: BorderSide(color: DARK_PRIMARY_COLOR),),
                              fillColor: Colors.white,
                            ),
                          ),
                        )
                    ),
                  ],
                ),


                const SizedBox(height: 16.0),


                /// carb and fat
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: SizedBox(

                          height: 48,
                          child: TextFormField(
                            cursorColor: DARK_PRIMARY_COLOR,
                            style: const TextStyle(fontSize: 15, color: DARK_PRIMARY_COLOR),
                            controller: _carbController,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: const InputDecoration(
                              labelText: '$CARB_LABEL(g)',
                              border:  OutlineInputBorder(borderSide: BorderSide(color: DARK_PRIMARY_COLOR),),
                              fillColor: Colors.white,
                            ),
                          ),
                        )
                    ),

                    const SizedBox(width: 16.0),


                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: TextFormField(
                          cursorColor: DARK_PRIMARY_COLOR,
                          controller: _fatController,
                          style: const TextStyle(fontSize: 15, color: DARK_PRIMARY_COLOR),
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: const InputDecoration(
                            labelText: '$FAT_LABEL(g)',
                            border:  OutlineInputBorder(borderSide: BorderSide(color: DARK_PRIMARY_COLOR),),
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


                const SizedBox(height: 16.0),


                /// save button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      if(_mealNameController.text.isEmpty || _proteinController.text.isEmpty ||
                          _calorieController.text.isEmpty || _carbController.text.isEmpty || _fatController.text.isEmpty){
                        showErrorToast(context, FILL_ALL_ERROR);
                      }else{
                        widget.onAddMealBtnClicked(_mealNameController.text,
                            [_calorieController.text, _proteinController.text, _carbController.text, _fatController.text], widget.type, widget.index);
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: DARK_PRIMARY_COLOR
                    ),
                    child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(ADD_MEAL, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                    ),
                  ),
                ),

                const SizedBox(height: 6,),


                SizedBox(
                  height: 45,
                  child: DropdownButtonFormField<String?>(
                    value: _selectedAdvanceOptions,
                    icon: Container(),
                    isDense: true,
                    isExpanded: false,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    ),
                    focusColor: PRIMARY_COLOR,
                    items: [ADVANCED_LABEL, SEARCH_RECIPE_LABEL, SEARCH_GROCERY_LABEL, CREATE_MANUAL_FROM_SCRATCH].map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item, style: const TextStyle(color: Colors.grey, fontSize: 12), textAlign: TextAlign.end,),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if(newValue == SEARCH_RECIPE_LABEL){
                        Navigator.pop(context);
                        widget.onSearchRecipeClicked(widget.type, widget.index);
                      }else if(newValue == SEARCH_GROCERY_LABEL){
                        Navigator.pop(context);
                        widget.onSearchGroceryClicked(widget.type, widget.index);
                      }else if(newValue == CREATE_MANUAL_FROM_SCRATCH){
                        Navigator.pop(context);
                        widget.onCreateManualClickedClicked(widget.type, widget.index);
                      }
                    },

                  ),
                ),





                const SizedBox(height: 8,),

              ],
            ),
          )
        ],
      ),
    );
  }


}