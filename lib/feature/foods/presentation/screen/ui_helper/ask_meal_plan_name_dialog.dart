import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/foods/domain/model/meal_plan_model.dart';
import 'package:masterpie/util/design/toast/app_toast.dart';
import '../../../../../util/core/constant/messages_constants.dart';
import '../../../../../util/core/helper/print.dart';
import '../../../../../util/design/color/app_colors.dart';
import '../../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../../util/design/size/app_widget_size.dart';
import '../../../../../util/design/text/app_assets.dart';
import '../../../domain/model/food_model.dart';
import '../../bloc/meal_plan_bloc/meal_plan_bloc.dart';
import '../../bloc/meal_plan_bloc/state_event/meal_plan_state_event.dart';







class AskMealPlanNameDialog extends StatefulWidget {


  final MealPlan mealPlan;


  const AskMealPlanNameDialog({super.key, required this.mealPlan});

  @override
  State<AskMealPlanNameDialog> createState() => _AskMealPlanNameDialogState();
}


class _AskMealPlanNameDialogState extends State<AskMealPlanNameDialog> {

  late MealPlanBloc _mealPlanBloc;


  late TextEditingController _nameController;


  @override
  void initState() {
    super.initState();

    _mealPlanBloc = context.read<MealPlanBloc>();
    _nameController= TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: DefaultTextStyle(
          style: const TextStyle(
            fontFamily: MONTSERRAT_FONT,
          ),
          child: contentBox(context)
      ),
    );
  }

  Widget contentBox(BuildContext context) {


    return  Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: CATEGORY_COLOR,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: const Text(
                MEAL_PLAN_NAME_LABEL,
                style: TextStyle(
                  fontSize: 14.0,
                  color: DARK_PRIMARY_COLOR,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 8,),


                    const Text(SET_PLAN_NAME, style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),


                    const SizedBox(height: 16,),

                    SizedBox(
                      height: 50,
                      child: TextField(
                        controller: _nameController,
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: const InputDecoration(
                          hintText: 'Monday',
                          hintStyle: TextStyle(fontSize: 12),
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


                    const SizedBox(height: 8,),


                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {

                            FocusScope.of(context).unfocus();

                            if(_nameController.text.isEmpty){
                              showErrorToast(context, SET_PLAN_NAME);
                              return;
                            }


                            final mealPan= MealPlan(
                                foods: widget.mealPlan.foods,
                                name: _nameController.text,
                                totalMacro: widget.mealPlan.totalMacro
                            );
                            _mealPlanBloc.add(
                                MealPlanEvent.onSaveMealPlan(mealPan)
                            );

                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                              ),
                              backgroundColor: MASTERPIE_YELLOW_COLOR,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3)
                          ),
                          child: const Text(SAVE_LABEL,
                            style: TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 14, fontWeight: FontWeight.bold),
                          )
                      ),
                    ),

                    const SizedBox(height: 8,),


                    BlocConsumer<MealPlanBloc, MealPlanState>(
                        builder: (mcontext, state) {
                          if (state is MealPlanLoadingState) {
                            return const GFLoader(
                              type: GFLoaderType.circle,
                              loaderColorOne: DARK_PRIMARY_COLOR,
                              loaderColorTwo: DARK_PRIMARY_COLOR,
                              loaderColorThree: DARK_PRIMARY_COLOR,
                            );
                          }else if(state is MealPlanSavedState){
                            _mealPlanBloc.add(const MealPlanEvent.onReset());
                            Future.delayed(Duration.zero,(){
                              showSuccessToast(context, PLAN_SAVED_MSG);
                              Navigator.pop(context);
                            });
                          }else if(state is MealPlanErrorState){
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
            )
          ],
        ),
      ),
    );
  }


}