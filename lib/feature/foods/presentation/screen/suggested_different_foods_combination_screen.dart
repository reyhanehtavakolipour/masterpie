

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/domain/model/food_type.dart';
import 'package:masterpie/util/core/helper/print.dart';
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

class SuggestedDifferentFoodsCombinationScreen extends StatefulWidget {


  final List<SuggestedFoodsPortion> suggestedPortionsList;

  const SuggestedDifferentFoodsCombinationScreen({super.key, required this.suggestedPortionsList});


  @override
  State<SuggestedDifferentFoodsCombinationScreen> createState() => _SuggestedDifferentFoodsCombinationScreenState();
}

class _SuggestedDifferentFoodsCombinationScreenState extends State<SuggestedDifferentFoodsCombinationScreen> {

  List<SuggestedFoodsPortion> _suggestedFoodsPortions = [];

  List<List<double>> _combinationMacros = [];

  List<Food> _selectedCombinationFoods= [];

  late GetLoggedFoodsBloc _getLoggedFoodsBloc;
  late LogFoodsBloc _logFoodsBloc;


  @override
  void initState() {
    super.initState();
    _suggestedFoodsPortions = widget.suggestedPortionsList;
    calculateFoodsCombinationsMacros();
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();
    _logFoodsBloc = context.read<LogFoodsBloc>();

    _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
    _logFoodsBloc.add(const LogFoodsEvent.onReset());
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
          for(int i = 0; i < food.servingIngredientsCount.length; i++){
            calorie= calorie + (double.parse(food.calorie[i]) * num.parse(food.servingIngredientsCount[i]) * portion);
            protein= protein + (double.parse(food.protein[i]) * num.parse(food.servingIngredientsCount[i]) * portion);
            carb= carb + (double.parse(food.carb[i]) * num.parse(food.servingIngredientsCount[i]) * portion);
            fat= fat + (double.parse(food.fat[i]) * num.parse(food.servingIngredientsCount[i]) * portion);
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

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: MaterialApp(
        theme: ThemeData(fontFamily: MONTSERRAT_FONT),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(FOODS_COMBINATIONS_LABEL, style: TextStyle(color: Colors.white)),
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
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Stack(
              children: [
                ListView.builder(
                    itemCount: _suggestedFoodsPortions.length,
                    itemBuilder: (context, index){
                      List<Food> foods = _suggestedFoodsPortions[index].foods;
                      return Card(
                        margin: const EdgeInsets.only(top: 8, bottom: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(BORDER_RADIUS),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: DARK_PRIMARY_COLOR,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),    // Adjust the radius as needed
                                  topRight: Radius.circular(10.0),   // Adjust the radius as needed
                                ),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  foodsCombinationAccuracy(_suggestedFoodsPortions[index].accuracy),

                                  const SizedBox(height: 16,),

                                  foodsCombinationMacros(index)
                                ],
                              )
                            ),

                            Container(
                              padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 12),
                              color: BG_COMBINATION_BOTTOM_COLOR,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  foodsPortionsList(foods),

                                  const SizedBox(height: 12,),

                                  logFoodsButton(index)
                                ],
                              ),
                            )
                          ],
                        ),
                      );
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
            ),
          ),
        ),
      ),
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



  Widget logFoodsButton(int index){
    return Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
          onPressed: () {
            _selectedCombinationFoods = _suggestedFoodsPortions[index].foods;
            requestLoggedFoods();
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
            ),
            backgroundColor: MASTERPIE_YELLOW_COLOR,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3)
          ),
          child: const Text(LOG_FOODS_LABEL,
            style: TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 10, fontWeight: FontWeight.w600),
          )
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
