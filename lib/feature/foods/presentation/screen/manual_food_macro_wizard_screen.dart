import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/suggested_different_foods_combination_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/custom_radio_button.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/debouncer.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/foods_macro_list_ui.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/request_wizard_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/unit_options.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../data/repository_impl/foods_repository_impl.dart';
import '../../domain/model/food_model.dart';
import '../../domain/model/food_type.dart';
import '../bloc/groceries_bloc/groceries_bloc.dart';
import '../bloc/groceries_bloc/state_event/groceries_state_event.dart';
import '../bloc/my_cook_book_foods_bloc/my_cook_book_foods_bloc.dart';
import '../bloc/my_cook_book_foods_bloc/state_event/my_cook_book_foods_state_event.dart';
import '../bloc/my_favorite_foods/my_favorite_foods_bloc.dart';
import '../bloc/my_favorite_foods/state_event/my_favorite_foods_state_event.dart';
import '../bloc/suggest_portion_bloc/state_event/suggest_portion_state_event.dart';
import '../bloc/suggest_portion_bloc/suggest_portion_bloc.dart';



class ManualFoodMacroWizardScreen extends StatefulWidget {


  const ManualFoodMacroWizardScreen({super.key});

  @override
  State<ManualFoodMacroWizardScreen> createState() => _ManualFoodMacroWizardScreenState();
}

class _ManualFoodMacroWizardScreenState extends State<ManualFoodMacroWizardScreen> {




  String _foodType = '';
  String _foodTypeRadioList1 = '';
  String _foodTypeRadioList2 = '';


  late TextEditingController _calorieController;
  late TextEditingController _proteinController;
  late TextEditingController _carbController;
  late TextEditingController _fatController;
  late TextEditingController _servingController;
  late TextEditingController _foodNameController;
  final List<bool> _foodsExpansionState = [];
  Color _foodNameBorderColor = DARK_PRIMARY_COLOR;
  bool _searchedFoodsVisible = false;

  List<Food> _foods = [];
  List<RangeValues> _foodsServingRanges= [];
  late GroceriesBloc _groceriesBloc;
  late MyFavoriteFoodsBloc _myFavoriteFoodsBloc;
  late MyCookBookFoodsBloc _myCookBookFoodsBloc;

  RangeValues _servingRangeValues = const RangeValues(SERVING_MIN_DEFAULT, SERVING_MAX_DEFAULT);

  bool _isNewFoodOpen= false;

  List<GenericFood> _suggestedGroceries= [];

  List<Food> _suggestedCookBooks= [];

  List<Food> _suggestedFavorites= [];


  late SuggestPortionsBloc _suggestPortionsBloc;

  final _debouncer = Debouncer(milliseconds: 1000);

  GenericFood _selectedGenericGrocery = GenericFood();


  int _selectedUnitIndex = 0;
  List<String> _searchUnitOptions = [];


  @override
  void initState() {
    super.initState();
    _foodNameController= TextEditingController();
    _calorieController= TextEditingController(text: '0');
    _proteinController= TextEditingController(text: '0');
    _carbController= TextEditingController(text: '0');
    _fatController= TextEditingController(text: '0');
    _servingController= TextEditingController(text: '0');
    _groceriesBloc = context.read<GroceriesBloc>();
    _suggestPortionsBloc = context.read<SuggestPortionsBloc>();
    _myFavoriteFoodsBloc = context.read<MyFavoriteFoodsBloc>();
    _myCookBookFoodsBloc = context.read<MyCookBookFoodsBloc>();

    _foodNameController.addListener(_onSearchFoodChanged);

    _suggestPortionsBloc.add(const SuggestFoodsPortionEvent.onReset());

  }



