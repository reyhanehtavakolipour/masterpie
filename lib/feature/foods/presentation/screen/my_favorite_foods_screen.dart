

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/presentation/bloc/my_favorite_foods/state_event/my_favorite_foods_state_event.dart';
import 'package:masterpie/feature/foods/presentation/bloc/remove_from_favorite_bloc/state_event/remove_from_favorite_state_event.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/logged_food_chip_widget.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/food_detail_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/view_favorite_food_screen.dart';
import '../../../../main_screen.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../data/repository_impl/foods_repository_impl.dart';
import '../../domain/model/food_model.dart';
import '../../domain/model/food_type.dart';
import '../bloc/add_or_update_my_favorite_bloc/add_or_update_my_favorite_bloc.dart';
import '../bloc/add_or_update_my_favorite_bloc/state_event/add_or_update_my_favorite_state_event.dart';
import '../bloc/get_logged_foods_bloc/get_logged_foods_bloc.dart';
import '../bloc/get_logged_foods_bloc/state_event/get_logged_foods_state_event.dart';
import '../bloc/log_foods_bloc/log_foods_bloc.dart';
import '../bloc/log_foods_bloc/state_event/log_foods_state_event.dart';
import '../bloc/my_favorite_foods/my_favorite_foods_bloc.dart';
import '../bloc/remove_from_favorite_bloc/remove_from_my_favorite_bloc.dart';
import '../food_calculator/food_calculator.dart';
import 'my_favorite_foods_list_ui.dart';

class MyFavoriteFoodsScreen extends StatefulWidget {

  const MyFavoriteFoodsScreen({Key? key}) : super(key: key);


  @override
  State<MyFavoriteFoodsScreen> createState() => _MyFavoriteFoodsScreenState();
}



class _MyFavoriteFoodsScreenState extends State<MyFavoriteFoodsScreen>{

  late MyFavoriteFoodsBloc _myFavoriteFoodsBloc;
  late AddOrUpdateMyFavoriteBloc _addToMyFavoriteBloc;
  late RemoveFromMyFavoriteBloc _removeFromMyFavoriteBloc;

  late GetLoggedFoodsBloc _getLoggedFoodsBloc;
  late LogFoodsBloc _logFoodsBloc;

  bool _logButtonCLicked = false;

  bool _isAddedFoodBannerOpen= false;

  List<Food> _addedMyFavorites= [];

  List<Food> _newMyFavorites= [];


  @override
  void initState() {
    super.initState();
    _myFavoriteFoodsBloc = context.read<MyFavoriteFoodsBloc>();
    _removeFromMyFavoriteBloc = context.read<RemoveFromMyFavoriteBloc>();
    _addToMyFavoriteBloc = context.read<AddOrUpdateMyFavoriteBloc>();
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();
    _logFoodsBloc = context.read<LogFoodsBloc>();

    requestMyFavoriteFoods();
  }


  void requestLoggedFoods(){
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    _getLoggedFoodsBloc.add(
        GetLoggedFoodsEvent.onGetLoggedFoods(formattedDate)
    );
  }


