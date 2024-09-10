import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/foods/domain/model/suggested_foods_portion_model.dart';
import 'package:masterpie/feature/foods/domain/model/wizard_response_model.dart';
import 'package:masterpie/feature/foods/presentation/bloc/meal_plan_bloc/meal_plan_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/meal_plan_bloc/state_event/meal_plan_state_event.dart';
import 'package:masterpie/feature/foods/presentation/screen/meal_plan_list_ui.dart';
import 'package:masterpie/feature/foods/presentation/screen/suggested_different_foods_combination_screen.dart';

import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/core/helper/print.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../domain/model/meal_plan_model.dart';




class MealPlansScreen extends StatefulWidget {

  final List<int> macroGoal;

  const MealPlansScreen({super.key, required this.macroGoal});

  @override
  State<MealPlansScreen> createState() => _MealPlansScreenState();
}

class _MealPlansScreenState extends State<MealPlansScreen> {


  late MealPlanBloc _mealPlanBloc;


  List<MealPlan> _mealPlans= [];


  @override
  void initState() {
    super.initState();

    _mealPlanBloc = context.read<MealPlanBloc>();

    _mealPlanBloc.add(const MealPlanEvent.onGetMealPlans());

  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(MEAL_PLANS_LABEL, style: TextStyle(color: Colors.white)),
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
                children: [

                  MealPlanListUi(mealPlans: _mealPlans, onPlanClicked: _onMealPlanClicked)

                ],
              ),
            ),


            BlocConsumer<MealPlanBloc, MealPlanState>(
                builder: (mcontext, state) {
                  if (state is MealPlanLoadingState) {
                    return const GFLoader(
                      type: GFLoaderType.circle,
                      loaderColorOne: DARK_PRIMARY_COLOR,
                      loaderColorTwo: DARK_PRIMARY_COLOR,
                      loaderColorThree: DARK_PRIMARY_COLOR,
                    );
                  }else if(state is MealPlansLoadedState){
                    _mealPlanBloc.add(const MealPlanEvent.onReset());
                    Future.delayed(Duration.zero,(){
                      setState(() {
                        _mealPlans= state.mealPlans;
                      });
                    });
                  }else if(state is MealPlanErrorState){
                    FocusScope.of(context).unfocus();
                    _mealPlanBloc.add(const MealPlanEvent.onReset());
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
    );
  }


  void _onMealPlanClicked(MealPlan mealPlan){

    SuggestedFoodsPortion suggestedFoodsPortion= SuggestedFoodsPortion(
      foods: mealPlan.foods.map((food) => food.copyWith(isAddedByUser: true)).toList(),
      totalMacro: mealPlan.totalMacro,
    );

    final wizardModel= WizardResponseModel(
      foodsPortions: [suggestedFoodsPortion],
      macroGoal: widget.macroGoal
    );


    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SuggestedDifferentFoodsCombinationScreen(wizardResponse: wizardModel, isSavedMealPlan: true, planName: mealPlan.name,),
      ),
    );
  }

}
