import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masterpie/feature/foods/domain/model/food_unit.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import '../../../../../util/core/constant/messages_constants.dart';
import '../../../../../util/design/color/app_colors.dart';
import '../../../../../util/design/size/app_widget_size.dart';
import '../../../domain/model/food_model.dart';

class RecipeIngredientsListUi extends StatefulWidget {

  final Function(int index, bool state, bool isRemove) onExpansionStateChanged;
  final Function(GenericFood food, List<int> selectedIngredientsUnitIndex) onIngredientUpdated;
  final GenericFood meal;
  final List<bool> ingredientsExpansionState;
  final Function(int index, double count) onServingCountChangeRequested;
  final List<String> ingredients;
  final List<int> selectedIngredientsUnitIndexList;

  RecipeIngredientsListUi({super.key, required this.meal, required this.ingredientsExpansionState,
    required this.onExpansionStateChanged, required this.onIngredientUpdated, required this.onServingCountChangeRequested,
    required this.ingredients, required this.selectedIngredientsUnitIndexList});

  @override
  State<RecipeIngredientsListUi> createState() => _RecipeIngredientsListUiState();
}

class _RecipeIngredientsListUiState extends State<RecipeIngredientsListUi> {

  late TextEditingController _calorieController;
  late TextEditingController _proteinController;
  late TextEditingController _carbController;
  late TextEditingController _fatController;
  late TextEditingController _servingController;
  late TextEditingController _ingredientNameController;
  late TextEditingController _ingredientServingCountController;


  Color _ingredientNameBorderColor = DARK_PRIMARY_COLOR;


  List<Food> _suggestedGroceries = [];


