

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/presentation/bloc/add_or_update_my_cook_book_bloc/add_or_update_my_cook_book_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/add_or_update_my_cook_book_bloc/state_event/add_or_update_my_cook_book_state_event.dart';
import 'package:masterpie/feature/foods/presentation/food_calculator/generic_food_calculator.dart';
import 'package:masterpie/feature/foods/presentation/screen/search_recipe_list_ui.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/debouncer.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/logged_food_chip_widget.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/generic_food_detail_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model_converter.dart';
import 'package:masterpie/feature/foods/presentation/screen/view_recipe_screen.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../data/repository_impl/foods_repository_impl.dart';
import '../../domain/model/food_model.dart';
import '../../domain/model/food_type.dart';
import '../bloc/get_logged_foods_bloc/get_logged_foods_bloc.dart';
import '../bloc/get_logged_foods_bloc/state_event/get_logged_foods_state_event.dart';
import '../bloc/log_foods_bloc/log_foods_bloc.dart';
import '../bloc/log_foods_bloc/state_event/log_foods_state_event.dart';
import '../bloc/recipes_bloc/recipes_bloc.dart';
import '../bloc/recipes_bloc/state_event/recipes_state_event.dart';




class SearchRecipeScreen extends StatefulWidget {

  const SearchRecipeScreen({super.key});


  @override
  State<SearchRecipeScreen> createState() => _SearchRecipeScreenState();
}


class _SearchRecipeScreenState extends State<SearchRecipeScreen> {


  late TextEditingController _searchController;

  late RecipesBloc _recipeBloc;
  late AddOrUpdateMyCookBookBloc _addToMyCookBookBloc;
  late GetLoggedFoodsBloc _getLoggedFoodsBloc;
  late LogFoodsBloc _logFoodsBloc;

  List<Food> _addedRecipes= [];

  bool _isAddedFoodBannerOpen= false;

  List<GenericFood> _newRecipes= [];

  bool _logButtonCLicked = false;

  final _debouncer = Debouncer(milliseconds: 1000);


  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _recipeBloc = context.read<RecipesBloc>();
    _addToMyCookBookBloc = context.read<AddOrUpdateMyCookBookBloc>();
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();
    _logFoodsBloc = context.read<LogFoodsBloc>();
    _searchController.addListener(_onSearchChanged);

