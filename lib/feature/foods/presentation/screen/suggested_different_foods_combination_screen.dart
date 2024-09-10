

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/domain/model/food_type.dart';
import 'package:masterpie/feature/foods/domain/model/meal_plan_model.dart';
import 'package:masterpie/feature/foods/domain/model/wizard_response_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/ask_meal_plan_name_dialog.dart';
import 'package:masterpie/util/core/helper/print.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../domain/model/food_model.dart';
import '../../domain/model/suggested_foods_portion_model.dart';
import '../bloc/get_logged_foods_bloc/get_logged_foods_bloc.dart';
import '../bloc/get_logged_foods_bloc/state_event/get_logged_foods_state_event.dart';
import '../bloc/log_foods_bloc/log_foods_bloc.dart';
import '../bloc/log_foods_bloc/state_event/log_foods_state_event.dart';


const double groceryAmountWidgetWidth= 80.0;
const double mealIngredientAmountWidgetWidth= 60.0;


class SuggestedDifferentFoodsCombinationScreen extends StatefulWidget {


  final WizardResponseModel wizardResponse;

  final bool isSavedMealPlan;

  const SuggestedDifferentFoodsCombinationScreen({super.key, required this.wizardResponse, required this.isSavedMealPlan});


  @override
  State<SuggestedDifferentFoodsCombinationScreen> createState() => _SuggestedDifferentFoodsCombinationScreenState();
}

class _SuggestedDifferentFoodsCombinationScreenState extends State<SuggestedDifferentFoodsCombinationScreen> {

  List<SuggestedFoodsPortion> _suggestedFoodsPortions = [];

  List<List<double>> _combinationMacros = [];

  List<Food> _selectedCombinationFoods= [];

  late GetLoggedFoodsBloc _getLoggedFoodsBloc;
  late LogFoodsBloc _logFoodsBloc;


  //index of current combination
  int _currentPage= 0;


  bool _messageExpanded= false;

  List<List<Food>> _orderedFoods = [];

  List<List<List<TextEditingController>>> _amountControllers = [];


  MealPlan _mealPlan= MealPlan();


  @override
  void initState() {
    super.initState();
    _suggestedFoodsPortions = widget.wizardResponse.foodsPortions;
    calculateFoodsCombinationsMacros();
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();
    _logFoodsBloc = context.read<LogFoodsBloc>();

    _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
    _logFoodsBloc.add(const LogFoodsEvent.onReset());

    _cleanData();
  }