  void _onSearchFoodChanged() {
    setState(() {

    });
    _debouncer.run(() {
      if(_foodNameController.text.isNotEmpty){
        _suggestedGroceries.clear();
        _suggestedCookBooks.clear();
        _suggestedFavorites.clear();
        if(_foodType == GROCERY_LABEL){
          _groceriesBloc.add(
            GroceriesEvent.onGetGroceries(_foodNameController.text,),
          );
          setState(() {
            _searchedFoodsVisible = true;
          });
        }else if(_foodType == MY_FAVORITE_LABEL){
          _myFavoriteFoodsBloc.add(
            MyFavoriteFoodsEvent.onGetMyFavoriteFoods(
              FoodType.all,
              _foodNameController.text,
            ),
          );

          setState(() {
            _searchedFoodsVisible = true;
          });
        }else{
          _myCookBookFoodsBloc.add(
            MyCookBookFoodsEvent.onGetMyCookBookFoods(
              _foodNameController.text,
            ),
          );

          setState(() {
            _searchedFoodsVisible = true;
          });
        }
      }
    });
  }

  Widget foodUnitDropDown(){
    final dropDownList = _searchUnitOptions.isNotEmpty ? _searchUnitOptions : manualUnitOptions;
    return  SizedBox(
      width: MACRO_DROP_DOWN_WIDTH,
      height: MACRO_DROP_DOWN_HEIGHT,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            isExpanded: true,
            value: dropDownList[_selectedUnitIndex],
            items: dropDownList.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: const TextStyle(fontSize: 12),),
              );
            }).toList(),
            onChanged: (String? newValue){
              setState(() {
                int selectedIndex = 0;
                for (int i = 0; i < dropDownList.length; i++){
                  if(newValue.toString() == dropDownList[i]){
                    selectedIndex = i;
                  }
                }
                _selectedUnitIndex = selectedIndex;

                if(_foodType == GROCERY_LABEL && _selectedGenericGrocery.name.isNotEmpty){
                  _servingController = TextEditingController(text: _selectedGenericGrocery.servingAmounts[0][_selectedUnitIndex].toString());
                  _calorieController = TextEditingController(text: _selectedGenericGrocery.calorie[0][_selectedUnitIndex].toString());
                  _proteinController = TextEditingController(text: _selectedGenericGrocery.protein[0][_selectedUnitIndex].toString());
                  _carbController = TextEditingController(text: _selectedGenericGrocery.carb[0][_selectedUnitIndex].toString());
                  _fatController = TextEditingController(text: _selectedGenericGrocery.fat[0][_selectedUnitIndex].toString());
                }

              });

            }
          ),
        ),
      ),
    );
  }


  Widget foodTypesRadioList(){
    return Column(
      children: [
        CustomRadioListTile(
          options: const [GROCERY_LABEL, MY_COOKBOOK_LABEL],
          onSelectedOptionChanged: updateSelectedFoodType,
          selectedOption: _foodTypeRadioList1,
          orientation: HORIZONTAL_ORIENTATION,
          isEditable: true,
        ),

        CustomRadioListTile(
          options: const [MY_FAVORITE_LABEL, MANUAL_LABEL, MEAL_LABEL],
          onSelectedOptionChanged: updateSelectedFoodType,
          selectedOption: _foodTypeRadioList2,
          orientation: HORIZONTAL_ORIENTATION,
          isEditable: true,
        ),
      ]
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(HOW_MUCH_TO_EAT, style: TextStyle(color: Colors.white)),
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
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                color: LIGHT_GREY_COLOR,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Container(
                                      padding: const EdgeInsets.all(24),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('$ADD_FOOD_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

                                          const SizedBox(height: 8,),

                                          /// food type
                                          foodTypesRadioList()

                                        ],
                                      ),
                                    ),

                                    /// new grocery
                                    newGrocery(),

                                    /// new cookBook
                                    newCookBook(),

                                    /// new Favorite
                                    newFavorite(),

                                    /// new manual
                                    newManualFood()
                                  ],
                                ),
                              ),

                              /// added foods
                              addedFoods(),

                            ],
                          ),
                        )
                    ),

                    /// request portions
                    requestPortionsButton(),

                  ],
                ),

                BlocConsumer<SuggestPortionsBloc, SuggestFoodsPortionState>(
                    builder: (context, state) {
                      if (state is SuggestFoodsPortionLoadingState) {
                        return const GFLoader(
                          type: GFLoaderType.circle,
                          loaderColorOne: DARK_PRIMARY_COLOR,
                          loaderColorTwo: DARK_PRIMARY_COLOR,
                          loaderColorThree: DARK_PRIMARY_COLOR,
                        );
                      }else if(state is SuggestFoodsPortionLoadedState){
                        _suggestPortionsBloc.add(const SuggestFoodsPortionEvent.onReset());
                        Future.delayed(Duration.zero,(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SuggestedDifferentFoodsCombinationScreen(suggestedPortionsList: state.suggestedFoodsPortions),
                            ),
                          );
                        });
                      }else if(state is SuggestFoodsPortionErrorState){
                        _suggestPortionsBloc.add(const SuggestFoodsPortionEvent.onReset());
                        Future.delayed(Duration.zero,(){
                          if(state.message == ERROR_FREE_USER_FOODS_PORTION_NOT_ALLOWED){
                            return showUpgradePopupForFreeUsers(context, UPGRADE_MSG_FOODS_PORTION);
                          }else if(state.message == ERROR_PAID_USER_SUGGEST_FOOD_OVER_LIMIT){
                            return showOVerLimitPaidUsers(context, ERROR_OVER_LIMIT_FOODS_PORTION_MSG);
                          }
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
    );
  }

  Widget requestPortionsButton(){
    return Container(
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
              List<List<double>> servings = [];
              _foodsServingRanges.forEach((element) {
                List<double> list = [];
                list.add(element.start);
                list.add(element.end);
                servings.add(list);
              });

              // _suggestPortionsBloc.add(
              //     SuggestFoodsPortionEvent.onSuggestFoodsPortion(
              //         _foods,
              //         servings,
              //         widget.requestWizardArgumentModel.macroGoalRanges,
              //         widget.requestWizardArgumentModel.restriction
              //     )
              // );
            },
            child: const Text(REQUEST_PORTIONS_LABEL, style: TextStyle( color: Colors.white),),
        ),
      );
  }



  void updateSelectedFoodType(String type){
    setState(() {

      if(type == MY_COOKBOOK_LABEL || type == GROCERY_LABEL){
        _foodTypeRadioList1= type;
        _foodTypeRadioList2= '';
      }else{
        _foodTypeRadioList2= type;
        _foodTypeRadioList1= '';
      }

      _foodType = type;
      _isNewFoodOpen= true;
      resetMacroAmounts();
    });
  }

  void resetMacroAmounts(){
    _foodNameController.text = '';
    _calorieController.text = '0';
    _proteinController.text = '0';
    _carbController.text = '0';
    _fatController.text = '0';
    _servingController.text = '0';
    _selectedUnitIndex= 0;
     _servingRangeValues = const RangeValues(SERVING_MIN_DEFAULT, SERVING_MAX_DEFAULT);
     _selectedGenericGrocery= GenericFood();
     _searchUnitOptions= manualUnitOptions;
  }

  void updateFoodsExpansionStateListUi(int index, bool state, bool isRemove){
    setState(() {
      if(isRemove){
        _foodsExpansionState.removeAt(index);
      }else{
        if(state == true){
          for (int i = 0; i < _foodsExpansionState.length; i++) {
            _foodsExpansionState[i] = false;
          }
        }
        _foodsExpansionState[index] = state;
      }
    });
  }

  Widget addedFoods(){
    return Visibility(
        visible: _foods.isNotEmpty,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16,),
            const Text('$FOODS_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),
            const SizedBox(height: 16,),
            FoodsMacroListUi(foods: _foods, foodsExpansionState: _foodsExpansionState,
              onExpansionStateChanged: updateFoodsExpansionStateListUi, onFoodsUpdated: updateUiAfterFoodsUpdated, foodsServingRanges: _foodsServingRanges,
            )
          ],
        )
    );
  }

  void updateUiAfterFoodsUpdated(List<Food> foods, List<RangeValues> ranges){
    setState(() {
      _foods = foods;
      _foodsServingRanges = ranges;
    });
  }


  void closeNewFood(){
    setState(() {
      _foodTypeRadioList1= '';
      _foodTypeRadioList2= '';
      _isNewFoodOpen = false;
      _foodType= '';
      resetMacroAmounts();
    });
  }

  Widget newGrocery(){
    return Visibility(
      visible: _foodType == GROCERY_LABEL && _isNewFoodOpen,
      child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                    onTap: () {
                      closeNewFood();
                    },
                  ),
                  const SizedBox(height: 12,),
                  Stack(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: SEARCH_BAR_HEIGHT,
                              child: TextField(
                                controller: _foodNameController,
                                decoration:  InputDecoration(
                                  hintText: CHEDDAR_CHEESE_LABEL,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: _foodNameBorderColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: _foodNameBorderColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: _foodNameBorderColor, width: 2),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      suggestedGroceriesBloc()
                    ],
                  ),

                  const SizedBox(height: 16,),

                  newFoodMacroAmountsWidgets(),

                  const SizedBox(height: 16,),


                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(PRIMARY_COLOR),
                          ),
                          onPressed: () {
                            addFoodClickListener();
                          },
                          child: const Text(ADD_LABEL, style: TextStyle( color: Colors.white),),
                        ),
                      ]
                  ),
                ],
              ),
            )
        ),
    );
  }

  Widget newCookBook(){
    return Visibility(
      visible: _foodType == MY_COOKBOOK_LABEL && _isNewFoodOpen,
      child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onTap: () {
                    closeNewFood();
                  },
                ),
                const SizedBox(height: 12,),
                Stack(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: SEARCH_BAR_HEIGHT,
                            child: TextField(
                              controller: _foodNameController,
                              decoration:  InputDecoration(
                                hintText: CHEDDAR_CHEESE_LABEL,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: _foodNameBorderColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: _foodNameBorderColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: _foodNameBorderColor, width: 2),
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    suggestedCookBooksBloc()
                  ],
                ),

                const SizedBox(height: 16,),

                newFoodMacroAmountsWidgets(),

                const SizedBox(height: 16,),


                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(PRIMARY_COLOR),
                        ),
                        onPressed: () {
                          addFoodClickListener();
                        },
                        child: const Text(ADD_LABEL, style: TextStyle( color: Colors.white),),
                      ),
                    ]
                ),
              ],
            ),
          )
      ),
    );
  }

  Widget newFavorite(){
    return Visibility(
      visible: _foodType == MY_FAVORITE_LABEL && _isNewFoodOpen,
      child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onTap: () {
                    closeNewFood();
                  },
                ),
                const SizedBox(height: 12,),
                Stack(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: SEARCH_BAR_HEIGHT,
                            child: TextField(
                              controller: _foodNameController,
                              decoration:  InputDecoration(
                                hintText: CHEDDAR_CHEESE_LABEL,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: _foodNameBorderColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: _foodNameBorderColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: _foodNameBorderColor, width: 2),
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    suggestedFavoriteBloc()
                  ],
                ),

                const SizedBox(height: 16,),

                newFoodMacroAmountsWidgets(),

                const SizedBox(height: 16,),


                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(PRIMARY_COLOR),
                        ),
                        onPressed: () {
                          addFoodClickListener();
                        },
                        child: const Text(ADD_LABEL, style: TextStyle( color: Colors.white),),
                      ),
                    ]
                ),
              ],
            ),
          )
      ),
    );
  }


  Widget newManualFood(){
    return Visibility(
      visible: _foodType == MANUAL_LABEL && _isNewFoodOpen,
      child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onTap: () {
                    closeNewFood();
                  },
                ),
                const SizedBox(height: 12,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: SEARCH_BAR_HEIGHT,
                        child: TextField(
                          controller: _foodNameController,
                          decoration:  InputDecoration(
                            hintText: CHEDDAR_CHEESE_LABEL,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: _foodNameBorderColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: _foodNameBorderColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: _foodNameBorderColor, width: 2),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16,),

                newFoodMacroAmountsWidgets(),

                const SizedBox(height: 16,),


                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(PRIMARY_COLOR),
                        ),
                        onPressed: () {
                          addFoodClickListener();
                        },
                        child: const Text(ADD_LABEL, style: TextStyle( color: Colors.white),),
                      ),
                    ]
                ),
              ],
            ),
          )
      ),
    );
  }

  void addFoodClickListener(){

    if(_foodNameController.text.isEmpty){
      setState(() {
        _foodNameBorderColor = Colors.red;
      });
      return;
    }

    if((_calorieController.text.isEmpty || _calorieController.text == '0') && (_proteinController.text.isEmpty || _proteinController.text == '0') &&
        (_carbController.text.isEmpty || _carbController.text == '0') && (_fatController.text.isEmpty || _fatController.text == '0')
    ){
      showErrorToast(context, ERROR_EMPTY_MACRO_SEARCH);
      return;
    }

    setState(() {
      Food newFood = Food();
      newFood = Food(
        name: _foodNameController.text,
        servingAmounts: [_servingController.text],
        units: [_searchUnitOptions[_selectedUnitIndex]],
        calorie: [_calorieController.text],
        protein: [_proteinController.text],
        carb: [_carbController.text],
        fat: [_fatController.text],
      );
      _foods.add(newFood);
      _foodNameBorderColor = Colors.black;
      _foodsExpansionState.add(false);
      _foodsServingRanges.add(_servingRangeValues);
      _isNewFoodOpen= false;
      resetMacroAmounts();
      _foodType= '';
      _foodTypeRadioList1= '';
      _foodTypeRadioList2= '';
    });
  }


  Widget suggestedGroceriesBloc(){
    return  Visibility(
      visible: _searchedFoodsVisible,
      child: Container(
          width: 300,
          height: 200,
          padding: const EdgeInsets.only(top: 4, right: 4),
          decoration: BoxDecoration(
            color: LIGHT_GREY_COLOR,
            borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
          ),
          margin: const EdgeInsets.only(top: 36),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onTap: () {
                    setState(() {
                      _searchedFoodsVisible = false;
                    });
                  },
                ),


                suggestedGroceriesList(),


                BlocConsumer<GroceriesBloc, GroceriesState>(
                    builder: (context, state) {
                      if (state is GroceriesLoadingState) {
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
                      }else if(state is GroceriesLoadedState){
                        Future.delayed(Duration.zero,(){
                          setState(() {
                            _suggestedGroceries.addAll(state.foods);
                            _groceriesBloc.add(const GroceriesEvent.onReset());
                          });
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
              ],
            ),
          )
      ),
    );
  }


  Widget suggestedCookBooksBloc(){
    return  Visibility(
      visible: _searchedFoodsVisible,
      child: Container(
          width: 300,
          height: 200,
          padding: const EdgeInsets.only(top: 4, right: 4),
          decoration: BoxDecoration(
            color: LIGHT_GREY_COLOR,
            borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
          ),
          margin: const EdgeInsets.only(top: 36),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onTap: () {
                    setState(() {
                      _searchedFoodsVisible = false;
                    });
                  },
                ),


                suggestedCookBookList(),



                BlocConsumer<MyCookBookFoodsBloc, MyCookBookFoodsState>(
                    builder: (mcontext, state) {
                      if (state is MyCookBookFoodsLoadingState) {
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
                      }else if(state is MyCookBookFoodsLoadedState){
                        Future.delayed(Duration.zero,(){
                          setState(() {
                            _suggestedCookBooks.addAll(state.foods);
                            _myCookBookFoodsBloc.add(const MyCookBookFoodsEvent.onReset());
                          });
                        });
                      }else if(state is MyCookBookFoodsErrorState){
                        _myCookBookFoodsBloc.add(const MyCookBookFoodsEvent.onReset());
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
    );
  }

  Widget suggestedFavoriteBloc(){
    return  Visibility(
      visible: _searchedFoodsVisible,
      child: Container(
          width: 300,
          height: 200,
          padding: const EdgeInsets.only(top: 4, right: 4),
          decoration: BoxDecoration(
            color: LIGHT_GREY_COLOR,
            borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
          ),
          margin: const EdgeInsets.only(top: 36),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onTap: () {
                    setState(() {
                      _searchedFoodsVisible = false;
                    });
                  },
                ),


                suggestedFavoriteList(),


                BlocConsumer<MyFavoriteFoodsBloc, MyFavoriteFoodsState>(
                    builder: (context, state) {
                      if (state is MyFavoriteFoodsLoadingState) {
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
                      }else if(state is MyFavoriteFoodsLoadedState){
                        Future.delayed(Duration.zero,(){
                          setState(() {
                            _suggestedFavorites.addAll(state.foods);
                            _myFavoriteFoodsBloc.add(const MyFavoriteFoodsEvent.onReset());
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
    );
  }

  Widget suggestedGroceriesList(){
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _suggestedGroceries.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          GenericFood grocery = _suggestedGroceries[index];
          return GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text(grocery.name.capitalize(), style: const TextStyle(color: Colors.blueGrey, fontSize: 12),)
                ),
                const SizedBox(height: 8,),
              ],
            ),
            onTap: (){
              setState(() {
                _selectedGenericGrocery = grocery;
                _searchedFoodsVisible = false;
                _searchUnitOptions = grocery.units[0];
                _selectedUnitIndex= 0;
                _foodNameController= TextEditingController(text: grocery.name.replaceAll(',', ''));
                _servingController = TextEditingController(text: grocery.servingAmounts[0][_selectedUnitIndex].toString());
                _calorieController = TextEditingController(text: grocery.calorie[0][_selectedUnitIndex].toString());
                _proteinController = TextEditingController(text: grocery.protein[0][_selectedUnitIndex].toString());
                _carbController = TextEditingController(text: grocery.carb[0][_selectedUnitIndex].toString());
                _fatController = TextEditingController(text: grocery.fat[0][_selectedUnitIndex].toString());
                _foodNameController.addListener(_onSearchFoodChanged);
              });
            },
          );
        }
    );
  }

  Widget suggestedCookBookList(){
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _suggestedCookBooks.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          Food food = _suggestedCookBooks[index];
          return GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text(food.name.capitalize(), style: const TextStyle(color: Colors.blueGrey, fontSize: 12),)
                ),
                const SizedBox(height: 8,),
              ],
            ),
            onTap: (){
              setState(() {
                _searchedFoodsVisible = false;
                _searchUnitOptions = [food.units[0]];
                _selectedUnitIndex= 0;
                _foodNameController= TextEditingController(text: food.name.replaceAll(',', ''));
                _servingController = TextEditingController(text: food.servingAmounts[0][_selectedUnitIndex].toString());
                _calorieController = TextEditingController(text: food.calorie[0][_selectedUnitIndex].toString());
                _proteinController = TextEditingController(text: food.protein[0][_selectedUnitIndex].toString());
                _carbController = TextEditingController(text: food.carb[0][_selectedUnitIndex].toString());
                _fatController = TextEditingController(text: food.fat[0][_selectedUnitIndex].toString());
                _foodNameController.addListener(_onSearchFoodChanged);
              });
            },
          );
        }
    );
  }

  Widget suggestedFavoriteList(){
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _suggestedFavorites.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          Food food = _suggestedFavorites[index];
          return GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text(food.name.capitalize(), style: const TextStyle(color: Colors.blueGrey, fontSize: 12),)
                ),
                const SizedBox(height: 8,),
              ],
            ),
            onTap: (){
              setState(() {
                _searchedFoodsVisible = false;
                _selectedUnitIndex= 0;
                _foodNameController= TextEditingController(text: food.name.replaceAll(',', ''));
                if(food.foodType == FoodType.groceryProduct){
                  _searchUnitOptions = [food.units[0]];
                  _servingController = TextEditingController(text: food.servingAmounts[0].toString());
                  _calorieController = TextEditingController(text: food.calorie[0].toString());
                  _proteinController = TextEditingController(text: food.protein[0].toString());
                  _carbController = TextEditingController(text: food.carb[0].toString());
                  _fatController = TextEditingController(text: food.fat[0].toString());
                }else{
                  _searchUnitOptions = [food.unit];
                  _servingController = TextEditingController(text: food.servingAmount.toString());
                  double calorie= 0.0;
                  double protein= 0.0;
                  double carb= 0.0;
                  double fat= 0.0;

                  for (int i = 0; i < food.ingredients.length; i++){
                    double count= double.parse(food.servingIngredientsCount[i]);
                    calorie= calorie + (double.parse(food.calorie[i]) * count);
                    protein= protein + (double.parse(food.protein[i]) * count);
                    carb= carb + (double.parse(food.carb[i]) * count);
                    fat= fat + (double.parse(food.fat[i]) * count);
                  }
                  _calorieController = TextEditingController(text: calorie.toStringAsFixed(2));
                  _proteinController = TextEditingController(text: protein.toStringAsFixed(2));
                  _carbController = TextEditingController(text: carb.toStringAsFixed(2));
                  _fatController = TextEditingController(text: fat.toStringAsFixed(2));
                }
                _foodNameController.addListener(_onSearchFoodChanged);
              });
            },
          );
        }
    );
  }


  Widget newFoodMacroAmountsWidgets(){
    return Column(
      children: [
        ///  serving + unit
        Row(
          children: [


            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$SERVING_AMOUNT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _servingController,
                enabled: _foodType == MANUAL_LABEL,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
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
            const SizedBox(width: 20,),
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$UNIT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),


            foodUnitDropDown(),

          ],
        ),

        const SizedBox(height: 4,),

        /// calorie + protein
        Row(
          children: [
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$CALORIE_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _calorieController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
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
            const SizedBox(width: 20,),
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$PROTEIN_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _proteinController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
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

        const SizedBox(height: 12,),

        ///  carb + fat
        Row(
          children: [
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$CARB_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _carbController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
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
            const SizedBox(width: 20,),
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$FAT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _fatController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
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


        const SizedBox(height: 48,),

        /// how many serving?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('$SERVINGS_RANGE:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),
            const SizedBox(height: 12,),
            servingRange()
          ],
        ),
      ],
    );
  }


  Widget servingRange(){
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: Row(
        children: [
          SizedBox(
            width: 30,
              child: Text(_servingRangeValues.start.toStringAsFixed(1), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),)
          ),
          RangeSlider(
            values: _servingRangeValues,
            min: SERVING_MIN,
            max: SERVING_MAX,
            activeColor: DARK_PRIMARY_COLOR, // Set the active color here
            inactiveColor: Colors.grey,
            divisions: SERVING_DEVISION,
            onChanged: (values) {
              setState(() {
                _servingRangeValues = values;
              });
            },
          ),
          SizedBox(
              width: 30,
              child: Text(_servingRangeValues.end.toStringAsFixed(1), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),)
          ),
        ],
      ),
    );
  }





}