    requestFoodsList();

  }

  void addToCookBook(Food food){
    _addToMyCookBookBloc.add(
      AddOrUpdateMyCookBookEvent.onAddOrUpdateMyCookBook(
          food
      ),
    );
  }


  void onRecipeClicked(GenericFood food){
    GenericFoodDetailArgumentModel argumentModel = GenericFoodDetailArgumentModel(
        food: food,
        macroEdition: true
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewRecipeScreen(foodDetailArgumentModel: argumentModel,),
      ),
    );
  }


  void updateChangedRecipes(List<Food> foods) {
    setState(() {

      _newRecipes = toGenericFoods(foods);

      List<Food> recipes = [];
      foods.forEach((element) {
        List<Food> foodsExisted = _addedRecipes.where((addedRecipe) => element.id == addedRecipe.id).toList();
        if(foodsExisted.isEmpty && element.count > 0){
          recipes.add(element);
        }else{
          for(int i = 0; i < _addedRecipes.length; i++){
            if(_addedRecipes[i].id == element.id){
              _addedRecipes[i] = _addedRecipes[i].copyWith(
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
      _addedRecipes.addAll(recipes);
    });
  }


  List<GenericFood> toGenericFoods(List<Food> foods){
    return foods.map((element) =>
        GenericFood(
            count: element.count,
            units: [element.units],
            servingAmounts: [element.servingAmounts],
            calorie: [element.calorie],
            protein: [element.protein],
            carb: [element.carb],
            fat: [element.fat],
            foodType: element.foodType,
          name: element.name,
          id: element.id
        )
    ).toList();
  }


  void _onSearchChanged() {
    setState(() {

    });
    _debouncer.run(() {
      requestFoodsList();
    });
  }


  Widget logFoodButton(){
    bool isAnyFoodAdded= false;
    List<Food> foodsLog = [];
    _addedRecipes.forEach((element) {
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
                                        (index) => LoggedFoodChipWidget(
                                      text: foodsLog[index].name,
                                      onRemove: () {
                                        setState(() {

                                          for(int i = 0; i < _newRecipes.length; i++){
                                            if(_newRecipes[i].id == foodsLog[index].id){
                                              _newRecipes[i]= _newRecipes[i].copyWith(count: 0);
                                            }
                                          }


                                          for(int i = 0; i < _addedRecipes.length; i++){
                                            if(_addedRecipes[i].id == foodsLog[index].id){
                                              _addedRecipes[i]= _addedRecipes[i].copyWith(count: 0);
                                            }
                                          }


                                          List<Food> foods= [];
                                          _newRecipes.forEach((food) {
                                            foods.add(fromGenericFood(food));
                                          });

                                          updateChangedRecipes(foods);
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




  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /// App bar
        appBar: AppBar(
          title: const Text(SEARCH_RECIPE_LABEL, style: TextStyle(color: Colors.white)),
          backgroundColor: PRIMARY_COLOR,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
                                    hintText: PASTA_LABEL,
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

                  /// recipes list
                  SearchRecipesListUi(foodCalculator: GenericFoodCalculator(visibleFoods: _newRecipes), foods: _newRecipes, onFoodsChanged: updateChangedRecipes,
                    onAddToCookBookButtonClicked: addToCookBook, onRecipeClicked: onRecipeClicked, foodsTypeRequested: const [FoodType.groceryProduct],
                    foodBackGroundColor: DEFAULT_FOOD_BACKGROUND_COLOR, foodIcon: const Icon(Icons.fastfood, color: Colors.blueGrey,), macroEdition: true,),
                ],
              ),
            ),

            logFoodButton(),


            BlocConsumer<RecipesBloc, RecipesState>(
                builder: (context, state) {

                  if (state is RecipesLoadingState) {
                    return const GFLoader(
                      type: GFLoaderType.circle,
                      loaderColorOne: DARK_PRIMARY_COLOR,
                      loaderColorTwo: DARK_PRIMARY_COLOR,
                      loaderColorThree: DARK_PRIMARY_COLOR,
                    );
                  }else if(state is RecipesLoadedState){
                    Future.delayed(Duration.zero,(){
                      setState(() {
                        _newRecipes= [];
                        _newRecipes.addAll(state.foods);
                        _recipeBloc.add(const RecipesEvent.onReset());
                      });
                    });
                  }else if(state is RecipesErrorState){
                    _recipeBloc.add(const RecipesEvent.onReset());
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
                    if(_logButtonCLicked){
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


            BlocConsumer<AddOrUpdateMyCookBookBloc, AddOrUpdateMyCookBookState>(
                builder: (mcontext, state) {
                  if(state is AddOrUpdateMyCookBookLoadedState){
                    _addToMyCookBookBloc.add(const AddOrUpdateMyCookBookEvent.onReset());
                    Future.delayed(Duration.zero,(){
                      showSuccessToast(context, FOOD_ADDED_COOKBOOK_SUCCESS);
                    });
                  }else if(state is AddOrUpdateMyCookBookErrorState){
                    _addToMyCookBookBloc.add(const AddOrUpdateMyCookBookEvent.onReset());
                    Future.delayed(Duration.zero,(){
                      if(state.message == ERROR_FREE_USER_COOKBOOK_FOOD_NOT_ALLOWED){
                        return showUpgradePopupForFreeUsers(context, UPGRADE_MSG_COOKBOOK_FOOD);
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
      ),
    );
  }

  void requestFoodsList(){
    _recipeBloc.add(
      RecipesEvent.onGetRecipes(_searchController.text),
    );
  }

  void logFoodsOfToday(List<Food> foodsLoggedBefore){
    List<Food> foods = [];

    foods.addAll(foodsLoggedBefore);
    foods.addAll(_addedRecipes);

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


