import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import '../../../../../util/core/constant/messages_constants.dart';
import '../../../../../util/design/color/app_colors.dart';
import '../../../../../util/design/size/app_widget_size.dart';
import '../../../domain/model/food_model.dart';
import '../../../domain/model/food_type.dart';
import '../../../domain/model/food_unit.dart';

class FoodsMacroListUi extends StatefulWidget {

  final Function(int index, bool state, bool isRemove) onExpansionStateChanged;
  final Function(List<Food> foods, List<RangeValues> servingRanges) onFoodsUpdated;
  final List<Food> foods;
  final List<bool> foodsExpansionState;
  final List<RangeValues> foodsServingRanges;


  FoodsMacroListUi({super.key, required this.foods, required this.foodsExpansionState,
    required this.onExpansionStateChanged, required this.onFoodsUpdated, required this.foodsServingRanges});

  @override
  State<FoodsMacroListUi> createState() => _FoodsMacroListUiState();
}

class _FoodsMacroListUiState extends State<FoodsMacroListUi> {

  late TextEditingController _calorieController;
  late TextEditingController _proteinController;
  late TextEditingController _carbController;
  late TextEditingController _fatController;
  late TextEditingController _servingController;
  late TextEditingController _foodNameController;
  late TextEditingController _unitController;

  Color _foodNameBorderColor = DARK_PRIMARY_COLOR;

  RangeValues _servingRangeValues = const RangeValues(SERVING_MIN_DEFAULT, SERVING_MAX_DEFAULT);


  @override
  void initState() {
    super.initState();
    _calorieController= TextEditingController(text: '0');
    _proteinController= TextEditingController(text: '0');
    _carbController= TextEditingController(text: '0');
    _fatController= TextEditingController(text: '0');
    _servingController= TextEditingController(text: '0');
    _foodNameController= TextEditingController(text: '');
    _unitController= TextEditingController(text: GRAM_LABEL);
  }



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.foods.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          String foodName = widget.foods[index].name;
          if(widget.foodsExpansionState[index] ){
            _calorieController= TextEditingController(text: widget.foods[index].calorie[0]);
            _proteinController= TextEditingController(text: widget.foods[index].protein[0]);
            _carbController= TextEditingController(text: widget.foods[index].carb[0]);
            _fatController= TextEditingController(text: widget.foods[index].fat[0]);
            _foodNameController= TextEditingController(text: widget.foods[index].name);
            _servingRangeValues = widget.foodsServingRanges[index];
          }

           _unitController = TextEditingController(text: widget.foods[index].units[0]);
            _servingController = TextEditingController(text: widget.foods[index].servingAmounts[0]);

          return SizedBox(
            width: double.infinity,
            height: widget.foodsExpansionState[index] ? 460 : 70,
            child: GestureDetector(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(BORDER_RADIUS),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: !widget.foodsExpansionState[index],
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                            ),
                            Expanded(
                              child: Text(foodName.capitalize(),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: FONT_SIZE_TITLE, fontWeight: FontWeight.bold),),
                            ),
                            const Spacer(),
                            Text('${widget.foodsServingRanges[index].start} - ${widget.foodsServingRanges[index].end}', style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: FONT_SIZE_TITLE, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Visibility(
                          visible: widget.foodsExpansionState[index],
                        child: Column(
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
                                    onChanged: updatedFoodMacroListener,
                                    controller: _foodNameController,
                                    decoration:  InputDecoration(
                                      hintText: CHEDDAR_CHEESE_LABEL,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: _foodNameBorderColor),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: _foodNameBorderColor),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: _foodNameBorderColor, width: 2),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
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
                                  removeFoodButtonClickListener(index);
                                },
                                child: const Text(REMOVE_LABEL, style: TextStyle( color: Colors.white),),
                              ),
                            ]
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
                  widget.onExpansionStateChanged(index, !widget.foodsExpansionState[index], false);
                });
              },
            )
          );
        }
    );
  }


  void removeFoodButtonClickListener(int index){
    setState(() {
      widget.onExpansionStateChanged(index, !widget.foodsExpansionState[index], true);
      List<Food> foods = List<Food>.from(widget.foods);
      foods.removeAt(index);
      List<RangeValues> servingRanges = List<RangeValues>.from(widget.foodsServingRanges);
      servingRanges.removeAt(index);
      _foodNameBorderColor = Colors.black;
      widget.onFoodsUpdated(foods, servingRanges);
    });
  }


  void updatedFoodMacroListener(String value){
    setState(() {
        int index = 0;
        for (int i = 0; i < widget.foodsExpansionState.length; i++) {
          if(widget.foodsExpansionState[i]){
            index = i;
            break;
          }
        }

        Food updatedFood = Food();
         updatedFood = Food(
            name: _foodNameController.text,
            fat: [_fatController.text],
            carb: [_carbController.text],
            protein: [_proteinController.text],
            calorie: [_calorieController.text],
            servingAmounts: [_servingController.text],
            units: [_unitController.text]
        );
        List<Food> foods = List<Food>.from(widget.foods);
        foods[index] = updatedFood;
        List<RangeValues> servingRanges = List<RangeValues>.from(widget.foodsServingRanges);
        servingRanges[index] = _servingRangeValues;
        _foodNameBorderColor = Colors.black;
        widget.onFoodsUpdated(foods, servingRanges);
      });
  }



  Widget macroAmountsWidgets(int index){
    return Column(
      children: [
        ///  serving + unit
        Row(
          children: [
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$SERVING_AMOUNT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                enabled: false,
                onChanged: updatedFoodMacroListener,
                controller: _servingController,
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
            const SizedBox(width: 20,),
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$UNIT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                style: const TextStyle(fontSize: 11),
                onChanged: updatedFoodMacroListener,
                controller: _unitController,
                enabled: false,
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
                onChanged: updatedFoodMacroListener,
                controller: _calorieController,
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
                onChanged: updatedFoodMacroListener,
                controller: _proteinController,
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
                onChanged: updatedFoodMacroListener,
                controller: _carbController,
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
                onChanged: updatedFoodMacroListener,
                controller: _fatController,
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


        const SizedBox(height: 48,),

        /// how many serving?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('$SERVINGS_RANGE:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),
            const SizedBox(height: 12,),
            servingRange(index)
          ],
        ),
      ],
    );
  }


  Widget servingRange(int index){
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: Row(
        children: [
          SizedBox(
              width: 30,
              child: Text(_servingRangeValues.start.toStringAsFixed(1), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),)
          ),
          RangeSlider(
            values: widget.foodsServingRanges[index],
            min: SERVING_MIN,
            max: SERVING_MAX,
            activeColor: DARK_PRIMARY_COLOR, // Set the active color here
            inactiveColor: Colors.grey,
            divisions: SERVING_DEVISION,
            onChanged: (values) {
              setState(() {
                _servingRangeValues = values;
                updatedFoodMacroListener('');
              });
            },
          ),
          SizedBox(
              width: 30,
              child: Text(_servingRangeValues.end.toStringAsFixed(1), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),)
          ),
        ],
      ),
    );
  }


}