  @override
  void initState() {
    super.initState();
    _calorieController= TextEditingController(text: '0');
    _proteinController= TextEditingController(text: '0');
    _carbController= TextEditingController(text: '0');
    _fatController= TextEditingController(text: '0');
    _servingController= TextEditingController(text: '0');
    _ingredientNameController= TextEditingController(text: '');
    _ingredientServingCountController= TextEditingController(text: '1.0');
  }



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.meal.ingredients.length,
        itemBuilder: (context, index){
          String ingredientName = widget.meal.ingredients[index];
          if(widget.ingredientsExpansionState[index] ){
            _calorieController.text = widget.meal.calorie[index][widget.selectedIngredientsUnitIndexList[index]];
            _proteinController.text = widget.meal.protein[index][widget.selectedIngredientsUnitIndexList[index]];
            _carbController.text = widget.meal.carb[index][widget.selectedIngredientsUnitIndexList[index]];
            _fatController.text = widget.meal.fat[index][widget.selectedIngredientsUnitIndexList[index]];
            _servingController.text = widget.meal.servingAmounts[index][widget.selectedIngredientsUnitIndexList[index]];
            _ingredientNameController.text = widget.meal.ingredients[index];
            _ingredientServingCountController.text = widget.meal.servingIngredientsCount[index][0];
          }

          return SizedBox(
              width: double.infinity,
              height: widget.ingredientsExpansionState[index] ? 420 : 70,
              child: GestureDetector(
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(BORDER_RADIUS),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: !widget.ingredientsExpansionState[index],
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.arrow_right,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  child: Text(
                                    ingredientName.capitalize(),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: FONT_SIZE_TITLE, fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: widget.ingredientsExpansionState[index],
                            child: Stack(
                              children: [
                                Column(
                                  children: [

                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                        Container(
                                          width: 260,
                                          child: TextField(
                                            onChanged: updatedIngredientMacroListener,
                                            controller: _ingredientNameController,
                                            decoration:  InputDecoration(
                                              hintText: CHEDDAR_CHEESE_LABEL,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(color: _ingredientNameBorderColor),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: _ingredientNameBorderColor),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: _ingredientNameBorderColor, width: 2),
                                              ),
                                              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 16,),

                                    macroAmountsWidgets(index),

                                    const SizedBox(height: 16,),


                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(RED_ERROR_COLOR),
                                            ),
                                            onPressed: () {
                                              removeIngredientButtonClickListener(index);
                                            },
                                            child: const Text(REMOVE_LABEL, style: TextStyle( color: Colors.white),),
                                          ),
                                        ]
                                    ),

                                  ],
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ),
                onTap: (){
                  setState(() {
                    widget.onExpansionStateChanged(index, !widget.ingredientsExpansionState[index], false);
                  });
                },
              )
          );
        }
    );
  }


  Widget ingredientUnitDropDown(int ingredientIndex){
    final dropDownList = widget.meal.units[ingredientIndex];
    return  SizedBox(
      width: MACRO_DROP_DOWN_WIDTH,
      height: MACRO_DROP_DOWN_HEIGHT,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            isExpanded: true,
            value: dropDownList[widget.selectedIngredientsUnitIndexList[ingredientIndex]],
            items: dropDownList.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: const TextStyle(fontSize: 12),),
              );
            }).toList(),
            onChanged: (String? newValue){
              setState(() {
                int selectedIndex = 0;
                for (int i = 0; i < dropDownList.length; i++){
                  if(newValue.toString() == dropDownList[i]){
                    selectedIndex = i;
                  }
                }
                List<int> selectedUnitList = widget.selectedIngredientsUnitIndexList;
                selectedUnitList[ingredientIndex]= selectedIndex;
                widget.onIngredientUpdated(widget.meal, selectedUnitList);

                _servingController = TextEditingController(text: widget.meal.servingAmounts[ingredientIndex][widget.selectedIngredientsUnitIndexList[ingredientIndex]].toString());
                _calorieController = TextEditingController(text: widget.meal.calorie[ingredientIndex][widget.selectedIngredientsUnitIndexList[ingredientIndex]].toString());
                _proteinController = TextEditingController(text: widget.meal.protein[ingredientIndex][widget.selectedIngredientsUnitIndexList[ingredientIndex]].toString());
                _carbController = TextEditingController(text: widget.meal.carb[ingredientIndex][widget.selectedIngredientsUnitIndexList[ingredientIndex]].toString());
                _fatController = TextEditingController(text: widget.meal.fat[ingredientIndex][widget.selectedIngredientsUnitIndexList[ingredientIndex]].toString());

              });
            },
            // style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }


  void removeIngredientButtonClickListener(int index){
    setState(() {
      widget.onExpansionStateChanged(index, !widget.ingredientsExpansionState[index], true);
      List<String> ingredients = List<String>.from(widget.meal.ingredients);
      ingredients.removeAt(index);
      List<List<String>> servingIngredientsCount = List<List<String>>.from(widget.meal.servingIngredientsCount);
      servingIngredientsCount.removeAt(index);
      List<List<String>> ingredientsUnit = List<List<String>>.from(widget.meal.units);
      ingredientsUnit.removeAt(index);
      List<List<String>> ingredientsServingAmount = List<List<String>>.from(widget.meal.servingAmounts);
      ingredientsServingAmount.removeAt(index);
      List<List<String>> ingredientsCalorie = List<List<String>>.from(widget.meal.calorie);
      ingredientsCalorie.removeAt(index);
      List<List<String>> ingredientsProtein = List<List<String>>.from(widget.meal.protein);
      ingredientsProtein.removeAt(index);
      List<List<String>> ingredientsCarb = List<List<String>>.from(widget.meal.carb);
      ingredientsCarb.removeAt(index);
      List<List<String>> ingredientsFat = List<List<String>>.from(widget.meal.fat);
      ingredientsFat.removeAt(index);
      GenericFood updatedFood = GenericFood(
          ingredients: ingredients,
          servingIngredientsCount: servingIngredientsCount,
          fat: ingredientsFat,
          carb: ingredientsCarb,
          protein: ingredientsProtein,
          calorie: ingredientsCalorie,
          servingAmounts: ingredientsServingAmount,
          units: ingredientsUnit
      );
      _ingredientNameBorderColor = Colors.black;
      widget.onIngredientUpdated(updatedFood, widget.selectedIngredientsUnitIndexList);
    });
  }



  void updatedIngredientMacroListener(String value){
    setState(() {
        int index = 0;
        for (int i = 0; i < widget.ingredientsExpansionState.length; i++) {
          if(widget.ingredientsExpansionState[i]){
            index = i;
            break;
          }
        }
        List<String> ingredients = List<String>.from(widget.meal.ingredients);
        ingredients[index]= _ingredientNameController.text;
        List<List<String>> servingIngredientsCount = List<List<String>>.from(widget.meal.servingIngredientsCount);
        servingIngredientsCount[index]= [_ingredientServingCountController.text];
        List<List<String>> ingredientsUnit = List<List<String>>.from(widget.meal.units);
        List<List<String>> ingredientsServingAmount = List<List<String>>.from(widget.meal.servingAmounts);
        ingredientsServingAmount[index][widget.selectedIngredientsUnitIndexList[index]]= _servingController.text;
        List<List<String>> ingredientsCalorie = List<List<String>>.from(widget.meal.calorie);
        ingredientsCalorie[index][widget.selectedIngredientsUnitIndexList[index]]= _calorieController.text;
        List<List<String>> ingredientsProtein = List<List<String>>.from(widget.meal.protein);
        ingredientsProtein[index][widget.selectedIngredientsUnitIndexList[index]]= _proteinController.text;
        List<List<String>> ingredientsCarb = List<List<String>>.from(widget.meal.carb);
        ingredientsCarb[index][widget.selectedIngredientsUnitIndexList[index]]= _carbController.text;
        List<List<String>> ingredientsFat = List<List<String>>.from(widget.meal.fat);
        ingredientsFat[index][widget.selectedIngredientsUnitIndexList[index]]= _fatController.text;
        GenericFood updatedFood = GenericFood(
          ingredients: ingredients,
          servingIngredientsCount: servingIngredientsCount,
          fat: ingredientsFat,
          carb: ingredientsCarb,
          protein: ingredientsProtein,
          calorie: ingredientsCalorie,
          servingAmounts: ingredientsServingAmount,
          units: ingredientsUnit
        );

        _ingredientNameBorderColor = Colors.black;
        widget.onIngredientUpdated(updatedFood, widget.selectedIngredientsUnitIndexList);
      });
  }



  Widget macroAmountsWidgets(int index){
    return Column(
      children: [
        ///  serving + unit
        Row(
          children: [
            // const SizedBox(
            //     width: MACRO_TITLE_WIDTH,
            //     child: Text('$SERVING_AMOUNT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            // ),
            // const SizedBox(width: 4,),
            // SizedBox(
            //   width: MACRO_WIDTH,
            //   height: MACRO_HEIGHT,
            //   child: TextField(
            //     enabled: false,
            //     onChanged: updatedIngredientMacroListener,
            //     controller: _servingController,
            //     keyboardType: const TextInputType.numberWithOptions(decimal: true),
            //     inputFormatters: <TextInputFormatter>[
            //       FilteringTextInputFormatter.allow(numericRegExp),
            //     ],
            //     decoration: const InputDecoration(
            //       border: OutlineInputBorder(
            //         borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
            //       ),
            //       contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            //     ),
            //   ),
            // ),
            // const SizedBox(width: 28,),
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$UNIT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),


            ingredientUnitDropDown(index),

          ],
        ),
        const SizedBox(height: 4,),

        /// total calorie + protein
        Row(
          children: [
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$CALORIE_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                onChanged: updatedIngredientMacroListener,
                controller: _calorieController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
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
            const SizedBox(width: 20,),
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$PROTEIN_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                onChanged: updatedIngredientMacroListener,
                controller: _proteinController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
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

        const SizedBox(height: 12,),

        /// total carb + fat
        Row(
          children: [
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$CARB_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                onChanged: updatedIngredientMacroListener,
                controller: _carbController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
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
            const SizedBox(width: 20,),
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$FAT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                onChanged: updatedIngredientMacroListener,
                controller: _fatController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
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


        const SizedBox(height: 48,),

        /// how many serving?
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('$HOW_MANY_SERVINGS:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

            const SizedBox(width: 16,),
            Visibility(
              child: GestureDetector(
                child: const CircleAvatar(
                  radius: 14,
                  backgroundColor: DARK_PRIMARY_COLOR,
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
                onTap: (){
                  setState(() {
                    if(double.parse(_ingredientServingCountController.text) >= STEP_AMOUNT){
                      widget.onServingCountChangeRequested(index, double.parse(_ingredientServingCountController.text) - STEP_AMOUNT);
                    }
                  });
                },

              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: SizedBox(
                  width: 70,
                  height: MACRO_HEIGHT,
                  child: TextField(
                    controller: _ingredientServingCountController,
                    onChanged: updatedIngredientMacroListener,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(numericRegExp),
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: PRIMARY_COLOR),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: PRIMARY_COLOR),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: PRIMARY_COLOR, width: 2),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    ),
                  ),
                )
            ),
            Visibility(
              child: GestureDetector(
                child: const CircleAvatar(
                  radius: 14,
                  backgroundColor: DARK_PRIMARY_COLOR,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                onTap: (){
                  setState(() {
                    widget.onServingCountChangeRequested(index, double.parse(_ingredientServingCountController.text) + STEP_AMOUNT);
                  });
                },
              ),
            ),
          ],
          ),
      ],
    );
  }


}
