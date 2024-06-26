import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/generic_grocery_detail_macro_wizard_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/request_wizard_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/unit_options.dart';
import '../../../../main_screen.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../domain/model/food_model.dart';
import '../../domain/model/food_type.dart';




class EditGroceryForMacroWizardScreen extends StatefulWidget {

  final GenericGroceryDetailForMacroWizardArgumentModel genericGroceryDetailForMacroWizardArgumentModel;

  const EditGroceryForMacroWizardScreen({super.key, required this.genericGroceryDetailForMacroWizardArgumentModel});

  @override
  State<EditGroceryForMacroWizardScreen> createState() => _EditGroceryForMacroWizardScreenState();
}

class _EditGroceryForMacroWizardScreenState extends State<EditGroceryForMacroWizardScreen> {

  /// for whole meal OR grocery,
   /// groceries: the first(the only item in the list) element is the value
   late TextEditingController _totalCalorieController;
   late TextEditingController _totalProteinController;
   late TextEditingController _totalCarbController;
   late TextEditingController _totalFatController;
   late TextEditingController _totalServingController;
   late TextEditingController _totalUnitController;
   GenericFood _initialStateFood = GenericFood();

   Color _ingredientNameBorderColor = DARK_PRIMARY_COLOR;

   late TextEditingController _groceryNameController;

   late TextEditingController _minServingController;
   late TextEditingController _maxServingController;


   int _selectedUnitIndex = 0;
   List<String> _groceryUnitOptions = manualUnitOptions;

   GenericFood newFood = GenericFood();



  @override
  void initState() {
    super.initState();
    _minServingController= TextEditingController(text: WIZARD_MIN_SERVING);
    _maxServingController= TextEditingController(text: WIZARD_MAX_SERVING);
    _totalCalorieController= TextEditingController(text: '0');
    _totalProteinController= TextEditingController(text: '0');
    _totalCarbController= TextEditingController(text: '0');
    _totalFatController= TextEditingController(text: '0');
    _totalServingController= TextEditingController(text: '100');
    _totalUnitController= TextEditingController(text: 'g');
    _groceryNameController= TextEditingController();
    init();
  }


