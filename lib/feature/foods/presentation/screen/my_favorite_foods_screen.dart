

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/debouncer.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/foods_list_ui.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/food_detail_argument_model.dart';
import '../../../../main_screen.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/size/app_widget_size.dart';
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
import '../bloc/my_favorite_foods/state_event/my_favorite_foods_state_event.dart';
import '../bloc/remove_from_favorite_bloc/remove_from_my_favorite_bloc.dart';
import '../bloc/remove_from_favorite_bloc/state_event/remove_from_favorite_state_event.dart';
import '../food_calculator/food_calculator.dart';
import 'food_detail_screen.dart';

class MyFavoriteFoodsScreen extends StatefulWidget {

  const MyFavoriteFoodsScreen({Key? key}) : super(key: key);

  static const routeName = '/my-favorite-foods-screen';


  @override
  State<MyFavoriteFoodsScreen> createState() => _MyFavoriteFoodsScreenState();
}



class _MyFavoriteFoodsScreenState extends State<MyFavoriteFoodsScreen>{

  late MyFavoriteFoodsBloc _myFavoriteFoodsBloc;
  late AddOrUpdateMyFavoriteBloc _addToMyFavoriteBloc;
  late RemoveFromMyFavoriteBloc _removeFromMyFavoriteBloc;
  late GetLoggedFoodsBloc _getLoggedFoodsBloc;
  late LogFoodsBloc _logFoodsBloc;

  late TextEditingController _searchController;

  bool _backButtonCLicked = false;

  List<Food> _addedMyFavorites= [];

  List<Food> _newMyFavorites= [];


  final _debouncer = Debouncer(milliseconds: 1000);

  @override
  void initState() {
    super.initState();
    _myFavoriteFoodsBloc = context.read<MyFavoriteFoodsBloc>();
    _addToMyFavoriteBloc = context.read<AddOrUpdateMyFavoriteBloc>();
    _removeFromMyFavoriteBloc = context.read<RemoveFromMyFavoriteBloc>();
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();
    _logFoodsBloc = context.read<LogFoodsBloc>();
    _searchController = TextEditingController();

     requestMyFavoriteFoods();

    _searchController.addListener(_onSearchChanged);

  }

  void _onSearchChanged() {
    setState(() {

    });
    _debouncer.run(() {
      requestMyFavoriteFoods();
    });
  }

  void requestLoggedFoods(){
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    _getLoggedFoodsBloc.add(
        GetLoggedFoodsEvent.onGetLoggedFoods(formattedDate)
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
            title: const Text(MY_FAVORITE_FOOD_LABEL, style: TextStyle(color: Colors.white),),
            backgroundColor: PRIMARY_COLOR,
            leading: GestureDetector(
              onTap: () {
                _backButtonCLicked = true;
                requestLoggedFoods();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 24,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.add, color: Colors.white,),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodDetailScreen(
                        foodDetailArgumentModel: FoodDetailArgumentModel(foodsListScreen: FoodsListScreen.MY_FAVORITE_FOODS_SCREEN),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          body:
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child:Stack(
              children: [
                SingleChildScrollView(
                  child:
                  Column(
                    children: [
                      /// search bar
                      Visibility(
                        visible: false,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: SEARCH_BAR_HEIGHT,
                                child: TextField(
                                  controller: _searchController,
                                  decoration: const InputDecoration(
                                    hintText: CHEDDAR_CHEESE_LABEL,
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
                            ),
                            const SizedBox(width: 8,),
                            GestureDetector(
                              child: const CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.orange,
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                requestMyFavoriteFoods();
                              },
                            )
                          ],
                        ),
                      ),




                      /// My favorite list
                      FoodsListUi(foodCalculator: FoodCalculator(visibleFoods: _newMyFavorites), foods: _newMyFavorites, onFoodsChanged: updateChangedFavoriteFoods,
                          onFavoriteButtonClicked: addOrRemoveFavorite, foodsTypeRequested: const [FoodType.groceryProduct, FoodType.meal],
                          foodBackGroundColor: MY_FAVORITE_FOOD_BACKGROUND_COLOR, foodIcon: const Icon(Icons.favorite, color: RED_ERROR_COLOR,),
                        foodDetailScreenType: FoodDetailScreenType.VIEW_FAVORITE, foodsListScreen: FoodsListScreen.MY_FAVORITE_FOODS_SCREEN, macroEdition: true,),

                    ],
                  ),
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
                          checkIfFavoriteFoodsAddedBefore(state.foods);
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
                      return Container(height: 1,);
                    },
                    listener: (context, state){
                      if(state is RemoveFromMyFavoriteLoadedState){
                        requestMyFavoriteFoods();
                      }
                    }
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
                        if(_backButtonCLicked){
                          _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            logFoodsOfToday(state.loggedFoods.foods);
                          });
                        }
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
                        if(_backButtonCLicked){
                          _logFoodsBloc.add(const LogFoodsEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            _backButtonCLicked = false;
                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => const MainScreen(),
                            ),);
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
              ],
            )
          ),
        ),
      ),
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


  void addOrRemoveFavorite(Food food, bool addToFavorite){
    if(addToFavorite){
      _addToMyFavoriteBloc.add(
        AddOrUpdateMyFavoriteEvent.onAddToMyFavorite(
            food
        ),
      );
    }else{
      _removeFromMyFavoriteBloc.add(
        RemoveFromMyFavoriteEvent.onRemoveFromMyFavorite(
            food
        ),
      );
    }
  }

  void requestMyFavoriteFoods(){
    _myFavoriteFoodsBloc.add(
      MyFavoriteFoodsEvent.onGetMyFavoriteFoods(
          FoodType.all,
          _searchController.text
      ),
    );
  }

}
