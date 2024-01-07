//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:getwidget/components/loader/gf_loader.dart';
// import 'package:getwidget/types/gf_loader_type.dart';
// import 'package:rtp_fitness/feature/foods/domain/model/food_type.dart';
// import 'package:rtp_fitness/feature/foods/presentation/bloc/international_meals_bloc/international_meals_bloc.dart';
// import 'package:rtp_fitness/feature/foods/presentation/bloc/international_meals_bloc/state_event/international_meals_state_event.dart';
// import 'package:rtp_fitness/feature/foods/presentation/screen/ui_helper/foods_list_ui.dart';
//
// import '../../../../util/core/constant/messages_constants.dart';
// import '../../../../util/design/color/app_colors.dart';
// import '../../../../util/design/size/app_widget_size.dart';
// import '../../../../util/design/toast/app_toast.dart';
// import '../../domain/model/food_model.dart';
// import '../bloc/add_or_update_my_favorite_bloc/add_or_update_my_favorite_bloc.dart';
// import '../bloc/add_or_update_my_favorite_bloc/state_event/add_or_update_my_favorite_state_event.dart';
// import '../bloc/remove_from_favorite_bloc/remove_from_my_favorite_bloc.dart';
// import '../bloc/remove_from_favorite_bloc/state_event/remove_from_favorite_state_event.dart';
//
// class InternationalMealsScreen extends StatefulWidget {
//
//   const InternationalMealsScreen({super.key});
//
//   static const routeName = '/international-meals-screen';
//
//
//   @override
//   State<InternationalMealsScreen> createState() => _InternationalMealsScreenState();
// }
//
// class _InternationalMealsScreenState extends State<InternationalMealsScreen> {
//
//   late TextEditingController _searchController;
//
//   late AddOrUpdateMyFavoriteBloc _addToMyFavoriteBloc;
//   late RemoveFromMyFavoriteBloc _removeFromMyFavoriteBloc;
//   late InternationalMealsBloc _internationalMealsBloc;
//
//
//   List<Food> changedFoods = [];
//
//   late FoodsListUi _loadedFoodListUi;
//
//
//   @override
//   void initState() {
//     super.initState();
//     _searchController = TextEditingController();
//     _addToMyFavoriteBloc = context.read<AddOrUpdateMyFavoriteBloc>();
//     _removeFromMyFavoriteBloc = context.read<RemoveFromMyFavoriteBloc>();
//     _internationalMealsBloc = context.read<InternationalMealsBloc>();
//     _loadedFoodListUi= FoodsListUi(foods: [], onFoodsChanged: updateChangedFoods,
//       onFavoriteButtonClicked: addOrRemoveFavorite, foodsTypeRequested: const [FoodType.meal], foodBackGroundColor: DEFAULT_FOOD_BACKGROUND_COLOR, foodIcon: const Icon(Icons.fastfood, color: Colors.blueGrey,),);
//
//     _internationalMealsBloc.add(
//       const InternationalMealsEvent.onGetInternationalMeals(''),
//     );
//   }
//
//
//   void addOrRemoveFavorite(Food food, bool addToFavorite){
//     if(addToFavorite){
//       _addToMyFavoriteBloc.add(
//         AddOrUpdateMyFavoriteEvent.onAddToMyFavorite(
//             food
//         ),
//       );
//     }else{
//       _removeFromMyFavoriteBloc.add(
//         RemoveFromMyFavoriteEvent.onRemoveFromMyFavorite(
//             food
//         ),
//       );
//     }
//   }
//
//
//   void updateChangedFoods(List<Food> foods) {
//     setState(() {
//       changedFoods= foods;
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//         /// App bar
//         appBar: AppBar(
//           title: const Text(INTERNATIONAL_MEALS_LABEL),
//           backgroundColor: PRIMARY_COLOR,
//           actions: [
//
//           ],
//         ),
//
//
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           child: Column(
//             children: [
//
//               const SizedBox(height: 12,),
//
//               /// search bar
//               Row(
//                 children: [
//                   Expanded(
//                     child: SizedBox(
//                       height: SEARCH_BAR_HEIGHT,
//                       child: TextField(
//                         controller: _searchController,
//                         decoration: const InputDecoration(
//                           hintText: CHEDDAR_CHEESE_LABEL,
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
//                           ),
//                           contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 8,),
//                   GestureDetector(
//                     child: const CircleAvatar(
//                       radius: 18,
//                       backgroundColor: Colors.orange,
//                       child: Icon(
//                         Icons.search,
//                         color: Colors.white,
//                       ),
//                     ),
//                     onTap: () {
//                       _internationalMealsBloc.add(
//                          InternationalMealsEvent.onGetInternationalMeals(_searchController.text),
//                       );
//                     },
//                   )
//                 ],
//               ),
//
//
//               const SizedBox(height: 16,),
//
//               /// Foods list
//               Expanded(
//                   child: BlocConsumer<InternationalMealsBloc, InternationalMealsState>(
//                       builder: (context, state) {
//
//                         if (state is InternationalMealsLoadingState) {
//                           return Stack(
//                             children: [
//                               _loadedFoodListUi,
//                               const GFLoader(
//                                 type: GFLoaderType.circle,
//                                 loaderColorOne: DARK_PRIMARY_COLOR,
//                                 loaderColorTwo: DARK_PRIMARY_COLOR,
//                                 loaderColorThree: DARK_PRIMARY_COLOR,
//                               ),
//                             ],
//                           );
//                         }else if(state is InternationalMealsLoadedState){
//                           _loadedFoodListUi= FoodsListUi(foods: state.foods, onFoodsChanged: updateChangedFoods,
//                              onFavoriteButtonClicked: addOrRemoveFavorite, foodsTypeRequested: const [FoodType.meal], foodBackGroundColor: DEFAULT_FOOD_BACKGROUND_COLOR, foodIcon: const Icon(Icons.fastfood, color: Colors.blueGrey,),);
//                           if(state.foods.isEmpty){
//                             return const Center(
//                                 child: Text(NOTHING_FOUND, style: TextStyle(color: Colors.grey, fontSize: FONT_SIZE_TITLE, fontWeight: FontWeight.bold),)
//                             );
//                           }else{
//                             return FoodsListUi(foods: state.foods, onFoodsChanged: updateChangedFoods,
//                               onFavoriteButtonClicked: addOrRemoveFavorite, foodsTypeRequested: const [FoodType.meal], foodBackGroundColor: DEFAULT_FOOD_BACKGROUND_COLOR, foodIcon: const Icon(Icons.fastfood, color: Colors.blueGrey,),);
//                           }
//                         }else if(state is InternationalMealsErrorState){
//                           Future.delayed(Duration.zero,(){
//                             return showErrorToast(context, state.message);
//                           });
//                         }
//                         return Container();
//                       },
//                       listener: (context, state){
//
//                       }
//                   )
//               ),
//
//
//
//               BlocConsumer<AddOrUpdateMyFavoriteBloc, AddOrUpdateMyFavoriteState>(
//                   builder: (context, state) {
//                     return Container(height: 1,);
//                   },
//                   listener: (context, state){
//                     if(state is AddOrUpdateMyFavoriteLoadedState){
//                       Future.delayed(Duration.zero,(){
//                         _loadedFoodListUi= FoodsListUi(foods: [], onFoodsChanged: updateChangedFoods,
//                           onFavoriteButtonClicked: addOrRemoveFavorite, foodsTypeRequested: const [FoodType.meal], foodBackGroundColor: DEFAULT_FOOD_BACKGROUND_COLOR, foodIcon: const Icon(Icons.fastfood, color: Colors.blueGrey,),);
//                       });
//                     }
//                   }
//               ),
//               BlocConsumer<RemoveFromMyFavoriteBloc, RemoveFromMyFavoriteState>(
//                   builder: (context, state) {
//                     return Container(height: 1,);
//                   },
//                   listener: (context, state){
//                     if(state is RemoveFromMyFavoriteLoadedState){
//                       Future.delayed(Duration.zero,(){
//                         _loadedFoodListUi= FoodsListUi(foods: [], onFoodsChanged: updateChangedFoods,
//                           onFavoriteButtonClicked: addOrRemoveFavorite, foodsTypeRequested: const [FoodType.meal], foodBackGroundColor: DEFAULT_FOOD_BACKGROUND_COLOR, foodIcon: const Icon(Icons.fastfood, color: Colors.blueGrey,),);
//                       });
//                     }
//                   }
//               ),
//             ],
//           ),
//         ),
//       );
//   }
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
// }
