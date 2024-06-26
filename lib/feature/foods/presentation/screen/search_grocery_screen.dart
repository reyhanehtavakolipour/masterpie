

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/presentation/food_calculator/generic_food_calculator.dart';
import 'package:masterpie/feature/foods/presentation/screen/search_grocery_list_ui.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/custom_radio_button.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/debouncer.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/logged_food_chip_widget.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/generic_food_detail_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model_converter.dart';
import 'package:masterpie/main_screen.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/core/constant/api_constant.dart';
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
import 'edit_fat_secret_food_screen.dart';




class SearchGroceryScreen extends StatefulWidget {

  const SearchGroceryScreen({super.key});


  @override
  State<SearchGroceryScreen> createState() => _SearchGroceryScreenState();
}


class _SearchGroceryScreenState extends State<SearchGroceryScreen> {


  late TextEditingController _searchController;

  late GroceriesBloc _groceriesBloc;
  late AddOrUpdateMyFavoriteBloc _addToMyFavoriteBloc;
  late GetLoggedFoodsBloc _getLoggedFoodsBloc;
  late LogFoodsBloc _logFoodsBloc;

  List<Food> _addedGroceries= [];

  bool _isAddedFoodBannerOpen= false;

  List<GenericFood> _newGroceries= [];

  bool _logButtonCLicked = false;



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

  void addToFavorites(Food food){
    if(UserRegistrationStatus.userAccountId.isNotEmpty){
      _addToMyFavoriteBloc.add(
        AddOrUpdateMyFavoriteEvent.onAddToMyFavorite(
            food
        ),
      );
    }else{
      showRegisterDialog(context);
    }
  }


  void onGroceryClicked(GenericFood food){
    GenericFoodDetailArgumentModel argumentModel = GenericFoodDetailArgumentModel(
        food: food,
        macroEdition: true
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditFatSecretFoodScreen(foodDetailArgumentModel: argumentModel,),
      ),
    );
  }


  void updateChangedGroceries(List<Food> foods) {
    setState(() {

      _newGroceries = toGenericFoods(foods);

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


  List<GenericFood> toGenericFoods(List<Food> foods){
    return foods.map((element) =>
        GenericFood(
            count: element.count,
            units: [element.units],
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
    debouncer.run(() {
      requestFoodsList();
    });
  }


  Widget logFoodButton(){
    bool isAnyFoodAdded= false;
    List<Food> foodsLog = [];
    _addedGroceries.forEach((element) {
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

                                          for(int i = 0; i < _newGroceries.length; i++){
                                            if(_newGroceries[i].id == foodsLog[index].id){
                                              _newGroceries[i]= _newGroceries[i].copyWith(count: 0);
                                            }
                                          }


                                          for(int i = 0; i < _addedGroceries.length; i++){
                                            if(_addedGroceries[i].id == foodsLog[index].id){
                                              _addedGroceries[i]= _addedGroceries[i].copyWith(count: 0);
                                            }
                                          }


                                          List<Food> foods= [];
                                          _newGroceries.forEach((food) {
                                            foods.add(fromGenericGrocery(food));
                                          });

                                          updateChangedGroceries(foods);
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
                    if(UserRegistrationStatus.userAccountId.isNotEmpty){
                      _logButtonCLicked = true;
                      requestLoggedFoods();
                    }else{
                      showRegisterDialog(context);
                    }
                  },
                  child: const Text(SUBMIT_LOG_FOODS_LABEL,
                    style: TextStyle( color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),
                  )
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
          title: const Text(SEARCH_GROCERY_LABEL, style: TextStyle(color: Colors.white)),
          backgroundColor: PRIMARY_COLOR,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.white,),
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
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                child: const CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.orange,
                                  child: Icon(
                                    Icons.document_scanner,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onTap: () {
                                 scanBarcodeNormal();
                              },
                            )
                          ],
                        ),

                        fatSecretAttribute()
                      ],
                    ),
                  ),

                  const SizedBox(height: 12,),

                  /// Groceries list
                  SearchGroceriesListUi(foodCalculator: GenericFoodCalculator(visibleFoods: _newGroceries), foods: _newGroceries, onFoodsChanged: updateChangedGroceries,
                    onFavoriteButtonClicked: addToFavorites, onGroceryClicked: onGroceryClicked, foodsTypeRequested: const [FoodType.groceryProduct],
                    foodBackGroundColor: DEFAULT_FOOD_BACKGROUND_COLOR, foodIcon: const Icon(Icons.fastfood, color: Colors.blueGrey,), macroEdition: true,),
                ],
              ),
            ),


            Visibility(
              visible: _newGroceries.isEmpty,
                child: Container(
                  padding: const EdgeInsets.all(32),
                  child: const Center(
                    child: Text(BARCODE_AVAILABLE_IN_US,
                      textAlign: TextAlign.center,
                      style: TextStyle( color: Colors.blueGrey, fontWeight: FontWeight.normal,),
                    ),
                  ),
                )
            ),


            logFoodButton(),


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
                      setState(() {
                        _newGroceries= [];
                        _newGroceries.addAll(state.foods);
                        _groceriesBloc.add(const GroceriesEvent.onReset());
                      });
                    });
                  }else if(state is GroceriesErrorState){
                    FocusScope.of(context).unfocus();
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


            BlocConsumer<AddOrUpdateMyFavoriteBloc, AddOrUpdateMyFavoriteState>(
                builder: (mcontext, state) {
                  if(state is AddOrUpdateMyFavoriteLoadedState){
                    _addToMyFavoriteBloc.add(const AddOrUpdateMyFavoriteEvent.onReset());
                    Future.delayed(Duration.zero,(){
                      showSuccessToast(context, FOOD_ADDED_TO_FAVORITE_MSG);
                    });
                  }else if(state is AddOrUpdateMyFavoriteErrorState){
                    FocusScope.of(context).unfocus();
                    _addToMyFavoriteBloc.add(const AddOrUpdateMyFavoriteEvent.onReset());
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
      ),
    );
  }


  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      requestGroceryWithBarcode(barcodeScanRes);
    });
  }


  void requestGroceryWithBarcode(String barcodeId){
    _groceriesBloc.add(
      GroceriesEvent.onGetGroceryWithBarcode(barcodeId),
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


