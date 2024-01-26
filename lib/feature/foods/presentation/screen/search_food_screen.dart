

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/custom_radio_button.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/debouncer.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/filter_food_dialog.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/foods_list_ui.dart';
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
import '../bloc/international_meals_bloc/international_meals_bloc.dart';
import '../bloc/international_meals_bloc/state_event/international_meals_state_event.dart';
import '../bloc/log_foods_bloc/log_foods_bloc.dart';
import '../bloc/log_foods_bloc/state_event/log_foods_state_event.dart';
import '../bloc/my_favorite_foods/my_favorite_foods_bloc.dart';
import '../bloc/my_favorite_foods/state_event/my_favorite_foods_state_event.dart';
import '../bloc/remove_from_favorite_bloc/remove_from_my_favorite_bloc.dart';
import '../bloc/remove_from_favorite_bloc/state_event/remove_from_favorite_state_event.dart';
import '../food_calculator/food_calculator.dart';
import 'food_detail_screen.dart';

const String GROCERIES_RESOURCE = 'groceries_resource';
const String MY_FAVORITE_RESOURCE = 'my_favorite_resource';
const String INTERNATIONAL_MEALS_RESOURCE = 'international_meals_resource';


class SearchFoodScreen extends StatefulWidget {

  static const routeName = '/search-food-screen';


  const SearchFoodScreen({super.key});


  @override
  State<SearchFoodScreen> createState() => _SearchFoodScreenState();
}


class _SearchFoodScreenState extends State<SearchFoodScreen> {


  String _foodsResource= ALL_LABEL;

  final List<FoodType> _foodsTypeRequested = [FoodType.groceryProduct, FoodType.meal];

  late TextEditingController _searchController;

  late TextEditingController _newFoodNameController;
  late TextEditingController _newFoodServingController;
  late TextEditingController _newFoodUnitController;
  late TextEditingController _newFoodCalorieController;
  late TextEditingController _newFoodProteinController;
  late TextEditingController _newFoodCarbController;
  late TextEditingController _newFoodFatController;
  Color _newFoodNameBorderColor = DARK_PRIMARY_COLOR;
  String _newFoodType = GROCERY_LABEL;


  late GroceriesBloc _groceriesBloc;
  late AddOrUpdateMyFavoriteBloc _addToMyFavoriteBloc;
  late RemoveFromMyFavoriteBloc _removeFromMyFavoriteBloc;
  late MyFavoriteFoodsBloc _myFavoriteFoodsBloc;
  late InternationalMealsBloc _internationalMealsBloc;
  late GetLoggedFoodsBloc _getLoggedFoodsBloc;
  late LogFoodsBloc _logFoodsBloc;


  List<Food> _addedGroceries= [];
  List<Food> _addedMyFavorites= [];

  List<Food> _newGroceries= [];
  List<Food> _newMyFavorites= [];

  bool _createNewClicked= false;


  bool _backButtonCLicked = false;

  final _debouncer = Debouncer(milliseconds: 1000);


  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _newFoodNameController= TextEditingController();
    _newFoodCalorieController= TextEditingController();
    _newFoodProteinController= TextEditingController();
    _newFoodCarbController= TextEditingController();
    _newFoodFatController= TextEditingController();
    _newFoodServingController= TextEditingController(text: '100');
    _newFoodUnitController= TextEditingController(text: GRAM_LABEL);
    _groceriesBloc = context.read<GroceriesBloc>();
    _addToMyFavoriteBloc = context.read<AddOrUpdateMyFavoriteBloc>();
    _removeFromMyFavoriteBloc = context.read<RemoveFromMyFavoriteBloc>();
    _myFavoriteFoodsBloc = context.read<MyFavoriteFoodsBloc>();
    _internationalMealsBloc = context.read<InternationalMealsBloc>();
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();
    _logFoodsBloc = context.read<LogFoodsBloc>();

    _searchController.addListener(_onSearchChanged);

    requestFoodsList();

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


  void _onSearchChanged() {
    setState(() {

    });
    _debouncer.run(() {
      requestFoodsList();
    });
  }