   void handleMealMacrosWithoutIngredient(){
     if(newFood.foodType == FoodType.meal && newFood.ingredients.isEmpty){
       String calorie= newFood.calorie.isEmpty ? '0.0' : newFood.calorie[0][0];
       String protein= newFood.protein.isEmpty ? '0.0' : newFood.protein[0][0];
       String carb= newFood.carb.isEmpty ? '0.0' : newFood.carb[0][0];
       String fat= newFood.fat.isEmpty ? '0.0' : newFood.fat[0][0];

       _totalCalorieController = TextEditingController(text: calorie);
       _totalProteinController = TextEditingController(text: protein);
       _totalCarbController = TextEditingController(text: carb);
       _totalFatController = TextEditingController(text: fat);
     }
   }

@override
  Widget build(BuildContext context) {
    handleMealMacrosWithoutIngredient();
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(FOOD_DETAIL_LABEL, style: TextStyle(color: Colors.white),),
          backgroundColor: PRIMARY_COLOR,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.white,),
          ),
          actions: [

          ],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  newGrocery(),

                  const SizedBox(height: 16,),


                  const Text('$TOTAL_MACRO_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

                  const SizedBox(height: 16,),

                  /// total macros
                  macroAmountsWidgets(_totalServingController, _totalCalorieController, _totalProteinController, _totalCarbController, _totalFatController, _totalUnitController, true),


                  const SizedBox(height: 48,),



                  foodServingRange(),

                  const SizedBox(height: 16,),

                  buildAddFoodButton(context),
                ],
              ),
            )
        ),
      ),
    );
  }


  void init(){
    _groceryNameController.text = widget.genericGroceryDetailForMacroWizardArgumentModel.food!.name;
    _totalCalorieController.text = widget.genericGroceryDetailForMacroWizardArgumentModel.food!.calorie[0][0];
    _totalProteinController.text = widget.genericGroceryDetailForMacroWizardArgumentModel.food!.protein[0][0];
    _totalCarbController.text = widget.genericGroceryDetailForMacroWizardArgumentModel.food!.carb[0][0];
    _totalFatController.text = widget.genericGroceryDetailForMacroWizardArgumentModel.food!.fat[0][0];
    _totalUnitController.text = widget.genericGroceryDetailForMacroWizardArgumentModel.food!.units[0][0];
    newFood = widget.genericGroceryDetailForMacroWizardArgumentModel.food!;
    _groceryUnitOptions= newFood.units[0];
    _initialStateFood= newFood;
  }
   Widget buildAddFoodButton(BuildContext context){
     return Column(
       children: [
         Container(
           padding: const EdgeInsets.only(bottom: 24),
           width: double.infinity,
           child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(8),
                   ),
                   backgroundColor: DARK_PRIMARY_COLOR
               ),
               onPressed: () {
                 if(_groceryNameController.text.isEmpty){
                   showErrorToast(context, ERROR_GROCERY_NAME_EMPTY);
                 }
                 else if(_minServingController.text.isEmpty || _maxServingController.text.isEmpty){
                   showErrorToast(context, ERROR_FOOD_SERVING_RANGE_EMPTY);
                 }else{
                   List<Food> foods= [];
                   foods.addAll(widget.genericGroceryDetailForMacroWizardArgumentModel.requestWizardArgumentModel!.foods);
                   foods.add(
                     Food(
                       id: newFood.id,
                       calorie: [_totalCalorieController.text],
                       protein: [_totalProteinController.text],
                       carb: [_totalCarbController.text],
                       fat: [_totalFatController.text],
                       units: [_groceryUnitOptions[_selectedUnitIndex]],
                       foodType: FoodType.groceryProduct,
                       name: _groceryNameController.text,
                     )
                   );

                   List<RangeValues> rangeValues= [];
                   rangeValues.addAll(widget.genericGroceryDetailForMacroWizardArgumentModel.requestWizardArgumentModel!.servingRanges);
                   rangeValues.add(RangeValues(double.parse(_minServingController.text), double.parse(_maxServingController.text)));

                   RequestWizardArgumentModel model= RequestWizardArgumentModel(
                     restriction: widget.genericGroceryDetailForMacroWizardArgumentModel.requestWizardArgumentModel!.restriction,
                     macroGoalRanges: widget.genericGroceryDetailForMacroWizardArgumentModel.requestWizardArgumentModel!.macroGoalRanges,
                     servingRanges: rangeValues,
                     macroPercentage: widget.genericGroceryDetailForMacroWizardArgumentModel.requestWizardArgumentModel!.macroPercentage,
                     goalType: widget.genericGroceryDetailForMacroWizardArgumentModel.requestWizardArgumentModel!.goalType,
                     foods: foods,
                   );
                   showSuccessToast(context, FOOD_ADDED_TO_WIZARD_MSG);
                   Navigator.pop(context, model);
                 }
               },
               child: const Text(ADD_FOOD_LABEL,
                 style: TextStyle( color: Colors.white),)
           ),
         ),
       ],
     );
   }


   Widget foodServingRange(){
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

   Widget groceryUnitDropDown(){
     return  SizedBox(
       width: MACRO_DROP_DOWN_WIDTH,
       height: MACRO_DROP_DOWN_HEIGHT,
       child: DropdownButtonHideUnderline(
         child: ButtonTheme(
           alignedDropdown: true,
           child: DropdownButton(
             isExpanded: true,
             value: _groceryUnitOptions[_selectedUnitIndex],
             items: _groceryUnitOptions.map((String item) {
               return DropdownMenuItem<String>(
                 value: item,
                 child: Text(item, style: const TextStyle(fontSize: 12),),
               );
             }).toList(),
             onChanged: (String? newValue){
               setState(() {
                 int selectedIndex = 0;
                 for (int i = 0; i < _groceryUnitOptions.length; i++){
                   if(newValue.toString() == _groceryUnitOptions[i]){
                     selectedIndex = i;
                   }
                 }
                 _selectedUnitIndex = selectedIndex;
                 _totalCalorieController = TextEditingController(text: _initialStateFood.calorie[0][_selectedUnitIndex].toString());
                 _totalProteinController = TextEditingController(text: _initialStateFood.protein[0][_selectedUnitIndex].toString());
                 _totalCarbController = TextEditingController(text: _initialStateFood.carb[0][_selectedUnitIndex].toString());
                 _totalFatController = TextEditingController(text: _initialStateFood.fat[0][_selectedUnitIndex].toString());
               });

             },
             // style: Theme.of(context).textTheme.title,
           ),
         ),
       ),
     );
   }

  Widget macroAmountsWidgets(TextEditingController servingController,TextEditingController calorieController,
      TextEditingController proteinController,TextEditingController carbController,TextEditingController fatController, TextEditingController unitController, bool isTotal){

    return Column(
      children: [
        ///  serving + unit
        Row(
          children: [
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$UNIT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),


            groceryUnitDropDown()

          ],
        ),

        const SizedBox(height: 16,),

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
                controller: calorieController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
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
                controller: proteinController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
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
                controller: carbController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
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
                controller: fatController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
              ),
            ),
          ],
        ),

      ],
    );
  }


  Widget newGrocery(){
     return TextField(
       controller: _groceryNameController,
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
       style: const TextStyle(color: DARK_PRIMARY_COLOR),
     );
  }


  void updateSelectedFoodType(String type){

  }

}
