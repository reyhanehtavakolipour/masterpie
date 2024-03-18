import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/foods/presentation/screen/edit_favorite_food_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/food_detail_argument_model.dart';
import 'package:masterpie/main_screen.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../domain/model/food_model.dart';
import '../../domain/model/food_type.dart';
import '../bloc/remove_from_favorite_bloc/remove_from_my_favorite_bloc.dart';
import '../bloc/remove_from_favorite_bloc/state_event/remove_from_favorite_state_event.dart';
import 'my_favorite_foods_screen.dart';



class ViewFavoriteFoodScreen extends StatefulWidget {

  final FoodDetailArgumentModel foodDetailArgumentModel;

  const ViewFavoriteFoodScreen({super.key, required this.foodDetailArgumentModel});

  @override
  State<ViewFavoriteFoodScreen> createState() => _ViewFavoriteFoodScreenState();
}

class _ViewFavoriteFoodScreenState extends State<ViewFavoriteFoodScreen> {


  String _totalCalorie= '';
  String _totalProtein= '';
  String _totalCarb= '';
  String _totalFat= '';
  String _totalServing= '';
  String _ingredients= '';
  String _foodName= '';
  String _recipe= '';
  late RemoveFromMyFavoriteBloc _removeFromMyFavoriteBloc;
  Food newFood = Food();

  @override
  void initState() {
    super.initState();
    _removeFromMyFavoriteBloc = context.read<RemoveFromMyFavoriteBloc>();
    _removeFromMyFavoriteBloc.add(
      const RemoveFromMyFavoriteEvent.onReset(),
    );
    init();
  }



   Future<void> _showDeleteConfirmation(BuildContext context) async {
     return showDialog<void>(
       context: context,
       barrierDismissible: true,
       builder: (BuildContext context) {
         return AlertDialog(
           title: const Text(DELETE_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
           content: const SingleChildScrollView(
             child: ListBody(
               children: <Widget>[
                 Text(DELETE_CONFIRMATION_QUESTION, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 14, color: DARK_PRIMARY_COLOR)),
               ],
             ),
           ),
           actions: <Widget>[
             TextButton(
               child: const Text(YES_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 13, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
               onPressed: () {
                 Navigator.of(context).pop();
                 _removeFromMyFavoriteBloc.add(
                   RemoveFromMyFavoriteEvent.onRemoveFromMyFavorite(
                       newFood
                   ),
                 );
               },
             ),
             TextButton(
               child: const Text(NO_LABEL, style: TextStyle(fontFamily: MONTSERRAT_FONT, fontSize: 13, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold)),
               onPressed: () {
                 Navigator.of(context).pop(); // Close the dialog
               },
             ),
           ],
         );
       },
     );
   }


@override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked : (didPop){
      },
      child: MaterialApp(
        theme: ThemeData(fontFamily: MONTSERRAT_FONT),
        home: Scaffold(
          appBar: AppBar(
            title: const Text(FOOD_DETAIL_LABEL, style: TextStyle(color: Colors.white),),
            backgroundColor: PRIMARY_COLOR,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 24,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.white,),
                onPressed: () {
                  FoodDetailArgumentModel argumentModel = FoodDetailArgumentModel(food: newFood, macroEdition: widget.foodDetailArgumentModel.macroEdition);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditFavoriteFoodScreen(foodDetailArgumentModel: argumentModel,),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.white,),
                onPressed: () {
                  _showDeleteConfirmation(context);
                },
              ),
            ],
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    const Text('$NAME_LABEL:', style: TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),),

                    const SizedBox(height: 4,),

                    Text(_foodName, style: const TextStyle(fontSize: 16, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),



                    Visibility(
                      visible: widget.foodDetailArgumentModel.food!.foodType == FoodType.meal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const SizedBox(height: 16,),

                            const Text('$INGREDIENTS_LABEL:', style: TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),),

                            const SizedBox(height: 4,),


                            Text(_ingredients, style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),


                            const SizedBox(height: 16,),

                            const Text('$RECIPE_LABEL:', style: TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),),

                            const SizedBox(height: 4,),


