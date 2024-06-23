import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import '../../../../../main_screen.dart';
import '../../../../../util/core/constant/messages_constants.dart';
import '../../../../../util/design/color/app_colors.dart';
import '../../../../../util/design/size/app_widget_size.dart';
import '../../../domain/model/food_model.dart';
import '../../../domain/model/food_type.dart';
import '../../../domain/model/food_unit.dart';
import 'debouncer.dart';

class FoodsMacroListUi extends StatefulWidget {

  final Function(int index, bool state, bool isRemove, RangeValues rangeValues) onExpansionStateChanged;
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
  final _debouncer = Debouncer(milliseconds: 1000);

  Color _foodNameBorderColor = DARK_PRIMARY_COLOR;

  late TextEditingController _minServingController;
  late TextEditingController _maxServingController;

  @override
  void initState() {
    super.initState();
    _calorieController= TextEditingController(text: '0');
    _proteinController= TextEditingController(text: '0');
    _carbController= TextEditingController(text: '0');
    _fatController= TextEditingController(text: '0');
    _servingController= TextEditingController(text: '0');
    _minServingController= TextEditingController(text: WIZARD_MIN_SERVING);
    _maxServingController= TextEditingController(text: WIZARD_MAX_SERVING);
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
            _minServingController.text= widget.foodsServingRanges[index].start.toString();
            _maxServingController.text= widget.foodsServingRanges[index].end.toString();
            if(widget.foods[index].foodType == FoodType.groceryProduct){
              _calorieController= TextEditingController(text: widget.foods[index].calorie[0]);
              _proteinController= TextEditingController(text: widget.foods[index].protein[0]);
              _carbController= TextEditingController(text: widget.foods[index].carb[0]);
              _fatController= TextEditingController(text: widget.foods[index].fat[0]);
              _unitController = TextEditingController(text: widget.foods[index].units[0]);
            }else{


              double calorie = 0;
              for (int i = 0; i < widget.foods[index].calorie.length; i++) {
                if (i < widget.foods[index].servingIngredientsCount.length) {
                  double servingCount = double.parse(
                      widget.foods[index].servingIngredientsCount[i].isEmpty ? '0' : widget.foods[index].servingIngredientsCount[i]);
                  calorie = calorie + double.parse(widget.foods[index].calorie[i].isEmpty ? '0' : widget.foods[index].calorie[i]) * servingCount;
                }
              }

              double protein = 0;
              for (int i = 0; i < widget.foods[index].protein.length; i++) {
                if (i < widget.foods[index].servingIngredientsCount.length) {
                  double servingCount = double.parse(widget.foods[index].servingIngredientsCount[i].isEmpty ? '0' : widget.foods[index].servingIngredientsCount[i]);
                  protein = protein + double.parse(widget.foods[index].protein[i].isEmpty ? '0' : widget.foods[index].protein[i]) * servingCount;
                }
              }

              double carb = 0;
              for (int i = 0; i < widget.foods[index].carb.length; i++) {
                if (i < widget.foods[index].servingIngredientsCount.length) {
                  double servingCount = double.parse(widget.foods[index].servingIngredientsCount[i].isEmpty ? '0' : widget.foods[index].servingIngredientsCount[i]);
                  carb = carb + double.parse(widget.foods[index].carb[i].isEmpty ? '0' : widget.foods[index].carb[i]) * servingCount;
                }
              }


              double fat = 0;
              for (int i = 0; i <
                  widget.foods[index].fat.length; i++) {
                if (i < widget.foods[index].servingIngredientsCount.length) {
                  double servingCount = double.parse(widget.foods[index].servingIngredientsCount[i].isEmpty ? '0' : widget.foods[index].servingIngredientsCount[i]);
                  fat = fat + double.parse(widget.foods[index].fat[i].isEmpty ? '0' : widget.foods[index].fat[i]) * servingCount;
                }
              }


              _calorieController= TextEditingController(text: calorie.toString());
              _proteinController= TextEditingController(text: protein.toString());
              _carbController= TextEditingController(text: carb.toString());
              _fatController= TextEditingController(text: fat.toString());
              _unitController = TextEditingController(text: SERVING_LABEL);
              _servingController = TextEditingController(text: widget.foods[index].servingAmount.toString());

            }



            _foodNameController= TextEditingController(text: widget.foods[index].name);
          }


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
                                    enabled: false,
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
                  widget.onExpansionStateChanged(index, !widget.foodsExpansionState[index], false,
                      RangeValues(double.parse(_minServingController.text.isEmpty ? WIZARD_MIN_SERVING : _minServingController.text),
                          double.parse(_maxServingController.text.isEmpty ? WIZARD_MAX_SERVING : _maxServingController.text)));
                });
              },
            )
          );
        }
    );
  }


  void removeFoodButtonClickListener(int index){
    setState(() {
      widget.onExpansionStateChanged(index, !widget.foodsExpansionState[index], true, RangeValues(double.parse(_minServingController.text), double.parse(_maxServingController.text)));
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
            units: [_unitController.text]
        );
        List<Food> foods = List<Food>.from(widget.foods);
        foods[index] = updatedFood;
        List<RangeValues> servingRanges = List<RangeValues>.from(widget.foodsServingRanges);
        servingRanges[index] = RangeValues(double.parse(_minServingController.text), double.parse(_maxServingController.text));
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
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
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
                enabled: false,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
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
                enabled: false,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
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
                enabled: false,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
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
                enabled: false,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
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
        foodServingRange(index)
      ],
    );
  }

  Widget foodServingRange(int index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('$SERVINGS_RANGE:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

        const SizedBox(height: 16,),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ///min
            const Text(MIN_LABEL, style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: SizedBox(
                  width: 60,
                  height: MACRO_HEIGHT,
                  child: TextField(
                    controller: _minServingController,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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


            const SizedBox(width: 8,),

            ///max
            const Text(MAX_LABEL, style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: SizedBox(
                  width: 60,
                  height: MACRO_HEIGHT,
                  child: TextField(
                    controller: _maxServingController,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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

          ],
        )
      ],
    );
  }


}
