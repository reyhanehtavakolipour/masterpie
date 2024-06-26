import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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
import 'package:masterpie/main_screen.dart';
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
    return Row(
      children: [

        const SizedBox(width: 4,),

        /// search grocery
        Expanded(
          child: GestureDetector(
            onTap: (){
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
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
              decoration: BoxDecoration(
                color: DARK_PRIMARY_COLOR,
                borderRadius: BorderRadius.circular(20), // Makes the container rounded
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset(SEARCH_GROCERY_PATH, color: Colors.white, width: 48, height: 48,),

                  const SizedBox(height: 16,),

                  const Text(SEARCH_GROCERY_WIZARD, style: TextStyle( color: Colors.white), textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
        ),


        const SizedBox(width: 4,),

        /// search recipe
        Expanded(
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchRecipeMacroWizardScreen(requestWizardArgumentModel: _requestWizardArgumentModel,),
                ),
              ).then((result) {
                setState(() {
                  _requestWizardArgumentModel= result;
                  _requestWizardArgumentModel.foods.forEach((element) {
                    _foodsExpansionState.add(false);
                  });
                });
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
              decoration: BoxDecoration(
                color: DARK_PRIMARY_COLOR,
                borderRadius: BorderRadius.circular(20), // Makes the container rounded
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset(SEARCH_RECIPE_PATH, color: Colors.white, width: 48, height: 48,),

                  const SizedBox(height: 16,),

                  const Text(SEARCH_RECIPE_WIZARD, style: TextStyle( color: Colors.white), textAlign: TextAlign.center,),

                ],
              ),
            ),
          ),
        ),


        const SizedBox(width: 4,),

        /// create manual
        Expanded(
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ManualFoodMacroWizardScreen(requestWizardArgumentModel: _requestWizardArgumentModel,),
                ),
              ).then((result) {
                setState(() {
                  if(result != null){
                    _requestWizardArgumentModel= result;
                    _requestWizardArgumentModel.foods.forEach((element) {
                      _foodsExpansionState.add(false);
                    });
                  }
                });
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
              decoration: BoxDecoration(
                color: DARK_PRIMARY_COLOR,
                borderRadius: BorderRadius.circular(20), // Makes the container rounded
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(HOW_MUCH_EAT_PATH, color: Colors.white, width: 48, height: 48),

                  const SizedBox(height: 16,),

                  const Text(CREATE_MANUAL_LABEL, style: TextStyle( color: Colors.white), textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 4,),
      ]
    );
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
            title: const Text(HOW_MUCH_TO_EAT, style: TextStyle(color: Colors.white)),
            backgroundColor: PRIMARY_COLOR,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context, _requestWizardArgumentModel);
              },
              child: const Icon(Icons.arrow_back_ios, color: Colors.white,),
            ),
            actions: [
            ],
          ),
          body: Stack(
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

                                Container(
                                  color: MASTERPIE_YELLOW_COLOR,
                                  padding: const EdgeInsets.all(16),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      CircleAvatar(
                                        radius: 12, // Adjust the radius as needed
                                        backgroundColor: DARK_PRIMARY_COLOR,
                                        child: Text(
                                          '2',
                                          style: TextStyle(
                                            fontSize: 10, // Adjust the font size as needed
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                      ),

                                      SizedBox(width: 8,),

                                      Expanded(
                                        child: Text(ADD_FOODS_FOR_WIZARD,
                                          style: TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 13, fontWeight: FontWeight.bold),),
                                      ),
                                    ],
                                  ),
                                ),



                                const SizedBox(height: 4,),

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
                            builder: (context) => SuggestedDifferentFoodsCombinationScreen(wizardResponse: state.wizardResponseModel),
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
          ),
        ),
      ),
    );
  }


  Widget requestPortionsButton(){
    return Container(
            padding: const EdgeInsets.only(bottom: 24, left: 8, right: 8),
            width: double.infinity,
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: MASTERPIE_YELLOW_COLOR
            ),
            onPressed: () {

              if(UserRegistrationStatus.userAccountId.isNotEmpty){
                if(_requestWizardArgumentModel.foods.isEmpty){
                  showErrorToast(context, ERROR_ADD_FOOD);
                  return;
                }
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
                        widget.requestWizardArgumentModel.restriction,
                        widget.requestWizardArgumentModel.goalType,
                        widget.requestWizardArgumentModel.macroPercentage
                    )
                );
              }else{
                showRegisterDialog(context);
              }
            },
            child: const Text(REQUEST_PORTIONS_LABEL, style: TextStyle( color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
        ),
      );
  }

  void updateFoodsExpansionStateListUi(int index, bool state, bool isRemove, RangeValues rangeValues){
    setState(() {
      if(isRemove){
        _foodsExpansionState.removeAt(index);
      }else{
        if(state == true){
          for (int i = 0; i < _foodsExpansionState.length; i++) {
            _foodsExpansionState[i] = false;
          }
        }else{
          List<RangeValues> servingRanges = List<RangeValues>.from(_requestWizardArgumentModel.servingRanges);
          servingRanges[index] = rangeValues;
          _requestWizardArgumentModel= _requestWizardArgumentModel.copyWith(servingRanges: servingRanges);
        }
        _foodsExpansionState[index] = state;


      }
    });
  }

  Widget addedFoods(){
    return Visibility(
        visible: _requestWizardArgumentModel.foods.isNotEmpty,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16,),
              const Text(ADDED_FOODS, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 16),),
              const SizedBox(height: 16,),
              FoodsMacroListUi(foods: _requestWizardArgumentModel.foods, foodsExpansionState: _foodsExpansionState,
                onExpansionStateChanged: updateFoodsExpansionStateListUi, onFoodsUpdated: updateUiAfterFoodsUpdated, foodsServingRanges: _requestWizardArgumentModel.servingRanges,
              )
            ],
          ),
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
