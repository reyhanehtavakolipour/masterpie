import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/presentation/screen/edit_cook_book_food_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/my_cook_book_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/food_detail_argument_model.dart';
import 'package:masterpie/main_screen.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../data/repository_impl/foods_repository_impl.dart';
import '../../domain/model/food_model.dart';
import '../bloc/add_or_update_my_favorite_bloc/add_or_update_my_favorite_bloc.dart';
import '../bloc/add_or_update_my_favorite_bloc/state_event/add_or_update_my_favorite_state_event.dart';
import '../bloc/get_logged_foods_bloc/get_logged_foods_bloc.dart';
import '../bloc/get_logged_foods_bloc/state_event/get_logged_foods_state_event.dart';
import '../bloc/log_foods_bloc/log_foods_bloc.dart';
import '../bloc/log_foods_bloc/state_event/log_foods_state_event.dart';
import '../bloc/my_favorite_foods/my_favorite_foods_bloc.dart';
import '../bloc/my_favorite_foods/state_event/my_favorite_foods_state_event.dart';
import '../bloc/remove_from_cook_book_bloc/remove_from_my_cook_book_bloc.dart';
import '../bloc/remove_from_cook_book_bloc/state_event/remove_from_cook_book_state_event.dart';


class ViewCookBookFoodScreen extends StatefulWidget {

  final FoodDetailArgumentModel foodDetailArgumentModel;

  const ViewCookBookFoodScreen({super.key, required this.foodDetailArgumentModel});

  @override
  State<ViewCookBookFoodScreen> createState() => _ViewCookBookFoodScreenState();
}

class _ViewCookBookFoodScreenState extends State<ViewCookBookFoodScreen> {


  String _totalCalorie= '';
  String _totalProtein= '';
  String _totalCarb= '';
  String _totalFat= '';
  String _totalServing= '';
  String _ingredients= '';
  String _foodName= '';
  String _recipe= '';

  late TextEditingController _foodCountController;

  late RemoveFromMyCookBookBloc _removeFromMyCookBookBloc;
  Food newFood = Food();
  late AddOrUpdateMyFavoriteBloc _addOrUpdateMyFavoriteBloc;
  late MyFavoriteFoodsBloc _myFavoriteFoodsBloc;

   String _favoriteId= '';

  late GetLoggedFoodsBloc _getLoggedFoodsBloc;
  late LogFoodsBloc _logFoodsBloc;

  bool _removeBtnClicked= false;

  @override
  void initState() {
    super.initState();
    _addOrUpdateMyFavoriteBloc = context.read<AddOrUpdateMyFavoriteBloc>();
    _removeFromMyCookBookBloc = context.read<RemoveFromMyCookBookBloc>();
    _myFavoriteFoodsBloc = context.read<MyFavoriteFoodsBloc>();
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();
    _logFoodsBloc = context.read<LogFoodsBloc>();
    _foodCountController= TextEditingController(text: '1.0');
    _removeFromMyCookBookBloc.add(const RemoveFromMyCookBookEvent.onReset(),);
    _addOrUpdateMyFavoriteBloc.add(const AddOrUpdateMyFavoriteEvent.onReset(),);

    init();
  }



   void searchFoodInFavorites(Food food){
     _myFavoriteFoodsBloc.add(
       MyFavoriteFoodsEvent.onImmediateSearchInMyFavoriteFoods(
           food
       ),
     );
   }

