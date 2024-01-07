import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../bloc/update_profile_bloc/state_evnt/update_profile_state_event.dart';
import '../bloc/update_profile_bloc/update_profile_bloc.dart';







class CalculatedMacroGoalsPopup extends StatefulWidget {

  final Function(bool macroGoalsSaved, List<String> macros) onMacroGoalSaved;


  final String calorie;
  final String protein;
  final String carb;
  final String fat;
  final String gender;
  final String weight;
  final String weightUnit;
  final String height;
  final String heightUnit;
  final String age;
  final String activityLevel;
  final String goalWeight;
  final String weightChangeWeekly;

  final bool isEditable;


  const CalculatedMacroGoalsPopup({super.key, required this.calorie, required this.protein, required this.carb, required this.fat,
          required this.gender, required this.weight, required this.weightUnit, required this.height, required this.heightUnit, required this.age,
    required this.activityLevel, required this.goalWeight, required this.weightChangeWeekly, required this.onMacroGoalSaved, required this.isEditable});

  @override
  State<CalculatedMacroGoalsPopup> createState() => _CalculatedMacroGoalsPopupState();
}


class _CalculatedMacroGoalsPopupState extends State<CalculatedMacroGoalsPopup> {


  late UpdateProfileBloc _updateProfileBloc;


  TextEditingController _calorieController = TextEditingController();
  TextEditingController _proteinController = TextEditingController();
  TextEditingController _carbController = TextEditingController();
  TextEditingController _fatController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _calorieController = TextEditingController(text: widget.calorie);
    _proteinController = TextEditingController(text: widget.protein);
    _carbController = TextEditingController(text: widget.carb);
    _fatController = TextEditingController(text: widget.fat);

    _updateProfileBloc = context.read<UpdateProfileBloc>();
  }

  void updateProfile(){
    _updateProfileBloc.add(
        UpdateProfileEvent.onUpdateMacroGoalsAndInputs(
          widget.gender,
          widget.weight,
          widget.height,
          widget.weightUnit,
          widget.heightUnit,
          widget.goalWeight,
          widget.age,
          widget.activityLevel,
          widget.weightChangeWeekly,
          _calorieController.text,
          _proteinController.text,
          _carbController.text,
          _fatController.text
        )
    );
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
                  MACRO_GOAL_LABEL,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: DARK_PRIMARY_COLOR,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),



              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [

                    /// calorie and protein
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: SizedBox(
                              height: 48,
                              child: TextFormField(
                                cursorColor: DARK_PRIMARY_COLOR,
                                controller: _calorieController,
                                enabled: widget.isEditable,
                                style: const TextStyle(fontSize: 15, color: DARK_PRIMARY_COLOR),
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                decoration: const InputDecoration(
                                  labelText: CALORIE_LABEL,
                                  border:  OutlineInputBorder(borderSide: BorderSide(color: DARK_PRIMARY_COLOR),),
                                  fillColor: Colors.white,
                                ),
                              ),
                            )
                        ),

                        const SizedBox(width: 16.0),

                        Expanded(
                            child: SizedBox(
                              height: 48,
                              child: TextFormField(
                                cursorColor: DARK_PRIMARY_COLOR,
                                controller: _proteinController,
                                enabled: widget.isEditable,
                                style: const TextStyle(fontSize: 15, color: DARK_PRIMARY_COLOR),
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                decoration: const InputDecoration(
                                  labelText: PROTEIN_LABEL,
                                  border:  OutlineInputBorder(borderSide: BorderSide(color: DARK_PRIMARY_COLOR),),
                                  fillColor: Colors.white,
                                ),
                              ),
                            )
                        ),
                      ],
                    ),


                    const SizedBox(height: 16.0),


                    /// carb and fat
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: SizedBox(

                              height: 48,
                              child: TextFormField(
                                cursorColor: DARK_PRIMARY_COLOR,
                                enabled: widget.isEditable,
                                style: const TextStyle(fontSize: 15, color: DARK_PRIMARY_COLOR),
                                controller: _carbController,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                decoration: const InputDecoration(
                                  labelText: CARB_LABEL,
                                  border:  OutlineInputBorder(borderSide: BorderSide(color: DARK_PRIMARY_COLOR),),
                                  fillColor: Colors.white,
                                ),
                              ),
                            )
                        ),

                        const SizedBox(width: 16.0),


                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: TextFormField(
                              cursorColor: DARK_PRIMARY_COLOR,
                              controller: _fatController,
                              enabled: widget.isEditable,
                              style: const TextStyle(fontSize: 15, color: DARK_PRIMARY_COLOR),
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration: const InputDecoration(
                                labelText: FAT_LABEL,
                                border:  OutlineInputBorder(borderSide: BorderSide(color: DARK_PRIMARY_COLOR),),
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),


                    const SizedBox(height: 16.0),


                    /// save button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){
                          updateProfile();
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: DARK_PRIMARY_COLOR
                        ),
                        child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(SAVE_MACRO_AND_INPUTS_LABEL, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                        ),
                      ),
                    ),



                    const SizedBox(height: 8,),



                    BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
                        builder: (mcontext, state) {
                          if (state is UpdateProfileLoadingState) {
                            return const GFLoader(
                              type: GFLoaderType.circle,
                              loaderColorOne: DARK_PRIMARY_COLOR,
                              loaderColorTwo: DARK_PRIMARY_COLOR,
                              loaderColorThree: DARK_PRIMARY_COLOR,
                            );
                          }else if(state is MacroGoalsAndInputsUpdatedState){
                            Future.delayed(Duration.zero,(){
                              showSuccessToast(context, MACRO_SAVED_SUCCESS_MSG);
                              widget.onMacroGoalSaved(true, [_calorieController.text, _proteinController.text, _carbController.text, _fatController.text]);
                              _updateProfileBloc.add(const UpdateProfileEvent.onReset());
                              Navigator.pop(context);
                            });
                          }else if(state is UpdateProfileErrorState){
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
                  ],
                ),
              )
            ],
          ),
        );
  }


}
