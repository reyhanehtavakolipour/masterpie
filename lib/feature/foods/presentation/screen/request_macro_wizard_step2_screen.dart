import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/foods/presentation/screen/manual_food_macro_wizard_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/search_grocery_macro_wizard_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/search_recipe_macro_wizard_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/suggest_food_macro_wizard_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/suggested_different_foods_combination_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/foods_macro_list_ui.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/request_wizard_argument_model.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../data/repository_impl/foods_repository_impl.dart';
import '../../domain/model/food_model.dart';
import '../bloc/suggest_portion_bloc/state_event/suggest_portion_state_event.dart';
import '../bloc/suggest_portion_bloc/suggest_portion_bloc.dart';



class RequestMacroWizardStepTwoScreen extends StatefulWidget {

   final RequestWizardArgumentModel requestWizardArgumentModel;


   const RequestMacroWizardStepTwoScreen({super.key, required this.requestWizardArgumentModel});

  @override
  State<RequestMacroWizardStepTwoScreen> createState() => _RequestMacroWizardStepTwoScreenState();
}

class _RequestMacroWizardStepTwoScreenState extends State<RequestMacroWizardStepTwoScreen> {

  late RequestWizardArgumentModel _requestWizardArgumentModel;

  final List<bool> _foodsExpansionState = [];

  late SuggestPortionsBloc _suggestPortionsBloc;


  @override
  void initState() {
    super.initState();
    _suggestPortionsBloc = context.read<SuggestPortionsBloc>();
    _suggestPortionsBloc.add(const SuggestFoodsPortionEvent.onReset());
    _requestWizardArgumentModel= widget.requestWizardArgumentModel;
    _requestWizardArgumentModel.foods.forEach((element) {
      _foodsExpansionState.add(false);
    });

  }

  Widget addFoodOptions(){
    return Column(
      children: [

        Row(
          children: [
            Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: DARK_PRIMARY_COLOR
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchGroceryMacroWizardScreen(requestWizardArgumentModel: _requestWizardArgumentModel)),
                    ).then((result) {
                      setState(() {
                        _requestWizardArgumentModel= result;
                        _requestWizardArgumentModel.foods.forEach((element) {
                          _foodsExpansionState.add(false);
                        });
                      });
                    });

                  },
                  child: const Text(SEARCH_GROCERY_LABEL, style: TextStyle( color: Colors.white),),
                ),
            ),
            const SizedBox(width: 4,),
            Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: DARK_PRIMARY_COLOR
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchRecipeMacroWizardScreen(),
                      ),
                    );
                  },
                  child: const Text(SEARCH_RECIPE_LABEL, style: TextStyle( color: Colors.white),),
                ),
            ),
          ],
        ),

        const SizedBox(height: 4,),

        Row(
          children: [
            Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: DARK_PRIMARY_COLOR
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuggestFoodMacroWizardScreen(),
                      ),
                    );
                  },
                  child: const Text(SUGGEST_FOOD_LABEL, style: TextStyle( color: Colors.white),),
                ),
            ),
            const SizedBox(width: 4,),
            Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: DARK_PRIMARY_COLOR
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ManualFoodMacroWizardScreen(),
                      ),
                    );
                  },
                  child: const Text(MANUAL_LABEL, style: TextStyle( color: Colors.white),),
                ),
            ),
          ],
        )

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
              Navigator.pop(context, _requestWizardArgumentModel);
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  const SizedBox(height: 8,),

                                  const Text('$ADD_FOOD_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

                                  const SizedBox(height: 8,),

                                  /// add food options
                                  addFoodOptions(),

                                  const SizedBox(height: 4,),

                                ],
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
              _requestWizardArgumentModel.servingRanges.forEach((element) {
                List<double> list = [];
                list.add(element.start);
                list.add(element.end);
                servings.add(list);
              });

              _suggestPortionsBloc.add(
                  SuggestFoodsPortionEvent.onSuggestFoodsPortion(
                      _requestWizardArgumentModel.foods,
                      servings,
                      widget.requestWizardArgumentModel.macroGoalRanges,
                      widget.requestWizardArgumentModel.restriction
                  )
              );
            },
            child: const Text(REQUEST_PORTIONS_LABEL, style: TextStyle( color: Colors.white),),
        ),
      );
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
        visible: _requestWizardArgumentModel.foods.isNotEmpty,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16,),
            const Text('$FOODS_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),
            const SizedBox(height: 16,),
            FoodsMacroListUi(foods: _requestWizardArgumentModel.foods, foodsExpansionState: _foodsExpansionState,
              onExpansionStateChanged: updateFoodsExpansionStateListUi, onFoodsUpdated: updateUiAfterFoodsUpdated, foodsServingRanges: _requestWizardArgumentModel.servingRanges,
            )
          ],
        )
    );
  }

  void updateUiAfterFoodsUpdated(List<Food> foods, List<RangeValues> ranges){
    setState(() {
      _requestWizardArgumentModel= _requestWizardArgumentModel.copyWith(
        foods: foods,
        servingRanges: ranges
      );
    });
  }

}
