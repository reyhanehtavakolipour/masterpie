

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/presentation/screen/search_foods_list_ui.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/debouncer.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import '../../../../main_screen.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
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
import '../bloc/groceries_bloc/groceries_bloc.dart';
import '../bloc/groceries_bloc/state_event/groceries_state_event.dart';
import '../bloc/log_foods_bloc/log_foods_bloc.dart';
import '../bloc/log_foods_bloc/state_event/log_foods_state_event.dart';
import '../bloc/remove_from_favorite_bloc/remove_from_my_favorite_bloc.dart';
import '../bloc/remove_from_favorite_bloc/state_event/remove_from_favorite_state_event.dart';
import '../food_calculator/food_calculator.dart';



class SearchFoodScreen extends StatefulWidget {

  const SearchFoodScreen({super.key});


  @override
  State<SearchFoodScreen> createState() => _SearchFoodScreenState();
}


class _SearchFoodScreenState extends State<SearchFoodScreen> {


  late TextEditingController _searchController;

  late GroceriesBloc _groceriesBloc;
  late AddOrUpdateMyFavoriteBloc _addToMyFavoriteBloc;
  late GetLoggedFoodsBloc _getLoggedFoodsBloc;
  late LogFoodsBloc _logFoodsBloc;

  List<Food> _addedGroceries= [];

  List<Food> _newGroceries= [];

  bool _backButtonCLicked = false;

  final _debouncer = Debouncer(milliseconds: 1000);


  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _groceriesBloc = context.read<GroceriesBloc>();
    _addToMyFavoriteBloc = context.read<AddOrUpdateMyFavoriteBloc>();
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();
    _logFoodsBloc = context.read<LogFoodsBloc>();
    _searchController.addListener(_onSearchChanged);

    requestFoodsList();

  }

  void addToFavorites(Food food, bool isAddToFavorite){
    _addToMyFavoriteBloc.add(
      AddOrUpdateMyFavoriteEvent.onAddToMyFavorite(
          food
      ),
    );
  }

  void checkIfGroceriesAddedBefore(List<Food> foods){
    setState(() {
      List<Food> groceries = [];
      foods.forEach((element) {
        List<Food> foodsExisted = _addedGroceries.where((addedGrocery) => element.id == addedGrocery.id).toList();
        if(foodsExisted.isEmpty){
          groceries.add(element);
        }else{
          for(int i = 0; i < _addedGroceries.length; i++){
            if(_addedGroceries[i].id == element.id){
              groceries.add(_addedGroceries[i]);
            }
          }
        }
      });
      _newGroceries = groceries;
    });
  }


  void updateChangedGroceries(List<Food> foods) {
    setState(() {

      _newGroceries = foods;

      List<Food> groceries = [];
      foods.forEach((element) {
        List<Food> foodsExisted = _addedGroceries.where((addedGrocery) => element.id == addedGrocery.id).toList();
        if(foodsExisted.isEmpty && element.count > 0){
          groceries.add(element);
        }else{
          for(int i = 0; i < _addedGroceries.length; i++){
            if(_addedGroceries[i].id == element.id){
              _addedGroceries[i] = _addedGroceries[i].copyWith(
                count: element.count,
                units: element.units,
                servingAmounts: element.servingAmounts,
                calorie: element.calorie,
                protein: element.protein,
                carb: element.carb,
                fat: element.fat
              );
            }
          }
        }
      });
      _addedGroceries.addAll(groceries);
    });
  }


  void _onSearchChanged() {
    setState(() {

    });
    _debouncer.run(() {
      requestFoodsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  PopScope(
      canPop: false,
      onPopInvoked : (didPop){
      },
      child: MaterialApp(
        theme: ThemeData(fontFamily: MONTSERRAT_FONT),
        home: Scaffold(
          /// App bar
              appBar: AppBar(
                title: const Text(SEARCH_FOOD_LABEL, style: TextStyle(color: Colors.white)),
                backgroundColor: PRIMARY_COLOR,
                leading: GestureDetector(
                  onTap: () {
                    if(_addedGroceries.isEmpty){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),);
                    }else{
                      _backButtonCLicked = true;
                      requestLoggedFoods();
                    }
                  },
                  child: const SizedBox(
                    width: 48,
                    height: double.infinity,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                actions: [

                ],
              ),


              body: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12,),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              /// search bar
                              Row(
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
                                      requestFoodsList();
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),


                        const SizedBox(height: 12,),

                        /// Groceries list
                        SearchFoodsListUi(foodCalculator: FoodCalculator(visibleFoods: _newGroceries), foods: _newGroceries, onFoodsChanged: updateChangedGroceries,
                          onFavoriteButtonClicked: addToFavorites, foodsTypeRequested: const [FoodType.groceryProduct],
                          foodBackGroundColor: DEFAULT_FOOD_BACKGROUND_COLOR, foodIcon: const Icon(Icons.fastfood, color: Colors.blueGrey,), macroEdition: true,),
                      ],
                    ),
                  ),


                  BlocConsumer<GroceriesBloc, GroceriesState>(
                      builder: (context, state) {

                        if (state is GroceriesLoadingState) {
                          return const GFLoader(
                            type: GFLoaderType.circle,
                            loaderColorOne: DARK_PRIMARY_COLOR,
                            loaderColorTwo: DARK_PRIMARY_COLOR,
                            loaderColorThree: DARK_PRIMARY_COLOR,
                          );
                        }else if(state is GroceriesLoadedState){
                          Future.delayed(Duration.zero,(){
                            _groceriesBloc.add(const GroceriesEvent.onReset());
                            // checkIfGroceriesAddedBefore(state.foods);
                          });

                        }else if(state is GroceriesErrorState){
                          _groceriesBloc.add(const GroceriesEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            return showErrorToast(context, state.message);
                          });
                        }
                        return Container();
                      },
                      listener: (context, state){
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


                  BlocConsumer<AddOrUpdateMyFavoriteBloc, AddOrUpdateMyFavoriteState>(
                      builder: (context, state) {
                        return Container(height: 1,);
                      },
                      listener: (context, state){
                        if(state is AddOrUpdateMyFavoriteLoadedState){
                          requestFoodsList();
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
                          requestFoodsList();
                        }
                      }
                  ),
                ],
              ),
            ),
      ),
    );
  }

  void requestFoodsList(){
    _groceriesBloc.add(
      GroceriesEvent.onGetGroceries(_searchController.text),
    );
  }

  void logFoodsOfToday(List<Food> foodsLoggedBefore){
    List<Food> foods = [];

    foods.addAll(foodsLoggedBefore);
    foods.addAll(_addedGroceries);

    _logFoodsBloc.add(
        LogFoodsEvent.onLogFoods(foods)
    );

  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void requestLoggedFoods(){
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    _getLoggedFoodsBloc.add(
        GetLoggedFoodsEvent.onGetLoggedFoods(formattedDate)
    );
  }
}


