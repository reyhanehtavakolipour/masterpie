import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/foods/presentation/screen/suggested_different_foods_combination_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/foods_macro_list_ui.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/wait_popup.dart';
import 'package:masterpie/util/core/helper/print.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../util/core/constant/api_constant.dart';
import '../../../../util/core/constant/hive_constants.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../../user/data/local/datasource/user_hive_keyvalue_datasource.dart';
import '../../data/repository_impl/foods_repository_impl.dart';
import '../../domain/model/food_model.dart';
import '../bloc/auto_generate_bloc/auto_generate_foods_bloc.dart';
import '../bloc/auto_generate_bloc/state_event/auto_generate_foods_state_event.dart';
import '../bloc/suggest_portion_bloc/state_event/suggest_portion_state_event.dart';
import '../bloc/suggest_portion_bloc/suggest_portion_bloc.dart';

class ViewAutoGenerateMealsScreen extends StatefulWidget {

  final bool shouldGenerateFoods;

  final bool isView;

  final List<String> mainDishTypes;

  final List<String> sideDishTypes;

  final List<int> macroGoals;

  final List<Food>? mainDishFoods;

  final List<Food>? sideDishFoods;



  const ViewAutoGenerateMealsScreen({super.key, required this.shouldGenerateFoods, required this.isView, required this.mainDishTypes, required this.sideDishTypes,
    required this.macroGoals, this.mainDishFoods, this.sideDishFoods});

  @override
  State<ViewAutoGenerateMealsScreen> createState() => _ViewAutoGenerateMealsScreenState();
}


class _ViewAutoGenerateMealsScreenState extends State<ViewAutoGenerateMealsScreen> {


   List<Food> _mainDishFoods= [];

   List<Food> _sideDishFoods= [];

   List<String> _mainDishTypes= [];

   List<String> _sideDishTypes= [];

   late AutoGenerateFoodsBloc _autoGenerateFoodsBloc;

   late SuggestPortionsBloc _suggestPortionsBloc;