  @override
  Widget build(BuildContext context) {
    _suggestedFoodsPortions = widget.wizardResponse.foodsPortions;

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop){

      },
      child: MaterialApp(
        theme: ThemeData(fontFamily: MONTSERRAT_FONT),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: LIGHT_GREY_COLOR,
          appBar: AppBar(
            title: const Text(FOODS_COMBINATIONS_LABEL, style: TextStyle(color: Colors.white)),
            backgroundColor: PRIMARY_COLOR,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios, color: Colors.white,),
            ),
            actions: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    _cleanData();
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 16),
                    child: const Text(RESET_LABEL, style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),)
                ),
              )

            ],
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                physics: const ScrollPhysics(),

                child: Column(

                  children: [



                    _helperMessage(),


                    _totalMacroInfo(),

                    const SizedBox(height: 8,),


                    _buildFoodsPortions(),


                    const SizedBox(height: 90,),


                  ],
                ),
              ),


              savePlanBtn(),

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
                        if(_suggestedFoodsPortions.isNotEmpty && _selectedCombinationFoods.isNotEmpty && _combinationMacros.isNotEmpty){
                          logFoodsOfToday(state.loggedFoods.foods);
                        }
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
                        if(_suggestedFoodsPortions.isNotEmpty && _selectedCombinationFoods.isNotEmpty && _combinationMacros.isNotEmpty){
                          _suggestedFoodsPortions = [];
                          _combinationMacros = [];
                          _selectedCombinationFoods= [];
                          showSuccessToast(context, LOGGED_SUCCESSFULLY);
                          Navigator.pop(context);
                        }
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


            ],
          )
        ),
      ),
    );
  }




  Widget _newFoodInfo(Food food) {
    return Visibility(
      visible: food.isAddedByUser == false,
      child: GestureDetector(
        onTap: (){
          showInfoDialog(context, NEW_FOOD_ADDED_IN_WIZRD_MSG);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 150,
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: LIGHT_GREY_COLOR,
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    NEW_LABEL,
                    style: TextStyle(fontSize: 8.0, fontWeight: FontWeight.bold, color: DARK_PRIMARY_COLOR),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 1.0),
                  Icon(
                    Icons.help_outline,
                    color: DARK_PRIMARY_COLOR,
                    size: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  void calculateFoodsCombinationsMacros(){
    for (int i = 0; i < _suggestedFoodsPortions.length; i++){
      List<Food> foods = _suggestedFoodsPortions[i].foods;
      List<double> macros = [];
      double calorie = 0;
      double protein = 0;
      double carb = 0;
      double fat = 0;

      for (int j = 0; j < foods.length; j++){
        Food food = foods[j];
        double portion = foods[j].count;

        if(food.foodType == FoodType.groceryProduct){
          food.calorie.forEach((element) {
            calorie = calorie + (portion * double.parse(element));
          });

          food.protein.forEach((element) {
            protein = protein + (portion * double.parse(element));
          });

          food.carb.forEach((element) {
            carb = carb + (portion * double.parse(element));
          });

          food.fat.forEach((element) {
            fat = fat + (portion * double.parse(element));
          });
        }else{
          if(food.ingredients.length == food.calorie.length){
            for(int i = 0; i < food.ingredients.length; i++){
              calorie= calorie + (double.parse(food.calorie[i])  * portion);
              protein= protein + (double.parse(food.protein[i])  * portion);
              carb= carb + (double.parse(food.carb[i])  * portion);
              fat= fat + (double.parse(food.fat[i])  * portion);
            }
          }else{
            food.calorie.forEach((element) {
              calorie = calorie + (portion * double.parse(element));
            });

            food.protein.forEach((element) {
              protein = protein + (portion * double.parse(element));
            });

            food.carb.forEach((element) {
              carb = carb + (portion * double.parse(element));
            });

            food.fat.forEach((element) {
              fat = fat + (portion * double.parse(element));
            });
          }
        }
      }

      macros.add(calorie);
      macros.add(protein);
      macros.add(carb);
      macros.add(fat);

      _combinationMacros.add(macros);
    }
  }


  void _cleanData(){

    List<List<Food>> newFoods = [];
    List<List<List<TextEditingController>>> amountControllers = [];


    List<Food> mealFoods = [];


    //breakfast
    List<Food> foods = _suggestedFoodsPortions[_currentPage].foods;

    List<List<TextEditingController>> breakfastAmountControllers = [];
    List<Food> breakfastFoods = foods.where((food) => food.dishType == "Breakfast").toList();
    if (breakfastFoods.isNotEmpty){
      newFoods.add(breakfastFoods);

      breakfastFoods.forEach((food) {
        List<TextEditingController> dishAmountControllers = [];

        if(food.foodType == FoodType.groceryProduct){


          double amount= getServingAmount(widget.isSavedMealPlan, food.units.isEmpty ? '1.0' : food.units[0], food.servingAmounts[0]);

          TextEditingController controller = TextEditingController(
              text: convertDoubleToFraction(food.count * amount));

          controller.addListener(() {
            _recalculateTotalMacros(amountControllers);
          });

          dishAmountControllers.add(controller);

          mealFoods.add(
            food.copyWith(
              count: 1,
              units: [getServingUnit(food.units.isEmpty ? '' : food.units[0])],
              servingAmounts: widget.isSavedMealPlan ? food.servingAmounts : [(food.count * amount).toString()]
            )
          );

        }else{
          List<String> units= [];
          List<String> amounts= [];
          for (int i = 0; i < food.ingredients.length; i++) {
            TextEditingController controller = TextEditingController(
                text: convertDoubleToFraction(food.count * double.parse(food.servingAmounts[i])));

            controller.addListener(() {
              _recalculateTotalMacros(amountControllers);
            });

            dishAmountControllers.add(controller);


            amounts.add((food.count * double.parse(food.servingAmounts[i])).toString());
            units.add(getServingUnit(food.units.isEmpty ? '' : food.units[i]));


          }
          mealFoods.add(
              food.copyWith(
                  count: 1,
                  units: units,
                  servingAmounts: amounts
              )
          );
        }

        breakfastAmountControllers.add(dishAmountControllers);

      });

      amountControllers.add(breakfastAmountControllers);
    }



    //lunch
    List<Food> lunchFoods = foods.where((food) => food.dishType == "Lunch").toList();
    List<List<TextEditingController>> lunchAmountControllers = [];
    if (lunchFoods.isNotEmpty){
      newFoods.add(lunchFoods);

      lunchFoods.forEach((food) {
        List<TextEditingController> dishAmountControllers = [];

        if(food.foodType == FoodType.groceryProduct){

          double amount= getServingAmount(widget.isSavedMealPlan, food.units.isEmpty ? '1.0' : food.units[0], food.servingAmounts[0]);

          TextEditingController controller = TextEditingController(
              text: convertDoubleToFraction(food.count * amount));

          controller.addListener(() {
            _recalculateTotalMacros(amountControllers);
          });

          dishAmountControllers.add(controller);

          mealFoods.add(
              food.copyWith(
                  count: 1,
                  units: [getServingUnit(food.units.isEmpty ? '' : food.units[0])],
                  servingAmounts: widget.isSavedMealPlan ? food.servingAmounts : [(food.count * amount).toString()]
              )
          );

        }else{
          List<String> units= [];
          List<String> amounts= [];

          for (int i = 0; i < food.ingredients.length; i++) {
            TextEditingController controller = TextEditingController(
                text: convertDoubleToFraction(food.count * double.parse(food.servingAmounts[i])));

            controller.addListener(() {
              _recalculateTotalMacros(amountControllers);
            });

            dishAmountControllers.add(controller);

            amounts.add((food.count * double.parse(food.servingAmounts[i])).toString());
            units.add(food.units.isEmpty ? '' : food.units[i]);

          }

          mealFoods.add(
              food.copyWith(
                  count: 1,
                  units: units,
                  servingAmounts: amounts
              )
          );

        }

        lunchAmountControllers.add(dishAmountControllers);

      });

      amountControllers.add(lunchAmountControllers);

    }



    //dinner
    List<Food> dinnerFoods = foods.where((food) => food.dishType == "Dinner").toList();
    List<List<TextEditingController>> dinnerAmountControllers = [];
    if (dinnerFoods.isNotEmpty){
      newFoods.add(dinnerFoods);

      dinnerFoods.forEach((food) {
        List<TextEditingController> dishAmountControllers = [];

        if(food.foodType == FoodType.groceryProduct){

          double amount= getServingAmount(widget.isSavedMealPlan, food.units.isEmpty ? '1.0' : food.units[0], food.servingAmounts[0]);

          TextEditingController controller = TextEditingController(
              text: convertDoubleToFraction(food.count * amount));

          controller.addListener(() {
            _recalculateTotalMacros(amountControllers);
          });

          dishAmountControllers.add(controller);

          mealFoods.add(
              food.copyWith(
                  count: 1,
                  units: [getServingUnit(food.units.isEmpty ? '' : food.units[0])],
                  servingAmounts: widget.isSavedMealPlan ? food.servingAmounts : [(food.count * amount).toString()]
              )
          );


        }else{
          List<String> units= [];
          List<String> amounts= [];

          for (int i = 0; i < food.ingredients.length; i++) {
            TextEditingController controller = TextEditingController(
                text: convertDoubleToFraction(food.count * double.parse(food.servingAmounts[i])));

            controller.addListener(() {
              _recalculateTotalMacros(amountControllers);
            });

            dishAmountControllers.add(controller);

            amounts.add((food.count * double.parse(food.servingAmounts[i])).toString());
            units.add(getServingUnit(food.units.isEmpty ? '' : food.units[i]));


          }

          mealFoods.add(
              food.copyWith(
                  count: 1,
                  units: units,
                  servingAmounts: amounts
              )
          );
        }

        dinnerAmountControllers.add(dishAmountControllers);

      });

      amountControllers.add(dinnerAmountControllers);

    }



    //snack
    List<Food> snackFoods = foods.where((food) => food.dishType == "Snack").toList();
    List<List<TextEditingController>> snackAmountControllers = [];
    if (snackFoods.isNotEmpty){
      newFoods.add(snackFoods);

      snackFoods.forEach((food) {
        List<TextEditingController> dishAmountControllers = [];

        if(food.foodType == FoodType.groceryProduct){

          double amount= getServingAmount(widget.isSavedMealPlan, food.units.isEmpty ? '1.0' : food.units[0], food.servingAmounts.isEmpty ? '' : food.servingAmounts[0]);

          TextEditingController controller = TextEditingController(
              text: convertDoubleToFraction(food.count * amount));

          controller.addListener(() {
            _recalculateTotalMacros(amountControllers);
          });

          dishAmountControllers.add(controller);

          mealFoods.add(
              food.copyWith(
                  count: 1,
                  units: [getServingUnit(food.units.isEmpty ? '' : food.units[0])],
                  servingAmounts: widget.isSavedMealPlan ? food.servingAmounts : [(food.count * amount).toString()]
              )
          );


        }else{
          List<String> units= [];
          List<String> amounts= [];
          for (int i = 0; i < food.ingredients.length; i++) {
            TextEditingController controller = TextEditingController(
                text: convertDoubleToFraction(food.count * double.parse(food.servingAmounts[i])));

            controller.addListener(() {
              _recalculateTotalMacros(amountControllers);
            });

            dishAmountControllers.add(controller);

            amounts.add((food.count * double.parse(food.servingAmounts[i])).toString());
            units.add(getServingUnit(food.units.isEmpty ? '' : food.units[i]));

          }

          mealFoods.add(
              food.copyWith(
                  count: 1,
                  units: units,
                  servingAmounts: amounts
              )
          );
        }

        snackAmountControllers.add(dishAmountControllers);

      });

      amountControllers.add(snackAmountControllers);
    }



    _mealPlan= _mealPlan.copyWith(foods: mealFoods, totalMacro: widget.wizardResponse.foodsPortions[_currentPage].totalMacro);
    _orderedFoods= newFoods;
    _amountControllers= amountControllers;
  }




  void _recalculateTotalMacros(List<List<List<TextEditingController>>> amountsController){
    debouncer.run(() {
      setState(() {
        _amountControllers= amountsController;
      });
    });
  }

  Widget _buildFoodsPortions(){

    return ListView.builder(
      shrinkWrap: true, // Ensure the list takes up only the necessary space
      physics: const NeverScrollableScrollPhysics(), // Disable parent scrolling
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemCount: _orderedFoods.length,
      itemBuilder: (context, index) {

        return InkWell(
          child: Container(
            margin: const EdgeInsets.only(left: 4, right: 4, bottom: 8),
            decoration: BoxDecoration(
              color: WIZARD_BG_COLOR,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: LIGHT_GREY_COLOR,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: const BoxDecoration(
                    color: MASTERPIE_YELLOW_COLOR, // Background color
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),  // Set the radius for top left corner
                      topRight: Radius.circular(10.0), // Set the radius for top right corner
                    ),
                  ),
                  child: Text(
                    _orderedFoods[index][0].dishType,
                    style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: DARK_PRIMARY_COLOR),
                  ),
                ),


                const SizedBox(height: 8),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: _orderedFoods[index].length,
                    itemBuilder: (context, innerIndex) {


                      Food food = _orderedFoods[index][innerIndex];

                      String macroDetails = '';
                      double calorie = 0, protein = 0, carb = 0, fat = 0;


                      // Calculating macronutrients based on food type
                      if (food.foodType == FoodType.meal) {
                        for(int k = 0; k < food.ingredients.length; k++){

                          final enteredServingAmount= parseMixedNumber(_amountControllers[index][innerIndex][k].text.isEmpty ? '0.0' : _amountControllers[index][innerIndex][k].text);
                          final actualServingAmount= food.count * double.parse(food.servingAmounts[k]);
                          final actualCalorie= double.parse(food.calorie[k]);
                          final actualProtein= double.parse(food.protein[k]);
                          final actualCarb= double.parse(food.carb[k]);
                          final actualFat= double.parse(food.fat[k]);

                          final newCalorie= actualCalorie * enteredServingAmount / actualServingAmount * food.count;
                          final newProtein= actualProtein * enteredServingAmount / actualServingAmount * food.count;
                          final newCarb= actualCarb * enteredServingAmount / actualServingAmount * food.count;
                          final newFat= actualFat * enteredServingAmount / actualServingAmount * food.count;


                          calorie= calorie + newCalorie;
                          protein= protein+ newProtein;
                          carb= carb + newCarb;
                          fat= fat + newFat;

                        }
                      } else{
                        if(double.parse(food.calorie[0]) < 6){
                          calorie= 0;
                          protein= 0;
                          carb= 0;
                          fat= 0;
                        }else{

                          double amount= getServingAmount(widget.isSavedMealPlan, food.units.isEmpty ? '1.0' : food.units[0], food.servingAmounts.isEmpty ? '' : food.servingAmounts[0]);

                          final enteredServingAmount= parseMixedNumber(_amountControllers[index][innerIndex][0].text.isEmpty ? '0.0' : _amountControllers[index][innerIndex][0].text);
                          final actualServingAmount= food.count * amount;
                          final actualCalorie= double.parse(food.calorie[0]);
                          final actualProtein= double.parse(food.protein[0]);
                          final actualCarb= double.parse(food.carb[0]);
                          final actualFat= double.parse(food.fat[0]);

                          final newCalorie= actualCalorie * enteredServingAmount / actualServingAmount * food.count;
                          final newProtein= actualProtein * enteredServingAmount / actualServingAmount * food.count;
                          final newCarb= actualCarb * enteredServingAmount / actualServingAmount * food.count;
                          final newFat= actualFat * enteredServingAmount / actualServingAmount * food.count;

                          calorie= calorie + newCalorie;
                          protein= protein+ newProtein;
                          carb= carb + newCarb;
                          fat= fat + newFat;
                        }
                      }

                      macroDetails = '${calorie.toInt()}cal, ${protein.toInt()}g protein, ${carb.toInt()}g carb, ${fat.toInt()}g fat';


                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const SizedBox(height: 8),

                          _newFoodInfo(food),

                          const SizedBox(height: 8),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(food.foodType == FoodType.meal ? HOW_MUCH_EAT_PATH : GROCERY_PATH, width: 25, height: 25),
                              const SizedBox(width: 8),
                              if (food.foodType == FoodType.meal)
                                Flexible(
                                  child: Text(
                                    food.name,
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: DARK_PRIMARY_COLOR),
                                  ),
                                ),
                              if (food.foodType == FoodType.groceryProduct && double.parse(food.calorie[0]) < 6)
                                Flexible(
                                  child: Text(
                                    food.name,
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: DARK_PRIMARY_COLOR),
                                  ),
                                ),
                              if (food.foodType == FoodType.groceryProduct && double.parse(food.calorie[0]) >= 6)
                                SizedBox(
                                  width: 300,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: groceryAmountWidgetWidth,
                                        height: 35,
                                        child: TextField(
                                          controller: _amountControllers[index][innerIndex][0],
                                          maxLines: 1,
                                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(RegExp(r'[0-9./ ]')),
                                          ],
                                          textInputAction: TextInputAction.done,
                                          textAlign: TextAlign.center,
                                          textAlignVertical: TextAlignVertical.top,
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
                                          style: const TextStyle(color: DARK_PRIMARY_COLOR),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Flexible(
                                        child: Text(
                                          '${getServingUnit(food.units.isEmpty ? '' : food.units[0])} ${food.name}',
                                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: DARK_PRIMARY_COLOR),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            macroDetails,
                            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                          const SizedBox(height: 8),
                          if (food.foodType == FoodType.meal)
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemCount: _orderedFoods[index][innerIndex].ingredients.length,
                                itemBuilder: (context, innerInnerIndex){

                                  String ingredient = '';
                                  if (food.foodType == FoodType.meal) {
                                    if(double.parse(food.calorie[innerInnerIndex]) < 6){
                                      ingredient= '${food.ingredients[innerInnerIndex]},';
                                    }else{
                                      ingredient = '${food.units[innerInnerIndex]} ${food.ingredients[innerInnerIndex]},';
                                    }
                                  }


                                  return Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        if(double.parse(food.calorie[innerInnerIndex]) >= 6)
                                        SizedBox(
                                          width: mealIngredientAmountWidgetWidth,
                                          height: 30,
                                          child: TextField(
                                            controller: _amountControllers[index][innerIndex][innerInnerIndex],
                                            maxLines: 1,
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(RegExp(r'[0-9./ ]')),
                                            ],
                                            textInputAction: TextInputAction.done,
                                            textAlign: TextAlign.center,
                                            textAlignVertical: TextAlignVertical.top,
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
                                            style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 11),
                                          ),
                                        ),


                                        if(double.parse(food.calorie[innerInnerIndex]) >= 6)
                                          const SizedBox(width: 8,),

                                        if(double.parse(food.calorie[innerInnerIndex]) < 6)
                                          const SizedBox(width: 8+ mealIngredientAmountWidgetWidth,),

                                          Flexible(
                                          child: Text(
                                            ingredient,
                                            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: MASTERPIE_ORANGE_COLOR),
                                          ),
                                        ),

                                      ],
                                    ),
                                  );
                                }
                            )


                          // const SizedBox(height: 8),
                        ],
                      );
                    },
                  ),
                ),


              ],
            ),
          ),
        );
      },
    );

  }



  Widget _totalMacroInfo(){

    double totalCalorie= 0;
    double totalProtein= 0;
    double totalCarb= 0;
    double totalFat= 0;


    List<Food> mealFoods= [];


    for(int i = 0; i < _orderedFoods.length; i++){
      for(int j = 0; j < _orderedFoods[i].length; j++){
        Food food= _orderedFoods[i][j];

        if(food.foodType == FoodType.groceryProduct){
          double amount= getServingAmount(widget.isSavedMealPlan, food.units.isEmpty ? '1.0' : food.units[0], food.servingAmounts.isEmpty ? '' : food.servingAmounts[0]);

          final enteredServingAmount= parseMixedNumber(_amountControllers[i][j][0].text.isEmpty ? '0.0' : _amountControllers[i][j][0].text);
          final actualServingAmount= food.count * amount;

          final actualCalorie= double.parse(food.calorie[0]);
          final actualProtein= double.parse(food.protein[0]);
          final actualCarb= double.parse(food.carb[0]);
          final actualFat= double.parse(food.fat[0]);

          final newCalorie= actualCalorie * enteredServingAmount / actualServingAmount * food.count;
          final newProtein= actualProtein * enteredServingAmount / actualServingAmount * food.count;
          final newCarb= actualCarb * enteredServingAmount / actualServingAmount * food.count;
          final newFat= actualFat * enteredServingAmount / actualServingAmount * food.count;


          mealFoods.add(
            food.copyWith(
              count: 1,
              servingAmounts: [enteredServingAmount.toString()],
              calorie: [newCalorie.toString()],
              protein: [newProtein.toString()],
              carb: [newCarb.toString()],
              units: [getServingUnit(food.units.isEmpty ? '' : food.units[0])],
              fat: [newFat.toString()]
            )
          );


          totalCalorie= totalCalorie + newCalorie;
          totalProtein= totalProtein+ newProtein;
          totalCarb= totalCarb + newCarb;
          totalFat= totalFat + newFat;

        }else{


          List<String> units= [];
          List<String> amounts= [];
          List<String> calories= [];
          List<String> protein= [];
          List<String> carb= [];
          List<String> fat= [];


          for(int k = 0; k < food.ingredients.length; k++){

            final enteredServingAmount= parseMixedNumber(_amountControllers[i][j][k].text.isEmpty ? '0.0' : _amountControllers[i][j][k].text);
            final actualServingAmount= food.count * (double.parse(food.servingAmounts[k]) == 0.0 ? 1.0 : double.parse(food.servingAmounts[k]));
            final actualCalorie= double.parse(food.calorie[k]);
            final actualProtein= double.parse(food.protein[k]);
            final actualCarb= double.parse(food.carb[k]);
            final actualFat= double.parse(food.fat[k]);

            final newCalorie= actualCalorie * enteredServingAmount / actualServingAmount * food.count;
            final newProtein= actualProtein * enteredServingAmount / actualServingAmount * food.count;
            final newCarb= actualCarb * enteredServingAmount / actualServingAmount * food.count;
            final newFat= actualFat * enteredServingAmount / actualServingAmount * food.count;

            amounts.add(enteredServingAmount.toString());
            calories.add(newCalorie.toString());
            protein.add(newProtein.toString());
            carb.add(newCarb.toString());
            fat.add(newFat.toString());
            units.add(food.units.isEmpty ? '' : food.units[0]);


            totalCalorie= totalCalorie + newCalorie;
            totalProtein= totalProtein+ newProtein;
            totalCarb= totalCarb + newCarb;
            totalFat= totalFat + newFat;

          }

          mealFoods.add(
              food.copyWith(
                  count: 1,
                  servingAmounts: amounts,
                  units: units,
                  calorie: calories,
                  protein: protein,
                  carb: carb,
                  fat: fat
              )
          );
        }

      }
    }


    _mealPlan= _mealPlan.copyWith(
      foods: mealFoods,
      totalMacro: [totalCalorie, totalProtein, totalCarb, totalFat]
    );


    return   Container(
      padding: const EdgeInsets.all(24),
      color: DARK_PRIMARY_COLOR,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            ///calorie
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  totalCalorie.toInt().toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold, color: MASTERPIE_YELLOW_COLOR, fontSize: 36),
                ),
                Text(
                  '/${widget.wizardResponse.macroGoal[0]} cal',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 18),
                ),
              ],
            ),

            const SizedBox(height: 24,),

            Row(
              children: [
                /// protein
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 140,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: DARK_PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(BORDER_RADIUS),
                      border: Border.all(
                        color: LIGHT_GREY_COLOR,
                        width: 1,
                      ),
                    ),
                    margin: const EdgeInsets.all(MACRO_MARGIN),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          PROTEIN_LABEL,
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: MASTERPIE_YELLOW_COLOR),
                        ),

                        const SizedBox(height: 8,),

                        Text(
                          '${totalProtein.toInt()}/${widget.wizardResponse.macroGoal[1]} g',
                          textAlign: TextAlign.center,
                          style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white),
                        ),
                      ],
                    )
                  ),
                ),

                const SizedBox(width: 2,),

                /// carb
                Expanded(
                  child: Container(
                      width: double.infinity,
                      height: 140,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: DARK_PRIMARY_COLOR,
                        borderRadius: BorderRadius.circular(BORDER_RADIUS),
                        border: Border.all(
                          color: LIGHT_GREY_COLOR,
                          width: 1,
                        ),
                      ),
                      margin: const EdgeInsets.all(MACRO_MARGIN),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            CARB_LABEL,
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: MASTERPIE_YELLOW_COLOR),
                          ),

                          const SizedBox(height: 8,),

                          Text(
                            '${totalCarb.toInt()}/${widget.wizardResponse.macroGoal[2]} g',
                            textAlign: TextAlign.center,
                            style:
                            const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white),
                          ),
                        ],
                      )
                  ),
                ),



                const SizedBox(width: 2,),

                
                /// fat
                Expanded(
                  child: Container(
                      width: double.infinity,
                      height: 140,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: DARK_PRIMARY_COLOR,
                        borderRadius: BorderRadius.circular(BORDER_RADIUS),
                        border: Border.all(
                          color: LIGHT_GREY_COLOR,
                          width: 1,
                        ),
                      ),
                      margin: const EdgeInsets.all(MACRO_MARGIN),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            FAT_LABEL,
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: MASTERPIE_YELLOW_COLOR),
                          ),

                          const SizedBox(height: 8,),

                          Text(
                            '${totalFat.toInt()}/${widget.wizardResponse.macroGoal[3]} g',
                            textAlign: TextAlign.center,
                            style:
                            const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white),
                          ),
                        ],
                      )
                  ),
                ),


              ],
            ),



          ],
        ),
      ),
    );
  }


  Widget _helperMessage(){
    return Column(
      children: [

        Visibility(
          visible: widget.wizardResponse.messages.isNotEmpty && !_messageExpanded,
          child: GestureDetector(
            onTap: (){
              setState(() {
                _messageExpanded= !_messageExpanded;
              });
            },
            child: Container(
              color: MASTERPIE_YELLOW_COLOR,
              padding: const EdgeInsets.all(16),
              child: const Row(
                children: [

                  Icon(
                    Icons.arrow_right,
                    color: DARK_PRIMARY_COLOR,
                  ),

                  SizedBox(width: 4,),

                  Flexible(
                    child: Text(
                      IMPROVE_ACCURACY_WARNING,
                      style: TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),


        Visibility(
          visible: widget.wizardResponse.messages.isNotEmpty && _messageExpanded,
          child: GestureDetector(
            onTap: (){
              setState(() {
                _messageExpanded= !_messageExpanded;
              });
            },
            child: Container(
              color: MASTERPIE_YELLOW_COLOR,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [

                      Icon(
                        Icons.arrow_drop_down,
                        color: DARK_PRIMARY_COLOR,
                      ),

                      SizedBox(width: 4,),

                      Flexible(
                        child: Text(
                          IMPROVE_ACCURACY_WARNING,
                          style: TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8,),

                  ...widget.wizardResponse.messages.map((item) => Text(
                    '- $item',
                    style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 14),
                  )).toList(),
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }

  void logFoodsOfToday(List<Food> foodsLoggedBefore){

    List<Food> foods = [];
    foods.addAll(foodsLoggedBefore);
    foods.addAll(_selectedCombinationFoods);

    _logFoodsBloc.add(
        LogFoodsEvent.onLogFoods(foods)
    );

  }


  Widget savePlanBtn(){
    return Visibility(
      visible: !widget.isSavedMealPlan,
      child: Positioned(
        bottom: 36,
        left: 16,
        right: 16,
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {

                printWrapped('save_plan: $_mealPlan');

                showDialog(
                  context: context,
                  builder: (context) {
                    return AskMealPlanNameDialog(mealPlan: _mealPlan);
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                  ),
                  backgroundColor: DARK_PRIMARY_COLOR,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3)
              ),
              child: const Text(SAVE_MEAL_PLAN,
                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
              )
          ),
        ),
      ),
    );
  }

  void requestLoggedFoods(){
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    _getLoggedFoodsBloc.add(
        GetLoggedFoodsEvent.onGetLoggedFoods(formattedDate)
    );
  }


  Widget foodsCombinationMacros(int index){
    return Row(

      children: [

        ///calorie
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: MACRO_PORTION_RECOM_COLOR,
              borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '${_combinationMacros[index][0].toInt()} $CALORIE_LABEL',
                style: const TextStyle(
                    color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),


        // const SizedBox(width: 4,),

        ///protein
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            margin: const EdgeInsets.only(left: 4),
            decoration: BoxDecoration(
              color: MACRO_PORTION_RECOM_COLOR,
              borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '${_combinationMacros[index][1].toInt()} $GRAM_LABEL $PROTEIN_LABEL',
                style: const TextStyle(
                    color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
        ),




        ///carb
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            margin: const EdgeInsets.only(left: 4),
            decoration: BoxDecoration(
              color: MACRO_PORTION_RECOM_COLOR,
              borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '${_combinationMacros[index][2].toInt()} $GRAM_LABEL $CARB_LABEL',
                style: const TextStyle(
                    color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
        ),




        ///fat
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            margin: const EdgeInsets.only(left: 4),
            decoration: BoxDecoration(
              color: MACRO_PORTION_RECOM_COLOR,
              borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '${_combinationMacros[index][3].toInt()} $GRAM_LABEL $FAT_LABEL',
                style: const TextStyle(
                    color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }

  Widget foodsPortionsList(List<Food> foods){

    String foodsPortions= '';
    foods.forEach((element) {
      final name= element.name;
      final count= element.count;
      foodsPortions= '$foodsPortions$count $name, ';
    });


    return Text(
      foodsPortions,
      style: const TextStyle(
          color: Colors.black, fontSize: FONT_SIZE_TITLE, fontWeight: FontWeight.normal
      ),
    );
  }

  Widget foodsCombinationAccuracy(int accuracy){
    return Text(
        '$accuracy% $ACCURACY_LABEL',
        style: const TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600
        ),
      );
  }

}