  void requestLoggedFoods(){
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    _getLoggedFoodsBloc.add(
        GetLoggedFoodsEvent.onGetLoggedFoods(formattedDate)
    );
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
                 _removeBtnClicked= true;
                 _removeFromMyCookBookBloc.add(
                   RemoveFromMyCookBookEvent.onRemoveFromMyCookBook(
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
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
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
                FoodDetailArgumentModel argumentModel = FoodDetailArgumentModel(food: newFood,
                    macroEdition: widget.foodDetailArgumentModel.macroEdition);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditCookBookFoodScreen(foodDetailArgumentModel: argumentModel,),
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



                  Column(
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



                  ///add to favorite button
                  buildAddToFavoritesButton(context),

                  const SizedBox(height: 16,),


                  foodCount(),

                  const SizedBox(height: 16,),

                  ///log food button
                  buildLogFoodButton(context),


                  BlocConsumer<GetLoggedFoodsBloc, GetLoggedFoodsState>(
                      builder: (mcontext, state) {
                        if (state is GetLoggedFoodsLoadingState) {
                          return const GFLoader(
                            type: GFLoaderType.circle,
                            loaderColorOne: DARK_PRIMARY_COLOR,
                            loaderColorTwo: DARK_PRIMARY_COLOR,
                            loaderColorThree: DARK_PRIMARY_COLOR,
                          );
                        }else if(state is GetLoggedFoodsLoadedState){
                          _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            logFoodsOfToday(state.loggedFoods.foods);
                          });
                        }else if(state is GetLoggedFoodsErrorState){
                          _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            return showErrorToast(context, state.message);
                          });
                        }
                        return Container();
                      },
                      listener: (context, state){

                      }
                  ),
                  BlocConsumer<LogFoodsBloc, LogFoodsState>(
                      builder: (mcontext, state) {

                        if (state is LogFoodsLoadingState) {
                          return const GFLoader(
                            type: GFLoaderType.circle,
                            loaderColorOne: DARK_PRIMARY_COLOR,
                            loaderColorTwo: DARK_PRIMARY_COLOR,
                            loaderColorThree: DARK_PRIMARY_COLOR,
                          );
                        }else if(state is LogFoodsLoadedState){
                          _logFoodsBloc.add(const LogFoodsEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            showSuccessToast(context, LOGGED_SUCCESSFULLY);
                          });
                        }else if(state is LogFoodsErrorState){
                          _logFoodsBloc.add(const LogFoodsEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            return showErrorToast(context, state.message);
                          });
                        }
                        return Container();
                      },
                      listener: (context, state){

                      }
                  ),

                  BlocConsumer<RemoveFromMyCookBookBloc, RemoveFromMyCookBookState>(
                      builder: (mcontext, state) {
                        if (state is RemoveFromMyCookBookLoadingState) {
                          return const GFLoader(
                            type: GFLoaderType.circle,
                            loaderColorOne: DARK_PRIMARY_COLOR,
                            loaderColorTwo: DARK_PRIMARY_COLOR,
                            loaderColorThree: DARK_PRIMARY_COLOR,
                          );
                        }else if(state is RemoveFromMyCookBookLoadedState){
                          Future.delayed(Duration.zero,(){
                            _removeFromMyCookBookBloc.add(const RemoveFromMyCookBookEvent.onReset());
                            if(_removeBtnClicked){
                              Navigator.pop(context, newFood);
                            }
                          });
                        }else if(state is RemoveFromMyCookBookErrorState){
                          _removeFromMyCookBookBloc.add(const RemoveFromMyCookBookEvent.onReset());
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

                  BlocConsumer<MyFavoriteFoodsBloc, MyFavoriteFoodsState>(
                      builder: (context, state) {
                        if (state is MyFavoriteFoodsLoadingState) {
                          return const GFLoader(
                            type: GFLoaderType.circle,
                            loaderColorOne: DARK_PRIMARY_COLOR,
                            loaderColorTwo: DARK_PRIMARY_COLOR,
                            loaderColorThree: DARK_PRIMARY_COLOR,
                          );
                        }else if(state is MyFavoriteFoodsLoadedState){
                          Future.delayed(Duration.zero,(){
                            _myFavoriteFoodsBloc.add(const MyFavoriteFoodsEvent.onReset());
                          });
                        }else if(state is ImmediateSearchInFoodsLoadedState){
                          Future.delayed(Duration.zero,(){
                            _myFavoriteFoodsBloc.add(const MyFavoriteFoodsEvent.onReset());
                            setState(() {
                              _favoriteId= state.favoriteId;
                            });
                          });
                        }else if(state is MyFavoriteFoodsErrorState){
                          _myFavoriteFoodsBloc.add(const MyFavoriteFoodsEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            return showErrorToast(context, state.message);
                          });
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
    );
  }


  void init(){
    searchFoodInFavorites(widget.foodDetailArgumentModel.food ?? Food());
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


      newFood = widget.foodDetailArgumentModel.food!;
  }

  Widget buildLogFoodButton(BuildContext context){
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
                if(_foodCountController.text.isEmpty){
                  showErrorToast(context, ERROR_FOOD_COUNT_EMPTY);
                }else{
                  requestLoggedFoods();
                }
              },
              child: const Text(LOG_FOOD_LABEL,
                style: TextStyle( color: Colors.white),)
          ),
        ),
      ],
    );
  }


  Widget foodCount(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('$HOW_MANY_SERVINGS:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

        const SizedBox(width: 16,),
        GestureDetector(
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
              if(double.parse(_foodCountController.text) >= STEP_AMOUNT){
                _foodCountController = TextEditingController(text: (double.parse(_foodCountController.text) - STEP_AMOUNT).toString());
              }
            });
          },

        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: SizedBox(
              width: 60,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _foodCountController,
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
        GestureDetector(
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
              _foodCountController = TextEditingController(text: (double.parse(_foodCountController.text) + STEP_AMOUNT).toString());
            });
          },
        ),
      ],
    );
  }

  void logFoodsOfToday(List<Food> foodsLoggedBefore){
    List<Food> foods = [];

    foods.addAll(foodsLoggedBefore);

    newFood= newFood.copyWith(count: num.parse(_foodCountController.text).toDouble());

    foods.add(newFood);

    _logFoodsBloc.add(
        LogFoodsEvent.onLogFoods(foods)
    );
  }

  Widget buildAddToFavoritesButton(BuildContext context){
    String buttonText = '';
    if(_favoriteId.isEmpty){
      buttonText = ADD_TO_MY_FAVORTITE;
    }
     return  Visibility(
       visible: _favoriteId.isEmpty,
       child: Column(
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
                   addToFavoriteClickListener(context);
                 },
                 child: Text(buttonText,
                   style: const TextStyle( color: Colors.white),)
             ),
           ),
           BlocConsumer<AddOrUpdateMyFavoriteBloc, AddOrUpdateMyFavoriteState>(
               builder: (mcontext, state) {
                 if (state is AddOrUpdateMyFavoriteLoadingState) {
                   return const Stack(
                     children: [
                       GFLoader(
                         type: GFLoaderType.circle,
                         loaderColorOne: DARK_PRIMARY_COLOR,
                         loaderColorTwo: DARK_PRIMARY_COLOR,
                         loaderColorThree: DARK_PRIMARY_COLOR,
                       ),
                     ],
                   );
                 }else if(state is AddOrUpdateMyFavoriteLoadedState){
                   Future.delayed(Duration.zero,(){
                     _addOrUpdateMyFavoriteBloc.add(const AddOrUpdateMyFavoriteEvent.onReset());
                     showSuccessToast(context, FOOD_ADDED_TO_FAVORITE_MSG);
                   });
                 }else if(state is AddOrUpdateMyFavoriteErrorState){
                   _addOrUpdateMyFavoriteBloc.add(const AddOrUpdateMyFavoriteEvent.onReset());
                   Future.delayed(Duration.zero,(){
                     if(state.message == ERROR_FREE_USER_FAVORITE_FOOD_NOT_ALLOWED){
                       return showUpgradePopupForFreeUsers(context, UPGRADE_MSG_FAVORITE_FOOD);
                     }
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
     );
  }


  void addToFavoriteClickListener(BuildContext context){
    _addOrUpdateMyFavoriteBloc.add(
      AddOrUpdateMyFavoriteEvent.onAddToMyFavorite(
        newFood,
      ),
    );
  }

}