                            Text(_recipe, style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),

                          ],
                        ),
                    ),



                    const SizedBox(height: 32,),



                    const Text('$TOTAL_MACRO_LABEL:', style: TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),),


                    const SizedBox(height: 16,),

                    Row(
                      children: [
                        Text('${SERVING_LABEL.capitalize()}:', style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
                        const SizedBox(width: 4,),
                        Text(_totalServing, style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),
                      ],
                    ),

                    const SizedBox(height: 16,),


                    Row(
                      children: [
                        Expanded(
                            child: Row(
                              children: [
                                const Text('$CALORIE_LABEL:', style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
                                const SizedBox(width: 4,),
                                Text(_totalCalorie, style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),
                              ],
                            )
                        ),
                        Expanded(
                            child: Row(
                              children: [
                                const Text('$PROTEIN_LABEL:', style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
                                const SizedBox(width: 4,),
                                Text(_totalProtein, style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),
                              ],
                            )
                        ),
                      ],
                    ),


                    const SizedBox(height: 16,),


                    Row(
                      children: [
                        Expanded(
                            child: Row(
                              children: [
                                const Text('$CARB_LABEL:', style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
                                const SizedBox(width: 4,),
                                Text(_totalCarb, style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),
                              ],
                            )
                        ),
                        Expanded(
                            child: Row(
                              children: [
                                const Text('$FAT_LABEL:', style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
                                const SizedBox(width: 4,),
                                Text(_totalFat, style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),
                              ],
                            )
                        ),
                      ],
                    ),



                    const SizedBox(height: 32,),



                    BlocConsumer<RemoveFromMyFavoriteBloc, RemoveFromMyFavoriteState>(
                        builder: (mcontext, state) {
                          if (state is RemoveFromMyFavoriteLoadingState) {
                            return const GFLoader(
                                  type: GFLoaderType.circle,
                                  loaderColorOne: DARK_PRIMARY_COLOR,
                                  loaderColorTwo: DARK_PRIMARY_COLOR,
                                  loaderColorThree: DARK_PRIMARY_COLOR,
                                );
                          }else if(state is RemoveFromMyFavoriteLoadedState){
                            Future.delayed(Duration.zero,(){
                              _removeFromMyFavoriteBloc.add(const RemoveFromMyFavoriteEvent.onReset());
                              showSuccessToast(context, REMOVED_FROM_FAVORITE_SUCCESSFULLY);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainScreen(),
                                  ),
                                  (route) => false
                                );
                            });
                          }else if(state is RemoveFromMyFavoriteErrorState){
                            _removeFromMyFavoriteBloc.add(const RemoveFromMyFavoriteEvent.onReset());
                            Future.delayed(Duration.zero,(){
                              return showErrorToast(context, state.message);
                            });
                          }else{
                          }
                          return Container();
                        },
                        listener: (context, state){

                        }
                    ),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }


   void init() {
     if (widget.foodDetailArgumentModel.food?.foodType == FoodType.groceryProduct) {
       _foodName = widget.foodDetailArgumentModel.food!.name;
       _totalServing = '${widget.foodDetailArgumentModel.food!.servingAmounts[0]} ${widget.foodDetailArgumentModel.food!.units[0]}';
       _totalCalorie = double.parse(widget.foodDetailArgumentModel.food!.calorie[0]).toStringAsFixed(2);
       _totalProtein = double.parse(widget.foodDetailArgumentModel.food!.protein[0]).toStringAsFixed(2);
       _totalCarb = double.parse(widget.foodDetailArgumentModel.food!.carb[0]).toStringAsFixed(2);
       _totalFat = double.parse(widget.foodDetailArgumentModel.food!.fat[0]).toStringAsFixed(2);
     } else {
       double calorie = 0;
       for (int i = 0; i < widget.foodDetailArgumentModel.food!.calorie.length; i++) {
         if (i < widget.foodDetailArgumentModel.food!.servingIngredientsCount.length) {
           double servingCount = double.parse(
               widget.foodDetailArgumentModel.food!.servingIngredientsCount[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.servingIngredientsCount[i]);
           calorie = calorie + double.parse(widget.foodDetailArgumentModel.food!.calorie[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.calorie[i]) * servingCount;
         }
       }

       double protein = 0;
       for (int i = 0; i < widget.foodDetailArgumentModel.food!.protein.length; i++) {
         if (i < widget.foodDetailArgumentModel.food!.servingIngredientsCount.length) {
           double servingCount = double.parse(widget.foodDetailArgumentModel.food!.servingIngredientsCount[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.servingIngredientsCount[i]);
           protein = protein + double.parse(widget.foodDetailArgumentModel.food!.protein[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.protein[i]) * servingCount;
         }
       }

       double carb = 0;
       for (int i = 0; i < widget.foodDetailArgumentModel.food!.carb.length; i++) {
         if (i < widget.foodDetailArgumentModel.food!.servingIngredientsCount.length) {
           double servingCount = double.parse(widget.foodDetailArgumentModel.food!.servingIngredientsCount[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.servingIngredientsCount[i]);
           carb = carb + double.parse(widget.foodDetailArgumentModel.food!.carb[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.carb[i]) * servingCount;
         }
       }


       double fat = 0;
       for (int i = 0; i <
           widget.foodDetailArgumentModel.food!.fat.length; i++) {
         if (i < widget.foodDetailArgumentModel.food!.servingIngredientsCount.length) {
           double servingCount = double.parse(widget.foodDetailArgumentModel.food!.servingIngredientsCount[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.servingIngredientsCount[i]);
           fat = fat + double.parse(widget.foodDetailArgumentModel.food!.fat[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.fat[i]) * servingCount;
         }
       }


       String ingredients = '';
       for (int i = 0; i < widget.foodDetailArgumentModel.food!.ingredients.length; i++) {
         if (i < widget.foodDetailArgumentModel.food!.servingIngredientsCount.length) {
           String ingredient = '- ${double.parse(widget.foodDetailArgumentModel.food!.servingIngredientsCount[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.servingIngredientsCount[i])
               * double.parse(widget.foodDetailArgumentModel.food!.servingAmounts[i].isEmpty ? '0' : widget.foodDetailArgumentModel.food!.servingAmounts[i])}'
               ' ${widget.foodDetailArgumentModel.food!.units[i]} '
               '${widget.foodDetailArgumentModel.food!.ingredients[i]},\n';
           ingredients = ingredients + ingredient;
         }
       }

         _foodName = widget.foodDetailArgumentModel.food!.name;
         _totalServing =
         '${widget.foodDetailArgumentModel.food!.servingAmount} ${widget
             .foodDetailArgumentModel.food!.unit}';
         _totalCalorie = calorie.toStringAsFixed(2);
         _totalProtein = protein.toStringAsFixed(2);
         _totalCarb = carb.toStringAsFixed(2);
         _totalFat = fat.toStringAsFixed(2);
         _recipe = widget.foodDetailArgumentModel.food!.recipe;
         _ingredients = ingredients;
       }

       newFood = widget.foodDetailArgumentModel.food!;
     }



   }