  void updateSelectedFoodType(String type){
    setState(() {
      _newFoodType = type;
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
                    icon: const Icon(Icons.filter_alt, color: Colors.white,),
                    onPressed: () {
                      showFoodRequestDialog(context, _foodsResource).then((value){
                        setState(() {
                          _foodsResource= value;
                        });
                        requestFoodsList();
                      });
                    },
                  ),
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


                              Visibility(
                                  visible: _searchController.text.isNotEmpty,
                                  child: const SizedBox(height: 16,)
                              ),


                              ///Couldn't find? label
                              Visibility(
                                visible: !_createNewClicked && _searchController.text.isNotEmpty,
                                child: GestureDetector(
                                  child: const Text(
                                    CREATE_NOW_LABEL,
                                    style: TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 13, fontWeight: FontWeight.bold, decoration: TextDecoration.underline,),
                                  ),
                                  onTap: (){
                                    setState(() {
                                      _createNewClicked= true;
                                      _newFoodNameController.text= _searchController.text;
                                    });
                                  },
                                ),
                              ),


                              /// Add new food widget
                              Visibility(
                                  visible: _createNewClicked,
                                  child: Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          ListTile(

                                            subtitle: Column(
                                              children: [


                                                /// food type
                                                CustomRadioListTile(
                                                    options: const [GROCERY_LABEL, MEAL_LABEL],
                                                    onSelectedOptionChanged: updateSelectedFoodType,
                                                    selectedOption: _newFoodType,
                                                    orientation: HORIZONTAL_ORIENTATION,
                                                    isEditable: true
                                                ),

                                                /// food name textField
                                                Row(
                                                  children: [
                                                    const SizedBox(
                                                        width: 60,
                                                        child: Text('$NAME_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 13),)
                                                    ),
                                                    const SizedBox(width: 12,),
                                                    Expanded(
                                                      child: TextField(
                                                        controller: _newFoodNameController,
                                                        decoration:  InputDecoration(
                                                          enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(color: _newFoodNameBorderColor),
                                                          ),
                                                          disabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(color: _newFoodNameBorderColor),
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(color: _newFoodNameBorderColor, width: 2),
                                                          ),
                                                          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                const SizedBox(height: 16,),


                                                ///serving textField
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                        width: 60,
                                                        child: Text('${SERVING_LABEL.capitalize()}:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 13),)
                                                    ),
                                                    const SizedBox(width: 12,),
                                                    Expanded(
                                                      child: TextField(
                                                        controller: _newFoodServingController,
                                                        keyboardType: TextInputType.number,
                                                        inputFormatters: <TextInputFormatter>[
                                                          FilteringTextInputFormatter.digitsOnly
                                                        ],
                                                        decoration: const InputDecoration(
                                                          enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                                                          ),
                                                          disabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(color: Colors.grey),
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
                                                          ),
                                                          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: 60,
                                                        child: Text('${SERVING_LABEL.capitalize()}:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 13),)
                                                    ),
                                                    const SizedBox(width: 12,),
                                                    Expanded(
                                                      child: TextField(
                                                        controller: _newFoodUnitController,
                                                        decoration: const InputDecoration(
                                                          enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                                                          ),
                                                          disabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(color: Colors.grey),
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(color: DARK_PRIMARY_COLOR, width: 2),
                                                          ),
                                                          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),


                                                const SizedBox(height: 16,),


                                                ///calorie and protein textField
                                                Row(
                                                  children: [
                                                    const SizedBox(
                                                        width: 60,
                                                        child: Text('$CALORIE_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 13),)
                                                    ),
                                                    const SizedBox(width: 12,),
                                                    SizedBox(
                                                      width: 70,
                                                      child: TextField(
                                                        controller: _newFoodCalorieController,
                                                        keyboardType: TextInputType.number,
                                                        inputFormatters: <TextInputFormatter>[
                                                          FilteringTextInputFormatter.digitsOnly
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
                                                      ),
                                                    ),
                                                    const SizedBox(width: 12,),
                                                    const SizedBox(
                                                        width: 60,
                                                        child: Text('$PROTEIN_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 13),)
                                                    ),
                                                    const SizedBox(width: 1,),
                                                    Expanded(
                                                      child: TextField(
                                                        controller: _newFoodProteinController,
                                                        keyboardType: TextInputType.number,
                                                        inputFormatters: <TextInputFormatter>[
                                                          FilteringTextInputFormatter.digitsOnly
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
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                const SizedBox(height: 16,),

                                                ///carb and fat textField
                                                Row(
                                                  children: [
                                                    const SizedBox(
                                                        width: 60,
                                                        child: Text('$CARB_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 13),)
                                                    ),
                                                    const SizedBox(width: 12,),
                                                    SizedBox(
                                                      width: 70,
                                                      child: TextField(
                                                        controller: _newFoodCarbController,
                                                        keyboardType: TextInputType.number,
                                                        inputFormatters: <TextInputFormatter>[
                                                          FilteringTextInputFormatter.digitsOnly
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
                                                      ),
                                                    ),
                                                    const SizedBox(width: 12,),
                                                    const SizedBox(
                                                        width: 60,
                                                        child: Text('$FAT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 13),)
                                                    ),
                                                    const SizedBox(width: 1,),
                                                    Expanded(
                                                      child: TextField(
                                                        controller: _newFoodFatController,
                                                        keyboardType: TextInputType.number,
                                                        inputFormatters: <TextInputFormatter>[
                                                          FilteringTextInputFormatter.digitsOnly
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
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),

                                          const SizedBox(height: 16,),


                                          /// cancel button
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all<Color>(DARK_PRIMARY_COLOR),
                                                ),
                                                child: const Text(CANCEL_LABEL),
                                                onPressed: () {
                                                  setState(() {
                                                    _createNewClicked= false;
                                                  });
                                                },
                                              ),

                                              const SizedBox(width: 8,),

                                              /// save button
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all<Color>(DARK_PRIMARY_COLOR),
                                                ),
                                                child: const Text(SAVE_LABEL),
                                                onPressed: () {
                                                  saveNewFoodButtonCLicked();
                                                },
                                              ),
                                            ],
                                          )
                                        ],

                                      ),
                                    ),
                                  )
                              ),

                              const SizedBox(height: 16,),

                              /// food type chips
                              Row(
                                children: [
                                  Visibility(
                                    visible: _foodsResource != INTERNATIONAL_MEALS_LABEL,
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          if(_foodsTypeRequested.contains(FoodType.groceryProduct)){
                                            _foodsTypeRequested.remove(FoodType.groceryProduct);
                                          }else{
                                            _foodsTypeRequested.add(FoodType.groceryProduct);
                                          }
                                        });
                                        requestFoodsList();
                                      },
                                      child: Chip(
                                          padding: const EdgeInsets.symmetric(horizontal: 12),
                                          backgroundColor: _foodsTypeRequested.contains(FoodType.groceryProduct) ? DARK_PRIMARY_COLOR : Colors.grey,
                                          label: const Text(
                                            GROCERY_LABEL,
                                            style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                                          )
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16,),
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        if(_foodsTypeRequested.contains(FoodType.meal)){
                                          _foodsTypeRequested.remove(FoodType.meal);
                                        }else{
                                          _foodsTypeRequested.add(FoodType.meal);
                                        }
                                      });
                                      requestFoodsList();
                                    },
                                    child: Chip(
                                        padding: const EdgeInsets.symmetric(horizontal: 12),
                                        backgroundColor: _foodsTypeRequested.contains(FoodType.meal) ? DARK_PRIMARY_COLOR : Colors.grey,
                                        label: const Text(
                                          MEAL_LABEL,
                                          style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),


                        const SizedBox(height: 12,),


                        /// My favorite list
                        FoodsListUi(foodCalculator: FoodCalculator(visibleFoods: _newMyFavorites), foods: _newMyFavorites, onFoodsChanged: updateChangedFavoriteFoods,
                          onFavoriteButtonClicked: addOrRemoveFavorite, foodsTypeRequested: _foodsTypeRequested,
                          foodBackGroundColor: MY_FAVORITE_FOOD_BACKGROUND_COLOR, foodIcon: const Icon(Icons.favorite, color: RED_ERROR_COLOR,),
                          foodDetailScreenType: FoodDetailScreenType.VIEW_FAVORITE, foodsListScreen: FoodsListScreen.SEARCH_FOOD_SCREEN, macroEdition: true,),


                        /// Groceries list
                        Visibility(
                          visible: _foodsResource == ALL_LABEL,
                          child: FoodsListUi(foodCalculator: FoodCalculator(visibleFoods: _newGroceries), foods: _newGroceries, onFoodsChanged: updateChangedGroceries,
                            onFavoriteButtonClicked: addOrRemoveFavorite, foodsTypeRequested: _foodsTypeRequested,
                            foodBackGroundColor: DEFAULT_FOOD_BACKGROUND_COLOR, foodIcon: const Icon(Icons.fastfood, color: Colors.blueGrey,),
                            foodDetailScreenType: FoodDetailScreenType.VIEW, foodsListScreen: FoodsListScreen.SEARCH_FOOD_SCREEN, macroEdition: true,),
                        ),

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
                          Future.delayed(Duration.zero,(){
                            return showErrorToast(context, state.message);
                          });
                        }
                        return Container();
                      },
                      listener: (context, state){
                      }
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
                            checkIfGroceriesAddedBefore(state.foods);
                          });

                        }else if(state is GroceriesErrorState){
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
                          resetNewFood();
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



  void resetNewFood(){
    _newFoodType = GROCERY_LABEL;
    _newFoodNameBorderColor = DARK_PRIMARY_COLOR;
    _newFoodServingController.text = '100';
    _newFoodUnitController.text = GRAM_LABEL;
    _newFoodCalorieController.text = '';
    _newFoodProteinController.text = '';
    _newFoodCarbController.text = '';
    _newFoodFatController.text = '';
    _newFoodNameController.text = '';
  }


  void saveNewFoodButtonCLicked(){
    if(_newFoodNameController.text.isEmpty){
      setState(() {
        _newFoodNameBorderColor = Colors.red;
      });
    }else{
      setState(() {
        _newFoodNameBorderColor = Colors.black;
        _createNewClicked= false;
      });

      if(_newFoodType == GROCERY_LABEL){
        _addToMyFavoriteBloc.add(
          AddOrUpdateMyFavoriteEvent.onAddToMyFavorite(
              Food(
                name: _newFoodNameController.text,
                units: [_newFoodUnitController.text],
                servingAmounts: _newFoodServingController.text.isNotEmpty ? [_newFoodServingController.text] : ['100'],
                calorie: _newFoodCalorieController.text.isNotEmpty ? [_newFoodCalorieController.text] : ['0'],
                protein: _newFoodProteinController.text.isNotEmpty ? [_newFoodProteinController.text] : ['0'],
                carb: _newFoodCarbController.text.isNotEmpty ? [_newFoodCarbController.text] : ['0'],
                fat: _newFoodFatController.text.isNotEmpty ? [_newFoodFatController.text] : ['0']
              )
          ),
        );
      }else{
        _addToMyFavoriteBloc.add(
          AddOrUpdateMyFavoriteEvent.onAddToMyFavorite(
              Food(
                name: _newFoodNameController.text,
                unit: _newFoodUnitController.text,
                servingAmount: int.parse(_newFoodServingController.text.isNotEmpty ? _newFoodServingController.text : '100'),
                  calorie: _newFoodCalorieController.text.isNotEmpty ? [_newFoodCalorieController.text] : ['0'],
                  protein: _newFoodProteinController.text.isNotEmpty ? [_newFoodProteinController.text] : ['0'],
                  carb: _newFoodCarbController.text.isNotEmpty ? [_newFoodCarbController.text] : ['0'],
                  fat: _newFoodFatController.text.isNotEmpty ? [_newFoodFatController.text] : ['0']
              )
          ),
        );
      }



    }
  }


  void requestFoodsList(){

    if(_foodsResource == ALL_LABEL){

      if(_foodsTypeRequested.contains(FoodType.groceryProduct) && _foodsTypeRequested.contains(FoodType.meal)){
        // everything

        _myFavoriteFoodsBloc.add(
            MyFavoriteFoodsEvent.onGetMyFavoriteFoods(FoodType.all, _searchController.text)
        );

        _groceriesBloc.add(
          GroceriesEvent.onGetGroceries(_searchController.text),
        );

        _internationalMealsBloc.add(
          InternationalMealsEvent.onGetInternationalMeals(_searchController.text)
        );


      }else if(_foodsTypeRequested.contains(FoodType.groceryProduct) && !_foodsTypeRequested.contains(FoodType.meal)){
        // all/grocery
        _myFavoriteFoodsBloc.add(
            MyFavoriteFoodsEvent.onGetMyFavoriteFoods(FoodType.groceryProduct, _searchController.text)
        );

        _groceriesBloc.add(
          GroceriesEvent.onGetGroceries(_searchController.text),
        );

        _internationalMealsBloc.add(
            const InternationalMealsEvent.onReset()
        );

      }else if(!_foodsTypeRequested.contains(FoodType.groceryProduct) && _foodsTypeRequested.contains(FoodType.meal)){
        // all/meal

        _myFavoriteFoodsBloc.add(
            MyFavoriteFoodsEvent.onGetMyFavoriteFoods(FoodType.meal, _searchController.text)
        );

        _groceriesBloc.add(
          const GroceriesEvent.onReset(),
        );

        _internationalMealsBloc.add(
            InternationalMealsEvent.onGetInternationalMeals(_searchController.text)
        );

      }else{
        // show empty view
      }
    }else if(_foodsResource == MY_FAVORITE_LABEL){
      if(_foodsTypeRequested.contains(FoodType.groceryProduct) && _foodsTypeRequested.contains(FoodType.meal)){
        // everything in my favorite
        _myFavoriteFoodsBloc.add(
            MyFavoriteFoodsEvent.onGetMyFavoriteFoods(FoodType.all, _searchController.text)
        );

        _groceriesBloc.add(
          const GroceriesEvent.onReset(),
        );

        _internationalMealsBloc.add(
            const InternationalMealsEvent.onReset()
        );
      }else if(_foodsTypeRequested.contains(FoodType.groceryProduct) && !_foodsTypeRequested.contains(FoodType.meal)){
        // my favorite/grocery
        _myFavoriteFoodsBloc.add(
            MyFavoriteFoodsEvent.onGetMyFavoriteFoods(FoodType.groceryProduct, _searchController.text)
        );

        _groceriesBloc.add(
          const GroceriesEvent.onReset(),
        );

        _internationalMealsBloc.add(
            const InternationalMealsEvent.onReset()
        );
      }else if(!_foodsTypeRequested.contains(FoodType.groceryProduct) && _foodsTypeRequested.contains(FoodType.meal)){
        // my favorite/meal
        _myFavoriteFoodsBloc.add(
            MyFavoriteFoodsEvent.onGetMyFavoriteFoods(FoodType.meal, _searchController.text)
        );

        _groceriesBloc.add(
          const GroceriesEvent.onReset(),
        );

        _internationalMealsBloc.add(
            const InternationalMealsEvent.onReset()
        );
      }else{
        // show empty view
      }
    }else if(_foodsResource == INTERNATIONAL_MEALS_LABEL){
      if(_foodsTypeRequested.contains(FoodType.meal)){
        // international meal
        _myFavoriteFoodsBloc.add(
            const MyFavoriteFoodsEvent.onReset()
        );

        _groceriesBloc.add(
          const GroceriesEvent.onReset(),
        );

        _internationalMealsBloc.add(
            InternationalMealsEvent.onGetInternationalMeals(_searchController.text)
        );
      }else{
        // show empty view
      }
    }
  }

  void logFoodsOfToday(List<Food> foodsLoggedBefore){
    List<Food> foods = [];

    foods.addAll(foodsLoggedBefore);
    foods.addAll(_addedMyFavorites);
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


