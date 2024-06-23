//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:masterpie/feature/foods/presentation/screen/ui_helper/custom_chips.dart';
// import 'package:masterpie/feature/foods/presentation/screen/ui_helper/custom_radio_button.dart';
// import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/food_detail_argument_model.dart';
// import 'package:masterpie/feature/foods/presentation/screen/view_suggested_food_screen.dart';
// import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
// import '../../../../util/core/constant/messages_constants.dart';
// import '../../../../util/design/color/app_colors.dart';
// import '../../../../util/design/size/app_widget_size.dart';
// import '../../../../util/design/text/app_assets.dart';
// import '../../../../util/design/toast/app_toast.dart';
// import '../../data/repository_impl/foods_repository_impl.dart';
// import '../bloc/suggest_food_bloc/state_event/suggest_food_state_event.dart';
// import '../bloc/suggest_food_bloc/suggest_food_bloc.dart';
//
// class SuggestFoodScreen extends StatefulWidget {
//
//   const SuggestFoodScreen({Key? key}) : super(key: key);
//
//
//   @override
//   State<SuggestFoodScreen> createState() => _SuggestFoodScreenState();
// }
//
//
//
// class _SuggestFoodScreenState extends State<SuggestFoodScreen> {
//
//   String selectedDiet= NONE_LABEL;
//   List<String> ingredients= [];
//   List<String> allergies= [];
//   late TextEditingController _ingredientsController;
//   late TextEditingController _allergicToController;
//   List<String> nationalities= [];
//   String selectedNationality= ITALIAN_LABEL;
//
//   late SuggestFoodBloc _suggestFoodBloc;
//
//   @override
//   void initState() {
//     super.initState();
//     _ingredientsController = TextEditingController();
//     _allergicToController = TextEditingController();
//     nationalities= [ITALIAN_LABEL, CHINESE_LABEL, MEXICAN_LABEL, INDIAN_LABEL, THAI_LABEL];
//     _suggestFoodBloc = context.read<SuggestFoodBloc>();
//     _suggestFoodBloc.add(const SuggestFoodEvent.onReset());
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(fontFamily: MONTSERRAT_FONT),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(SUGGEST_FOOD_LABEL, style: TextStyle(color: Colors.white)),
//           backgroundColor: PRIMARY_COLOR,
//           leading: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: const Icon(
//               Icons.arrow_back_ios,
//               color: Colors.white,
//               size: 24,
//             ),
//           ),
//           actions: [
//           ],
//         ),
//         body: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//             child: Stack(
//               children: [
//                 SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//
//                       ///Diet
//                       const Text(DIET_LABEL, style: TextStyle(fontSize: FONT_HEADER, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
//                       const SizedBox(height: 10,),
//                       CustomRadioListTile(
//                         options: const [NONE_LABEL, LOWCARB_LABEL, KETO_LABEL, VEGAN_LABEL],
//                         onSelectedOptionChanged: updateSelectedDiet,
//                         selectedOption: selectedDiet,
//                         orientation: VERTICAL_ORIENTATION,
//                         isEditable: true,
//                       ),
//                       const SizedBox(height: 10,),
//
//                       ///Contains
//                       Row(
//                         children: [
//                           const SizedBox(
//                             width: MACRO_WIDTH,
//                             child:  Text(CONTAINS_LABEL, style: TextStyle(fontSize: FONT_HEADER, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
//                           ),
//                           const SizedBox(width: 30,),
//                           Expanded(
//                             child: SizedBox(
//                               height: SEARCH_BAR_HEIGHT,
//                               child: TextField(
//                                 controller: _ingredientsController,
//                                 decoration: InputDecoration(
//                                   suffixIcon: IconButton(
//                                     icon: Theme(
//                                       data: ThemeData(
//                                         iconTheme: const IconThemeData(color: DARK_PRIMARY_COLOR),
//                                       ),
//                                       child:  const Icon(Icons.check,),
//                                     ),
//                                     onPressed: () {
//                                       if(_ingredientsController.text.isNotEmpty){
//                                         setState(() {
//                                           ingredients.add(_ingredientsController.text.toString());
//                                           _ingredientsController.clear();
//                                         });
//                                       }
//                                     },
//                                   ),
//                                   hintText: CHEDDAR_CHEESE_LABEL,
//                                   border: const OutlineInputBorder(
//                                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
//                                   ),
//                                   enabledBorder: const OutlineInputBorder(
//                                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
//                                   ),
//                                   focusedBorder: const OutlineInputBorder(
//                                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
//                                   ),
//                                   contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10,),
//                       DynamicChips(items: ingredients, onItemRemoved: updateIngredients),
//                       const SizedBox(height: 10,),
//
//
//                       ///Allergies
//                       Row(
//                         children: [
//                           const SizedBox(
//                             width: MACRO_WIDTH,
//                             child: Text(ALLERGIC_LABEL, style: TextStyle(fontSize: FONT_HEADER, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
//                           ),
//                           const SizedBox(width: 30,),
//                           Expanded(
//                             child: SizedBox(
//                               height: SEARCH_BAR_HEIGHT,
//                               child: TextField(
//                                 controller: _allergicToController,
//                                 decoration: InputDecoration(
//                                   suffixIcon: IconButton(
//                                     icon: Theme(
//                                       data: ThemeData(
//                                         iconTheme: const IconThemeData(color: DARK_PRIMARY_COLOR),
//                                       ),
//                                       child:  const Icon(Icons.check,),
//                                     ),
//                                     onPressed: () {
//                                       if(_allergicToController.text.isNotEmpty){
//                                         setState(() {
//                                           allergies.add(_allergicToController.text.toString());
//                                           _allergicToController.clear();
//                                         });
//                                       }
//                                     },
//                                   ),
//                                   hintText: NUTS_LABEL,
//                                   border: const OutlineInputBorder(
//                                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
//                                   ),
//                                   enabledBorder: const OutlineInputBorder(
//                                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
//                                   ),
//                                   focusedBorder: const OutlineInputBorder(
//                                     borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
//                                   ),
//                                   contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10,),
//                       DynamicChips(items: allergies, onItemRemoved: updateAllergies),
//                       const SizedBox(height: 10,),
//
//
//                       ///Nationalities
//                       const Text(NATIONALITIES_LABEL, style: TextStyle(fontSize: FONT_HEADER, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
//                       const SizedBox(height: 10,),
//                       Wrap(
//                         spacing: 24,
//                         children: nationalities.map((item) {
//                           if(selectedNationality == item){
//                             return createNationalityChipSelected(item);
//                           }else{
//                             return createNationalityChipNotSelected(item);
//                           }
//                         },).toList(),
//                       ),
//
//
//                       const SizedBox(height: 32,),
//
//
//
//                       ///suggest food button
//                       Container(
//                         padding: const EdgeInsets.only(bottom: 24),
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               backgroundColor: DARK_PRIMARY_COLOR
//                           ),
//                           onPressed: () {
//                             _suggestFoodBloc.add(
//                               SuggestFoodEvent.onSuggestFood(
//                                   ingredients,
//                                   allergies,
//                                   selectedNationality,
//                                   selectedDiet
//                               ),
//                             );
//                           },
//                           child: const Text(SUGGEST_FOOD_LABEL, style: TextStyle( color: Colors.white),),
//                         ),
//                       ),
//
//
//                     ],
//                   ),
//                 ),
//
//                 BlocConsumer<SuggestFoodBloc, SuggestFoodState>(
//                     builder: (mcontext, state) {
//                       if (state is SuggestFoodStateLoadingState) {
//                         return const GFLoader(
//                           type: GFLoaderType.circle,
//                           loaderColorOne: DARK_PRIMARY_COLOR,
//                           loaderColorTwo: DARK_PRIMARY_COLOR,
//                           loaderColorThree: DARK_PRIMARY_COLOR,
//                         );
//                       }else if(state is SuggestFoodStateLoadedState){
//                         Future.delayed(Duration.zero,(){
//                           _suggestFoodBloc.add(const SuggestFoodEvent.onReset());
//                           FoodDetailArgumentModel argumentModel = FoodDetailArgumentModel(macroEdition: true);
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ViewSuggestedFoodScreen(foodDetailArgumentModel: argumentModel,),
//                             ),
//                           );
//                         });
//                       }else if(state is SuggestFoodStateErrorState){
//                         _suggestFoodBloc.add(const SuggestFoodEvent.onReset());
//                         Future.delayed(Duration.zero,(){
//                           if(state.message == ERROR_FREE_USER_SUGGEST_FOOD_NOT_ALLOWED){
//                             return showUpgradePopupForFreeUsers(context, UPGRADE_MSG_SUGGEST_FOOD);
//                           }else if(state.message == ERROR_PAID_USER_SUGGEST_FOOD_OVER_LIMIT){
//                             return showOVerLimitPaidUsers(context, ERROR_OVER_LIMIT_SUGGEST_FOOD_MSG);
//                           }
//                           return showErrorToast(context, state.message);
//                         });
//                       }
//                       return Container();
//                     },
//                     listener: (context, state){
//
//                     }
//                 ),
//
//               ],
//             )
//         ),
//       ),
//     );
//   }
//
//
//   Widget createNationalityChipSelected(String nationality){
//     return GestureDetector(
//       onTap: (){
//         setState(() {
//           selectedNationality= '';
//         });
//       },
//       child: Chip(
//         backgroundColor: DARK_PRIMARY_COLOR,
//         label: Text(nationality, style: const TextStyle(color: Colors.white),),
//       ),
//     );
//   }
//
//   Widget createNationalityChipNotSelected(String nationality){
//     return GestureDetector(
//       onTap: (){
//         setState(() {
//           selectedNationality= nationality;
//         });
//       },
//       child: Chip(
//         label: Text(nationality),
//       ),
//     );
//   }
//
//   void updateSelectedDiet(String value){
//     setState(() {
//       selectedDiet= value;
//     });
//   }
//
//
//   void updateIngredients(String item){
//     setState(() {
//       ingredients.remove(item);
//     });
//   }
//
//
//   void updateAllergies(String item){
//     setState(() {
//       allergies.remove(item);
//     });
//   }
//
//
//   @override
//   void dispose() {
//     _ingredientsController.dispose();
//     _allergicToController.dispose();
//     super.dispose();
//   }
//
// }
