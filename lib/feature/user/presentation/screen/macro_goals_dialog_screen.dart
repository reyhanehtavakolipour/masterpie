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
import 'calculate_user_macro_goal_screen.dart';







class MacroGoalsPopup extends StatefulWidget {

  final Function(List<String>) onMacroGoalUpdated;


  final String calorie;
  final String protein;
  final String carb;
  final String fat;



  const MacroGoalsPopup({super.key, required this.calorie, required this.protein, required this.carb, required this.fat, required this.onMacroGoalUpdated});

  @override
  State<MacroGoalsPopup> createState() => _MacroGoalsPopupState();
}


class _MacroGoalsPopupState extends State<MacroGoalsPopup> {


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
        UpdateProfileEvent.onUpdateDailyMacroGoal(
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
                            child: Text(SAVE_LABEL, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                        ),
                      ),
                    ),


                    const SizedBox(height: 16.0),



                    const Text(
                      OR_LABEL,
                      style: TextStyle(
                          fontSize: 13.0,
                          color: DARK_PRIMARY_COLOR,
                          fontWeight: FontWeight.bold
                      ),
                    ),


                    const SizedBox(height: 16.0),


                    /// let us calculate button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CalculateUserMacroGoalScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: MASTERPIE_YELLOW_COLOR
                        ),
                        child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(LET_US_CALCULATE_IT_MESSAGE, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),)
                        ),
                      ),
                    ),





                    const SizedBox(height: 24,),



                    BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
                        builder: (mcontext, state) {
                          if (state is UpdateProfileLoadingState) {
                            return const GFLoader(
                              type: GFLoaderType.circle,
                              loaderColorOne: DARK_PRIMARY_COLOR,
                              loaderColorTwo: DARK_PRIMARY_COLOR,
                              loaderColorThree: DARK_PRIMARY_COLOR,
                            );
                          }else if(state is MacroGoalsUpdatedState){
                            Future.delayed(Duration.zero,(){
                              setState(() {
                                _updateProfileBloc.add(const UpdateProfileEvent.onReset());
                                sendMacrosToMainScreen();
                              });
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


  void sendMacrosToMainScreen() {

    String calorie = '0';
    String protein = '0';
    String carb = '0';
    String fat = '0';

    if(_calorieController.text.isNotEmpty){
      calorie = _calorieController.text;
    }

    if(_proteinController.text.isNotEmpty){
      protein = _proteinController.text;
    }

    if(_carbController.text.isNotEmpty){
      carb = _carbController.text;
    }

    if(_fatController.text.isNotEmpty){
      fat = _fatController.text;
    }

    widget.onMacroGoalUpdated([calorie, protein, carb, fat]);
    Navigator.pop(context);
  }

}