  Widget logFoodButton(){
    bool isAnyFoodAdded= false;
    List<Food> foodsLog = [];
    _addedMyFavorites.forEach((element) {
      if(element.count > 0){
        isAnyFoodAdded= true;
        foodsLog.add(element);
      }
    });

    return Visibility(
      visible: isAnyFoodAdded,
      child: Positioned(
        bottom: 16,
        left: 16,
        right: 16,
        child: Column(
          children: [

            /// up arrow
            GestureDetector(
              onTap: (){
                if(_isAddedFoodBannerOpen){
                  setState(() {
                    _isAddedFoodBannerOpen= false;
                  });
                }else{
                  setState(() {
                    _isAddedFoodBannerOpen= true;
                  });
                }
              },

              child: Column(
                children: [
                  Visibility(
                    visible: !_isAddedFoodBannerOpen,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: LOG_FOOD_BTN_COLOR
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_drop_up,
                          color: DARK_PRIMARY_COLOR,
                        ),
                      ),
                    ),
                  ),

                  Visibility(
                      visible: _isAddedFoodBannerOpen,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: LOG_FOOD_BTN_COLOR
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              width: double.infinity,
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: DARK_PRIMARY_COLOR,
                              ),
                            ),


                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Wrap(
                                  spacing: 8.0,
                                  children: List.generate(
                                    foodsLog.length,
                                        (index) => ChipWidget(
                                      text: foodsLog[index].name,
                                      onRemove: () {
                                        setState(() {

                                          for(int i = 0; i < _newMyFavorites.length; i++){
                                            if(_newMyFavorites[i].id == foodsLog[index].id){
                                              _newMyFavorites[i]= _newMyFavorites[i].copyWith(count: 0);
                                            }
                                          }


                                          for(int i = 0; i < _addedMyFavorites.length; i++){
                                            if(_addedMyFavorites[i].id == foodsLog[index].id){
                                              _addedMyFavorites[i]= _addedMyFavorites[i].copyWith(count: 0);
                                            }
                                          }

                                          updateChangedFavoriteFoods(_newMyFavorites);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      )
                  )
                ],
              ),
            ),

            /// log food button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: LOG_FOOD_BTN_COLOR
                  ),
                  onPressed: () {
                    _logButtonCLicked = true;
                    requestLoggedFoods();
                  },
                  child: const Text(SUBMIT_LOG_FOODS_LABEL,
                    style: TextStyle( color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),)
              ),
            ),
          ],
        ),
      ),
    );
  }
  Food checkFoodParameters(Food food){

    List<String> ingredients = [];
    ingredients.addAll(food.ingredients);
    ingredients.removeWhere((item) => item.isEmpty);


    List<String> calorie = [];
    calorie.addAll(food.calorie);
    calorie.removeWhere((item) => item.isEmpty);


    List<String> protein = [];
    protein.addAll(food.protein);
    protein.removeWhere((item) => item.isEmpty);


    List<String> carb = [];
    carb.addAll(food.carb);
    carb.removeWhere((item) => item.isEmpty);


    List<String> fat = [];
    fat.addAll(food.fat);
    fat.removeWhere((item) => item.isEmpty);


    List<String> servingAmounts = [];
    servingAmounts.addAll(food.servingAmounts);
    servingAmounts.removeWhere((item) => item.isEmpty);

    List<String> servingUnits = [];
    servingUnits.addAll(food.units);
    servingUnits.removeWhere((item) => item.isEmpty);


    List<String> servingIngredientCounts = [];
    servingIngredientCounts.addAll(food.servingIngredientsCount);
    servingIngredientCounts.removeWhere((item) => item.isEmpty);


    return food.copyWith(
        ingredients: ingredients,
        calorie:  calorie,
        protein: protein,
        carb: carb,
        fat: fat,
        servingAmounts: servingAmounts,
        units: servingUnits,
        servingIngredientsCount: servingIngredientCounts
    );
  }



  void onFavoriteFoodClicked(Food food){
    FoodDetailArgumentModel argumentModel = FoodDetailArgumentModel(
        food: checkFoodParameters(food),
        macroEdition: true
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewFavoriteFoodScreen(foodDetailArgumentModel: argumentModel,),
      ),
    ).then((result) {
      setState(() {
        _newMyFavorites.remove(result);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT,),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(MY_FAVORITE_LABEL, style: TextStyle(color: Colors.white),),
          backgroundColor: PRIMARY_COLOR,
          leading: GestureDetector(
            onTap: () {
              if (Navigator.of(context).canPop()){
                Navigator.pop(context);
              }else{
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    ), (route) => false
                );
              }
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24,
            ),
          ),
          actions: [
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child:Stack(
              children: [
                SingleChildScrollView(
                  child:
                  Column(
                    children: [

                      /// My favorite list
                      MyFavoritesFoodsListUi(foodCalculator: FoodCalculator(visibleFoods: _newMyFavorites), foods: _newMyFavorites, onFoodsChanged: updateChangedFavoriteFoods,
                        onRemoveButtonClicked: removeFavorite, onFavoriteFoodClicked: onFavoriteFoodClicked, foodsTypeRequested: const [FoodType.groceryProduct, FoodType.meal],
                        foodBackGroundColor: DEFAULT_FOOD_BACKGROUND_COLOR, foodIcon: const Icon(Icons.favorite, color: RED_ERROR_COLOR,),
                        macroEdition: true,),

                    ],
                  ),
                ),


                logFoodButton(),


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
                          checkIfFavoriteFoodsAddedBefore(state.foods);
                        });
                      }else if(state is MyFavoriteFoodsLoadedImmediatelyState){
                        Future.delayed(Duration.zero,(){
                          _myFavoriteFoodsBloc.add(const MyFavoriteFoodsEvent.onReset());
                          checkIfFavoriteFoodsAddedBefore(state.foods);
                        });
                      }else if(state is MyFavoriteFoodsErrorState){
                        if(UserRegistrationStatus.userAccountId.isNotEmpty){
                          _myFavoriteFoodsBloc.add(const MyFavoriteFoodsEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            return showErrorToast(context, state.message);
                          });
                        }
                      }
                      return Container();
                    },
                    listener: (context, state){

                    }
                ),
                BlocConsumer<AddOrUpdateMyFavoriteBloc, AddOrUpdateMyFavoriteState>(
                    builder: (context, state) {
                      return Container(height: 1,);
                    },
                    listener: (context, state){
                      if(state is AddOrUpdateMyFavoriteLoadedState){
                        requestMyFavoriteFoods();
                      }else if(state is AddOrUpdateMyFavoriteErrorState){
                        _addToMyFavoriteBloc.add(const AddOrUpdateMyFavoriteEvent.onReset());
                        Future.delayed(Duration.zero,(){
                          if(state.message == ERROR_FREE_USER_FAVORITE_FOOD_NOT_ALLOWED){
                            return showUpgradePopupForFreeUsers(context, UPGRADE_MSG_FAVORITE_FOOD);
                          }
                          return showErrorToast(context, state.message);
                        });
                      }else{
                      }
                    }
                ),
                BlocConsumer<RemoveFromMyFavoriteBloc, RemoveFromMyFavoriteState>(
                    builder: (context, state) {
                      if(state is RemoveFromMyFavoriteLoadedState){
                        Future.delayed(Duration.zero,(){
                          _removeFromMyFavoriteBloc.add(const RemoveFromMyFavoriteEvent.onReset());
                          requestMyFavoriteFoods();
                          showSuccessToast(context, REMOVED_FROM_FAVORITE_SUCCESSFULLY);
                        });
                      }
                      return Container(height: 1,);
                    },
                    listener: (mcontext, state){
                    }
                ),



                Visibility(
                  visible: _newMyFavorites.isEmpty,
                  child: Center(
                      child: Container(
                        margin: const EdgeInsets.all(64),

                        child: const Text(EMPTY_FAVORITE_LABEL, style: TextStyle(color: PRIMARY_COLOR, fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                      )
                  ),
                ),



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
                        if(_logButtonCLicked){
                          _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            logFoodsOfToday(state.loggedFoods.foods);
                          });
                        }
                      }else if(state is GetLoggedFoodsErrorState){
                        FocusScope.of(context).unfocus();
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
                        if(_logButtonCLicked){
                          _logFoodsBloc.add(const LogFoodsEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            _logButtonCLicked = false;
                            Navigator.pop(context);
                          });
                        }
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
              ]
            )
        ),
      )
    );
  }


  void checkIfFavoriteFoodsAddedBefore(List<Food> foods){
    setState(() {
      List<Food> favorites = [];
      foods.forEach((element) {
        List<Food> foodsExisted = _addedMyFavorites.where((addedFavorite) => element.id == addedFavorite.id).toList();
        if(foodsExisted.isEmpty){
          favorites.add(element);
        }else{
          for(int i = 0; i < _addedMyFavorites.length; i++){
            if(_addedMyFavorites[i].id == element.id){
              favorites.add(_addedMyFavorites[i]);
            }
          }
        }
      });
      _newMyFavorites = favorites;
    });
  }



  void logFoodsOfToday(List<Food> foodsLoggedBefore){
    List<Food> foods = [];

    foods.addAll(foodsLoggedBefore);
    foods.addAll(_addedMyFavorites);

    _logFoodsBloc.add(
        LogFoodsEvent.onLogFoods(foods)
    );
  }

  void updateChangedFavoriteFoods(List<Food> foods) {
    setState(() {

      _newMyFavorites = foods;

      List<Food> myFavorites = [];
      _newMyFavorites.forEach((element) {
        List<Food> foodsExisted = _addedMyFavorites.where((addedFavorite) => element.id == addedFavorite.id).toList();
        if(foodsExisted.isEmpty && element.count > 0){
          myFavorites.add(element);
        }else{
          for(int i = 0; i < _addedMyFavorites.length; i++){
            if(_addedMyFavorites[i].id == element.id){
              _addedMyFavorites[i] = _addedMyFavorites[i].copyWith(
                  count: element.count,
                  units: element.units,
                  servingAmounts: element.servingAmounts,
                  calorie: element.calorie,
                  protein: element.protein,
                  carb: element.carb,
                  fat: element.fat,
                  unit: element.unit,
                  servingAmount: element.servingAmount
              );
            }
          }
        }
      });
      _addedMyFavorites.addAll(myFavorites);
    });
  }


  void removeFavorite(Food food){
    _removeFromMyFavoriteBloc.add(
      RemoveFromMyFavoriteEvent.onRemoveFromMyFavorite(
          food
      ),
    );
  }

  void requestMyFavoriteFoods(){
    _myFavoriteFoodsBloc.add(
      const MyFavoriteFoodsEvent.onGetMyFavoriteFoods(
          FoodType.all, ''
      ),
    );
  }

}
