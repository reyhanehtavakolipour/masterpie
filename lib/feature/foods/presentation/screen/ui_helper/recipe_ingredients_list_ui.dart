// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
// import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
// import '../../../../../util/core/constant/messages_constants.dart';
// import '../../../../../util/design/color/app_colors.dart';
// import '../../../../../util/design/size/app_widget_size.dart';
// import '../../../domain/model/food_model.dart';
// import 'debouncer.dart';
//
// class RecipeIngredientsListUi extends StatefulWidget {
//
//   final Function(int index, bool state, bool isRemove) onExpansionStateChanged;
//   final Function(GenericFood food) onIngredientUpdated;
//   final GenericFood meal;
//   final List<bool> ingredientsExpansionState;
//   final Function(int index, double count) onServingCountChangeRequested;
//   List<String> ingredients = [];
//   final List<int> _selectedIngredientsUnitIndex= [];
//
//   RecipeIngredientsListUi({super.key, required this.meal, required this.ingredientsExpansionState,
//     required this.onExpansionStateChanged, required this.onIngredientUpdated, required this.onServingCountChangeRequested,
//     required this.ingredients, required this._selectedIngredientsUnitIndex});
//
//   @override
//   State<RecipeIngredientsListUi> createState() => _RecipeIngredientsListUiState();
// }
//
// class _RecipeIngredientsListUiState extends State<RecipeIngredientsListUi> {
//
//   late TextEditingController _calorieController;
//   late TextEditingController _proteinController;
//   late TextEditingController _carbController;
//   late TextEditingController _fatController;
//   late TextEditingController _servingController;
//   late TextEditingController _unitController;
//   late TextEditingController _ingredientNameController;
//   late TextEditingController _ingredientServingCountController;
//
//
//   Color _ingredientNameBorderColor = DARK_PRIMARY_COLOR;
//
//
//   List<Food> _suggestedGroceries = [];
//
//
//   @override
//   void initState() {
//     super.initState();
//     _calorieController= TextEditingController(text: '0');
//     _proteinController= TextEditingController(text: '0');
//     _carbController= TextEditingController(text: '0');
//     _fatController= TextEditingController(text: '0');
//     _servingController= TextEditingController(text: '0');
//     _unitController= TextEditingController(text: 'g');
//     _ingredientNameController= TextEditingController(text: '');
//     _ingredientServingCountController= TextEditingController(text: '1.0');
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//
//         scrollDirection: Axis.vertical,
//         shrinkWrap: true,
//         itemCount: widget.meal.ingredients.length,
//         itemBuilder: (context, index){
//           String ingredientName = widget.meal.ingredients[index];
//           if(widget.ingredientsExpansionState[index] ){
//             _calorieController.text = widget.meal.calorie[index];
//             _proteinController.text = widget.meal.protein[index];
//             _carbController.text = widget.meal.carb[index];
//             _fatController.text = widget.meal.fat[index];
//             _servingController.text = widget.meal.servingAmounts[index];
//             _ingredientNameController.text = widget.meal.ingredients[index];
//             _ingredientServingCountController.text = widget.meal.servingIngredientsCount[index];
//             _unitController.text = widget.meal.units[index];
//           }
//
//           return SizedBox(
//               width: double.infinity,
//               height: widget.ingredientsExpansionState[index] ? 420 : 70,
//               child: GestureDetector(
//                 child: Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(BORDER_RADIUS),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 4),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Visibility(
//                             visible: !widget.ingredientsExpansionState[index],
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.arrow_right,
//                                   color: Colors.black,
//                                 ),
//                                 Expanded(
//                                   child: Text(
//                                     ingredientName.capitalize(),
//                                     overflow: TextOverflow.ellipsis,
//                                     style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: FONT_SIZE_TITLE, fontWeight: FontWeight.bold),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Visibility(
//                             visible: widget.ingredientsExpansionState[index],
//                             child: Stack(
//                               children: [
//                                 Column(
//                                   children: [
//
//                                     Row(
//                                       children: [
//                                         const Icon(
//                                           Icons.arrow_drop_down,
//                                           color: Colors.black,
//                                         ),
//                                         Container(
//                                           width: 260,
//                                           child: TextField(
//                                             enabled: widget.isEditable,
//                                             onChanged: updatedIngredientMacroListener,
//                                             controller: _ingredientNameController,
//                                             decoration:  InputDecoration(
//                                               hintText: CHEDDAR_CHEESE_LABEL,
//                                               border: OutlineInputBorder(
//                                                 borderSide: BorderSide(color: _ingredientNameBorderColor),
//                                               ),
//                                               enabledBorder: OutlineInputBorder(
//                                                 borderSide: BorderSide(color: _ingredientNameBorderColor),
//                                               ),
//                                               focusedBorder: OutlineInputBorder(
//                                                 borderSide: BorderSide(color: _ingredientNameBorderColor, width: 2),
//                                               ),
//                                               contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//
//                                     const SizedBox(height: 16,),
//
//                                     macroAmountsWidgets(index),
//
//                                     const SizedBox(height: 16,),
//
//
//                                     Visibility(
//                                       visible: widget.isEditable,
//                                       child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.end,
//                                           children: [
//                                             ElevatedButton(
//                                               style: ButtonStyle(
//                                                 backgroundColor: MaterialStateProperty.all<Color>(RED_ERROR_COLOR),
//                                               ),
//                                               onPressed: () {
//                                                 removeIngredientButtonClickListener(index);
//                                               },
//                                               child: const Text(REMOVE_LABEL, style: TextStyle( color: Colors.white),),
//                                             ),
//                                           ]
//                                       ),
//                                     ),
//
//                                   ],
//                                 ),
//
//                                 suggestedGroceriesList(),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                 ),
//                 onTap: (){
//                   setState(() {
//                     widget.onExpansionStateChanged(index, !widget.ingredientsExpansionState[index], false);
//                   });
//                 },
//               )
//           );
//         }
//     );
//   }
//
//
//   Widget suggestedGroceriesList(){
//     return  Visibility(
//       visible: _suggestedGroceries.isNotEmpty,
//       child: Container(
//           width: 300,
//           height: 200,
//           padding: const EdgeInsets.only(top: 4, right: 4),
//           decoration: BoxDecoration(
//             color: LIGHT_GREY_COLOR,
//             borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
//           ),
//           margin: const EdgeInsets.only(top: 36),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 GestureDetector(
//                   child: const Icon(
//                     Icons.close,
//                     color: Colors.black,
//                   ),
//                   onTap: () {
//                     setState(() {
//                       _suggestedGroceries = [];
//                     });
//                   },
//                 ),
//
//                   ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: _suggestedGroceries.length,
//                       itemBuilder: (context, index){
//                         Food grocery = _suggestedGroceries[index];
//                         return GestureDetector(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                                   child: Text(grocery.name.capitalize(), style: const TextStyle(color: Colors.blueGrey, fontSize: 12),)
//                               ),
//                               const SizedBox(height: 8,),
//                             ],
//                           ),
//                           onTap: (){
//                             _suggestedGroceries = [];
//                             _ingredientNameController= TextEditingController(text: grocery.name.replaceAll(',', ''));
//                             _ingredientServingCountController= TextEditingController(text: '1.0');
//                             _servingController = TextEditingController(text: grocery.servingAmount.toString() == '0' ? '100' : grocery.servingAmount.toString());
//                             _calorieController = TextEditingController(text: grocery.calorie[0].toString());
//                             _proteinController = TextEditingController(text: grocery.protein[0].toString());
//                             _carbController = TextEditingController(text: grocery.carb[0].toString());
//                             _fatController = TextEditingController(text: grocery.fat[0].toString());
//                             _unitController= TextEditingController(text: grocery.units[0].toString());
//                             updatedIngredientMacroListener('');
//                           },
//                         );
//                       }
//                   ),
//               ],
//             ),
//           )
//       ),
//     );
//   }
//
//
//   void removeIngredientButtonClickListener(int index){
//     setState(() {
//       widget.onExpansionStateChanged(index, !widget.ingredientsExpansionState[index], true);
//       List<String> ingredients = List<String>.from(widget.meal.ingredients);
//       ingredients.removeAt(index);
//       List<String> servingIngredientsCount = List<String>.from(widget.meal.servingIngredientsCount);
//       servingIngredientsCount.removeAt(index);
//       List<String> ingredientsUnit = List<String>.from(widget.meal.units);
//       ingredientsUnit.removeAt(index);
//       List<String> ingredientsServingAmount = List<String>.from(widget.meal.servingAmounts);
//       ingredientsServingAmount.removeAt(index);
//       List<String> ingredientsCalorie = List<String>.from(widget.meal.calorie);
//       ingredientsCalorie.removeAt(index);
//       List<String> ingredientsProtein = List<String>.from(widget.meal.protein);
//       ingredientsProtein.removeAt(index);
//       List<String> ingredientsCarb = List<String>.from(widget.meal.carb);
//       ingredientsCarb.removeAt(index);
//       List<String> ingredientsFat = List<String>.from(widget.meal.fat);
//       ingredientsFat.removeAt(index);
//       Food updatedFood = Food(
//           ingredients: ingredients,
//           servingIngredientsCount: servingIngredientsCount,
//           fat: ingredientsFat,
//           carb: ingredientsCarb,
//           protein: ingredientsProtein,
//           calorie: ingredientsCalorie,
//           servingAmounts: ingredientsServingAmount,
//           units: ingredientsUnit
//       );
//       _ingredientNameBorderColor = Colors.black;
//       widget.onIngredientUpdated(updatedFood);
//     });
//   }
//
//
//
//   void updatedIngredientMacroListener(String value){
//     setState(() {
//         int index = 0;
//         for (int i = 0; i < widget.ingredientsExpansionState.length; i++) {
//           if(widget.ingredientsExpansionState[i]){
//             index = i;
//             break;
//           }
//         }
//         List<String> ingredients = List<String>.from(widget.meal.ingredients);
//         ingredients[index]= _ingredientNameController.text;
//         List<String> servingIngredientsCount = List<String>.from(widget.meal.servingIngredientsCount);
//         servingIngredientsCount[index]= _ingredientServingCountController.text;
//         List<String> ingredientsUnit = List<String>.from(widget.meal.units);
//         ingredientsUnit[index]= _unitController.text;
//         List<String> ingredientsServingAmount = List<String>.from(widget.meal.servingAmounts);
//         ingredientsServingAmount[index]= _servingController.text;
//         List<String> ingredientsCalorie = List<String>.from(widget.meal.calorie);
//         ingredientsCalorie[index]= _calorieController.text;
//         List<String> ingredientsProtein = List<String>.from(widget.meal.protein);
//         ingredientsProtein[index]= _proteinController.text;
//         List<String> ingredientsCarb = List<String>.from(widget.meal.carb);
//         ingredientsCarb[index]= _carbController.text;
//         List<String> ingredientsFat = List<String>.from(widget.meal.fat);
//         ingredientsFat[index]= _fatController.text;
//         Food updatedFood = Food(
//           ingredients: ingredients,
//           servingIngredientsCount: servingIngredientsCount,
//           fat: ingredientsFat,
//           carb: ingredientsCarb,
//           protein: ingredientsProtein,
//           calorie: ingredientsCalorie,
//           servingAmounts: ingredientsServingAmount,
//           units: ingredientsUnit
//         );
//
//         _ingredientNameBorderColor = Colors.black;
//         widget.onIngredientUpdated(updatedFood);
//       });
//   }
//
//
//
//   Widget macroAmountsWidgets(int index){
//     return Column(
//       children: [
//         ///  serving + unit
//         Row(
//           children: [
//             const SizedBox(
//                 width: MACRO_TITLE_WIDTH,
//                 child: Text('$SERVING_AMOUNT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
//             ),
//             const SizedBox(width: 4,),
//             SizedBox(
//               width: MACRO_WIDTH,
//               height: MACRO_HEIGHT,
//               child: TextField(
//                 enabled: false,
//                 onChanged: updatedIngredientMacroListener,
//                 controller: _servingController,
//                 keyboardType: const TextInputType.numberWithOptions(decimal: true),
//                 inputFormatters: <TextInputFormatter>[
//                   FilteringTextInputFormatter.allow(numericRegExp),
//                 ],
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
//                   ),
//                   contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 28,),
//             const SizedBox(
//                 width: MACRO_TITLE_WIDTH,
//                 child: Text('$UNIT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
//             ),
//             const SizedBox(width: 4,),
//             SizedBox(
//               width: MACRO_WIDTH,
//               height: MACRO_HEIGHT,
//               child:  TextField(
//                 enabled: false,
//                 onChanged: updatedIngredientMacroListener,
//                 controller: _unitController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
//                   ),
//                   contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                 ),
//               ),
//             )
//
//           ],
//         ),
//         const SizedBox(height: 4,),
//
//         /// total calorie + protein
//         Row(
//           children: [
//             const SizedBox(
//                 width: MACRO_TITLE_WIDTH,
//                 child: Text('$CALORIE_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
//             ),
//             const SizedBox(width: 4,),
//             SizedBox(
//               width: MACRO_WIDTH,
//               height: MACRO_HEIGHT,
//               child: TextField(
//                 enabled: widget.isEditable,
//                 onChanged: updatedIngredientMacroListener,
//                 controller: _calorieController,
//                 keyboardType: const TextInputType.numberWithOptions(decimal: true),
//                 inputFormatters: <TextInputFormatter>[
//                   FilteringTextInputFormatter.allow(numericRegExp),
//                 ],
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
//                   ),
//                   contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 20,),
//             const SizedBox(
//                 width: MACRO_TITLE_WIDTH,
//                 child: Text('$PROTEIN_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
//             ),
//             const SizedBox(width: 4,),
//             SizedBox(
//               width: MACRO_WIDTH,
//               height: MACRO_HEIGHT,
//               child: TextField(
//                 enabled: widget.isEditable,
//                 onChanged: updatedIngredientMacroListener,
//                 controller: _proteinController,
//                 keyboardType: const TextInputType.numberWithOptions(decimal: true),
//                 inputFormatters: <TextInputFormatter>[
//                   FilteringTextInputFormatter.allow(numericRegExp),
//                 ],
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
//                   ),
//                   contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                 ),
//               ),
//             ),
//           ],
//         ),
//
//         const SizedBox(height: 12,),
//
//         /// total carb + fat
//         Row(
//           children: [
//             const SizedBox(
//                 width: MACRO_TITLE_WIDTH,
//                 child: Text('$CARB_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
//             ),
//             const SizedBox(width: 4,),
//             SizedBox(
//               width: MACRO_WIDTH,
//               height: MACRO_HEIGHT,
//               child: TextField(
//                 enabled: widget.isEditable,
//                 onChanged: updatedIngredientMacroListener,
//                 controller: _carbController,
//                 keyboardType: const TextInputType.numberWithOptions(decimal: true),
//                 inputFormatters: <TextInputFormatter>[
//                   FilteringTextInputFormatter.allow(numericRegExp),
//                 ],
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
//                   ),
//                   contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 20,),
//             const SizedBox(
//                 width: MACRO_TITLE_WIDTH,
//                 child: Text('$FAT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
//             ),
//             const SizedBox(width: 4,),
//             SizedBox(
//               width: MACRO_WIDTH,
//               height: MACRO_HEIGHT,
//               child: TextField(
//                 enabled: widget.isEditable,
//                 onChanged: updatedIngredientMacroListener,
//                 controller: _fatController,
//                 keyboardType: const TextInputType.numberWithOptions(decimal: true),
//                 inputFormatters: <TextInputFormatter>[
//                   FilteringTextInputFormatter.allow(numericRegExp),
//                 ],
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
//                   ),
//                   contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                 ),
//               ),
//             ),
//           ],
//         ),
//
//
//         const SizedBox(height: 48,),
//
//         /// how many serving?
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const Text('$HOW_MANY_SERVINGS:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),
//
//             const SizedBox(width: 16,),
//             Visibility(
//               visible: widget.isEditable,
//               child: GestureDetector(
//                 child: const CircleAvatar(
//                   radius: 14,
//                   backgroundColor: DARK_PRIMARY_COLOR,
//                   child: Icon(
//                     Icons.remove,
//                     color: Colors.white,
//                   ),
//                 ),
//                 onTap: (){
//                   setState(() {
//                     if(double.parse(_ingredientServingCountController.text) >= STEP_AMOUNT){
//                       widget.onServingCountChangeRequested(index, double.parse(_ingredientServingCountController.text) - STEP_AMOUNT);
//                     }
//                   });
//                 },
//
//               ),
//             ),
//             Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 4),
//                 child: SizedBox(
//                   width: 60,
//                   height: MACRO_HEIGHT,
//                   child: TextField(
//                     enabled: widget.isEditable,
//                     controller: _ingredientServingCountController,
//                     onChanged: updatedIngredientMacroListener,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
//                     keyboardType: const TextInputType.numberWithOptions(decimal: true),
//                     inputFormatters: <TextInputFormatter>[
//                       FilteringTextInputFormatter.allow(numericRegExp),
//                     ],
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: PRIMARY_COLOR),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: PRIMARY_COLOR),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: PRIMARY_COLOR, width: 2),
//                       ),
//                       contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                     ),
//                   ),
//                 )
//             ),
//             Visibility(
//               visible: widget.isEditable,
//               child: GestureDetector(
//                 child: const CircleAvatar(
//                   radius: 14,
//                   backgroundColor: DARK_PRIMARY_COLOR,
//                   child: Icon(
//                     Icons.add,
//                     color: Colors.white,
//                   ),
//                 ),
//                 onTap: (){
//                   setState(() {
//                     widget.onServingCountChangeRequested(index, double.parse(_ingredientServingCountController.text) + STEP_AMOUNT);
//                   });
//                 },
//               ),
//             ),
//           ],
//           ),
//       ],
//     );
//   }
//
//
// }