   @override
  void initState() {
    super.initState();
    _autoGenerateFoodsBloc = context.read<AutoGenerateFoodsBloc>();
    _suggestPortionsBloc = context.read<SuggestPortionsBloc>();

    if(widget.shouldGenerateFoods){
      _autoGenerateFoodsForDay();
    }else{
      setState(() {
        _mainDishFoods= widget.mainDishFoods!;
        _sideDishFoods= widget.sideDishFoods!;
        _mainDishTypes= widget.mainDishTypes;
        _sideDishTypes= widget.sideDishTypes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.isView,
      child: MaterialApp(
          theme: ThemeData(fontFamily: MONTSERRAT_FONT),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: LIGHT_GREY_COLOR,
            appBar: AppBar(
              title: const Text(MEALS_LABEL, style: TextStyle(color: Colors.white),),
              backgroundColor: PRIMARY_COLOR,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Visibility(
                  visible: widget.isView,
                    child: const Icon(Icons.arrow_back_ios, color: Colors.white,)
                ),
              ),
              actions: [
                Visibility(
                  visible:  widget.isView,
                  child: IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white,),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewAutoGenerateMealsScreen(shouldGenerateFoods: false, isView: false, macroGoals: widget.macroGoals,
                            mainDishTypes: widget.mainDishTypes, sideDishTypes: widget.sideDishTypes,
                          mainDishFoods: _mainDishFoods, sideDishFoods: _sideDishFoods,),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
             body: Padding(
               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
               child: Stack(
                 children: [
                   Column(
                     children: [


                       Expanded(
                           child: SingleChildScrollView(
                             child: Column(
                               children: [

                                 _buildWizardFoods()

                               ],
                             ),
                           )
                       ),


                       _nextButton(),

                       _confirmButton()

                     ],
                   ),


                   BlocConsumer<AutoGenerateFoodsBloc, AutoGenerateFoodsState>(
                       builder: (mcontext, state) {
                         if (state is AutoGenerateFoodsLoadingState) {
                           _autoGenerateFoodsBloc.add(const AutoGenerateFoodsEvent.onReset());
                           Future.delayed(Duration.zero,(){
                             showDialog(
                               context: context,
                               barrierDismissible: false,
                               builder: (context) {
                                 return WaitPopup(
                                   message: GENERATE_MEAL_PLAN,
                                   isForOneMeal: false,
                                 );
                               },
                             );
                           });
                         }else if(state is AutoGenerateFoodsForDayLoadedState){
                           _autoGenerateFoodsBloc.add(const AutoGenerateFoodsEvent.onReset());
                           Future.delayed(Duration.zero,(){
                             Navigator.of(context, rootNavigator: true).pop();
                             _setAllAutoGeneratedMealsInWizard(state.foods);
                           });
                         }else if(state is AutoGenerateFoodLoadedState){
                           _autoGenerateFoodsBloc.add(const AutoGenerateFoodsEvent.onReset());
                           Future.delayed(Duration.zero,(){
                             Navigator.of(context, rootNavigator: true).pop();
                             setState(() {
                               if(state.isMainDish){
                                 _mainDishFoods[state.index]= state.food;
                               }else{
                                 _sideDishFoods[state.index]= state.food;
                               }
                             });

                           });
                         }else if(state is AutoGenerateFoodsErrorState){
                           Navigator.of(context, rootNavigator: true).pop();
                           _autoGenerateFoodsBloc.add(const AutoGenerateFoodsEvent.onReset());
                           Future.delayed(Duration.zero,(){
                             return showErrorToast(context, state.message);
                           });
                         }else{
                         }
                         return Container();
                       },
                       listener: (context, state){

                       }
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
                             final wizardModel= state.wizardResponseModel.copyWith(macroGoal: widget.macroGoals);
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) => SuggestedDifferentFoodsCombinationScreen(wizardResponse: wizardModel),
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
          )
      ),
    );
  }



   void _setAllAutoGeneratedMealsInWizard(List<Food> foods){
     setState(() {
       List<Food> mainDishes= [];
       List<Food> sideDishes= [];

       for(int i = 0; i < widget.mainDishTypes.length; i++){
         if(i < foods.length){
           mainDishes.add(foods[i]);
         }
       }

       for(int i = widget.mainDishTypes.length; i < foods.length; i++){
         if(i < foods.length){
           sideDishes.add(foods[i]);
         }
       }

       _mainDishFoods= mainDishes;
       _sideDishFoods= sideDishes;

     });
   }

  Widget _buildWizardFoods(){
    return Visibility(
        visible: _mainDishFoods.isNotEmpty || _sideDishFoods.isNotEmpty ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4,),
            FoodsMacroListUi(isView: widget.isView, mainDishesFoods: _mainDishFoods, sideDishesFoods: _sideDishFoods,
              mainDishesTypes: widget.mainDishTypes, sideDishesTypes: widget.sideDishTypes,
              onRemoveDishClicked: updateUiAfterDishRemoved, onRemoveFoodClicked: updateUiAfterFoodRemoved,
              onMainDishClicked: _onMinDishClicked, onSideDishClicked: _onSideDishClicked,)
          ],
        ),
    );
  }

   void _onSideDishClicked(String source, int index){
     // if(source == CREATE_MANUAL_LABEL){
     //   showDialog(
     //     context: context,
     //     builder: (BuildContext context) {
     //       return ManualMealMacroForWizardDialog(type: SIDE_DISH_LABEL, onAddMealBtnClicked: _addMealMacroManuallyToWizard,
     //         index: index, onCreateManualClickedClicked: _onCreateManualFromScratchWizardClicked,
     //         onSearchGroceryClicked: _onSearchGroceryWizardClicked, onSearchRecipeClicked:_onSearchRecipeWizardClicked,);
     //     },
     //   );
     // }else if(source == AUTO_GENERATE_LABEL){
     //   _autoGenerateFood(_sideDishTypes[index], index, false);
     // }
   }

   void _onMinDishClicked(String source, int index){
     // if(source == CREATE_MANUAL_LABEL){
     //   showDialog(
     //     context: context,
     //     builder: (BuildContext context) {
     //       return ManualMealMacroForWizardDialog(type: MAIN_DISH_LABEL, onAddMealBtnClicked: _addMealMacroManuallyToWizard,
     //         index: index, onCreateManualClickedClicked: _onCreateManualFromScratchWizardClicked,
     //         onSearchGroceryClicked: _onSearchGroceryWizardClicked, onSearchRecipeClicked:_onSearchRecipeWizardClicked,);
     //     },
     //   );
     // }else if(source == AUTO_GENERATE_LABEL){
     //   _autoGenerateFood(_mainDishTypes[index], index, true);
     // }
   }

   void updateUiAfterDishRemoved(int index, String type){
     // setState(() {
     //   if(type == MAIN_DISH_LABEL){
     //     List<Food> foods= [];
     //     List<String> types= [];
     //
     //
     //     for(int i = 0; i < _mainDishTypes.length; i++){
     //       if( index != i){
     //         foods.add(_mainDishFoods[i]);
     //         types.add(_mainDishTypes[i]);
     //       }
     //     }
     //     _mainDishTypes= types;
     //     _mainDishFoods= foods;
     //   }else{
     //     List<Food> foods= [];
     //     List<String> types= [];
     //
     //
     //     for(int i = 0; i < _sideDishTypes.length; i++){
     //       if( index != i){
     //         foods.add(_sideDishFoods[i]);
     //         types.add(_sideDishTypes[i]);
     //       }
     //     }
     //     _sideDishTypes= types;
     //     _sideDishFoods= foods;
     //   }
     // });
   }

   void updateUiAfterFoodRemoved(int index, String type){
     // setState(() {
     //   if(type == MAIN_DISH_LABEL){
     //     List<Food> foods= [];
     //     List<String> types= [];
     //
     //
     //     for(int i = 0; i < _mainDishTypes.length; i++){
     //       if( index != i){
     //         foods.add(_mainDishFoods[i]);
     //         types.add(_mainDishTypes[i]);
     //       }else{
     //         foods.add(Food(name: ''));
     //         types.add(_mainDishTypes[i]);
     //       }
     //     }
     //     _mainDishTypes= types;
     //     _mainDishFoods= foods;
     //   }else{
     //     List<Food> foods= [];
     //     List<String> types= [];
     //
     //
     //     for(int i = 0; i < _sideDishTypes.length; i++){
     //       if( index != i){
     //         foods.add(_sideDishFoods[i]);
     //         types.add(_sideDishTypes[i]);
     //       }else{
     //         foods.add(Food(name: ''));
     //         types.add(_sideDishTypes[i]);
     //       }
     //     }
     //     _sideDishTypes= types;
     //     _sideDishFoods= foods;
     //   }
     // });
   }


  void _autoGenerateFoodsForDay(){
    logEvent(AUTO_GENERATE_DAY_BTN_CLICKED, null);
    _trackAutoGenerateDaily();
    _autoGenerateFoodsBloc.add(
        AutoGenerateFoodsEvent.onAutoGenerateFoodsForDay(widget.mainDishTypes, widget.sideDishTypes)
    );
  }

  void _trackAutoGenerateDaily() async{
    try{
      final supabase = Supabase.instance.client;

      String uuId= await getDeviceUUID() ?? '';

      final userResponse = await supabase
          .from(GUEST_USAGE_TABLE)
          .select<List<dynamic>>()
          .eq('device_id', uuId);

      final userHiveDataSource = serviceLocator<UserHiveDataSource>();
      String email = await userHiveDataSource.getString(KEY_EMAIL) ?? '';

      if(userResponse.isEmpty){

        final Map<String, dynamic> data = <String, dynamic>{};
        data['device_id'] = uuId;
        data['email'] = email;
        data['auto_generate_daily'] = 1;
        data['wizard'] = 0;


        await supabase.from(GUEST_USAGE_TABLE).insert(data);

      }else{
        final Map<String, dynamic> data = <String, dynamic>{};
        final previousCount= int.parse(userResponse[0]['auto_generate_daily'].toString());
        data['auto_generate_daily'] = previousCount + 1;
        data['email'] = email;


        await supabase.from(GUEST_USAGE_TABLE).update(data).eq('device_id', uuId);

      }


    }on PostgrestException catch (error) {
    } catch (error) {
    }
  }



  Widget _nextButton(){
    return Visibility(
      visible: widget.isView,
      child: Container(
        padding: const EdgeInsets.only(bottom: 24),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(BORDER_RADIUS),
              ),
              backgroundColor: DARK_PRIMARY_COLOR
          ),
          onPressed: () {

          },

          child: const Text(NEXT_LABEL, style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }


   Widget _confirmButton(){
     return Visibility(
       visible: !widget.isView,
       child: Container(
         padding: const EdgeInsets.only(bottom: 24),
         margin: const EdgeInsets.symmetric(horizontal: 8),
         width: double.infinity,
         child: ElevatedButton(
           style: ElevatedButton.styleFrom(
               shape:  RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(BORDER_RADIUS),
               ),
               backgroundColor: DARK_PRIMARY_COLOR
           ),
           onPressed: () {
             Navigator.pushReplacement(
               context,
               MaterialPageRoute(
                 builder: (context) =>  ViewAutoGenerateMealsScreen(shouldGenerateFoods: false, isView: true, mainDishTypes: _mainDishTypes,
                     sideDishTypes: _sideDishTypes, macroGoals: widget.macroGoals, mainDishFoods: _mainDishFoods, sideDishFoods: _sideDishFoods,),
               ),
             );
           },

           child: const Text(CONFIRM_LABEL, style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),),
         ),
       ),
     );
   }



}
