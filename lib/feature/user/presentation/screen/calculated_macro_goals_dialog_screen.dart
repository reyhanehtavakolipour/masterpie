import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../../foods/presentation/screen/ui_helper/logged_food_chip_widget.dart';
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
  String _selectedMacro = CALORIE_LABEL;
  final TextEditingController _macroController = TextEditingController();
  final Map<String, String> _addedMacros = {};

  @override
  void initState() {
    super.initState();
    _updateProfileBloc = context.read<UpdateProfileBloc>();
  }

  void updateProfile(){
      int calorie = int.parse(_addedMacros[CALORIE_LABEL] ?? '2197');
      int protein = int.parse(_addedMacros[PROTEIN_LABEL] ?? '220');
      int carb = int.parse(_addedMacros[CARB_LABEL] ?? '165');
      int fat = int.parse(_addedMacros[FAT_LABEL] ?? '73');

      if(!_addedMacros.containsKey(CALORIE_LABEL)){
        calorie= protein * 4 + carb * 4 + fat * 9;
      }

      if(!_addedMacros.containsKey(PROTEIN_LABEL)){
        protein= (calorie - carb*4 - fat*9)~/4;
      }


      if(!_addedMacros.containsKey(CARB_LABEL)){
        carb= (calorie - protein*4 - fat*9)~/4;
      }


      if(!_addedMacros.containsKey(FAT_LABEL)){
        fat= (calorie - carb*4 - protein*4)~/9;
      }



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
              calorie.toString(),
              protein.toString(),
              carb.toString(),
              fat.toString()
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
            // fontFamily: MONTSERRAT_FONT,
          ),
          child: contentBox(context)
      ),
    );
  }

  Widget contentBox(BuildContext context) {

    int calorie = int.parse(_addedMacros[CALORIE_LABEL] ?? '0');
    int protein = int.parse(_addedMacros[PROTEIN_LABEL] ?? '0');
    int carb = int.parse(_addedMacros[CARB_LABEL] ?? '0');
    int fat = int.parse(_addedMacros[FAT_LABEL] ?? '0');

    if(!_addedMacros.containsKey(CALORIE_LABEL)){
      calorie= protein * 4 + carb * 4 + fat * 9;
    }

    if(!_addedMacros.containsKey(PROTEIN_LABEL)){
      protein= (calorie - carb*4 - fat*9)~/4;
    }


    if(!_addedMacros.containsKey(CARB_LABEL)){
      carb= (calorie - protein*4 - fat*9)~/4;
    }


    if(!_addedMacros.containsKey(FAT_LABEL)){
      fat= (calorie - carb*4 - protein*4)~/9;
    }


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
                color: MASTERPIE_YELLOW_COLOR,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: const Text(
                RESET_MACRO_LABEL,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(ENTER_MACRO_MANUAL_MESSAGE, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey, fontSize: 13),),

                  const SizedBox(height: 4,),

                  const Text(MACRO_FORMUAL, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey, fontSize: 12),),


                  const SizedBox(height: 24,),


                  buildMacroEntryWidgets(),

                  const SizedBox(height: 8,),


                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Wrap(
                        spacing: 8.0,
                        children: List.generate(
                          _addedMacros.length,
                              (index) => ChipWidget(
                            text: '${_addedMacros.keys.toList()[index]} ${_addedMacros.values.toList()[index]}',
                            onRemove: () {
                              setState(() {
                                _addedMacros.remove(_addedMacros.keys.toList()[index]);
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 2.0),


                  /// save button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(

                      onPressed: (){
                        if(_addedMacros.length == 3){
                          updateProfile();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: _addedMacros.length == 3 ? DARK_PRIMARY_COLOR : Colors.grey
                      ),
                      child: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(RESET_LABEL, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                      ),
                    ),
                  ),


                  const SizedBox(height: 8.0),

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
                            widget.onMacroGoalSaved(true, [calorie.toString(), protein.toString(), carb.toString(), fat.toString()]);
                            _updateProfileBloc.add(const UpdateProfileEvent.onReset());
                            Navigator.pop(context);
                          });
                        }else if(state is UpdateProfileErrorState){
                          _updateProfileBloc.add(const UpdateProfileEvent.onReset());
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
      ),
    );
  }


  Widget buildMacroEntryWidgets() {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(BORDER_RADIUS),
            border: Border.all(
              color: DARK_PRIMARY_COLOR,
              width: 0.5,
            ),
          ),
          child: SizedBox(
            width: 80,
            height: 45,
            child: DropdownButtonFormField<String?>(
              value: _selectedMacro,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
              focusColor: PRIMARY_COLOR,
              items: [CALORIE_LABEL, PROTEIN_LABEL, CARB_LABEL, FAT_LABEL].map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  enabled: !_addedMacros.containsKey(item) && _addedMacros.length != 3,
                  child: Text(item, style: TextStyle(color: !_addedMacros.containsKey(item) && _addedMacros.length != 3 ? DARK_PRIMARY_COLOR : Colors.grey, fontSize: 14),),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedMacro = newValue.toString();
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 16,),

        Row(
          children: [
            Expanded(
                child: Container(
                  width: 100,
                  // height: 46,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(BORDER_RADIUS),
                    border: Border.all(color: DARK_PRIMARY_COLOR, width: 0.5),
                  ),
                  child: TextField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    // textAlign: TextAlign.center,
                    controller: _macroController,
                    textAlignVertical: TextAlignVertical.center,

                    decoration: const InputDecoration(
                      hintText: ENTER_VALUE_LABEL,
                      hintStyle: TextStyle(fontSize: 14,),
                      border: InputBorder.none,
                    ),
                  ),
                )
            ),

            const SizedBox(width: 4,),

            Container(
              width: 40,
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(
                    color: DARK_PRIMARY_COLOR,
                    width: 0.5
                ),
                borderRadius: BorderRadius.circular(BORDER_RADIUS), // rounded corners
              ),
              child: Center(
                child: Text(
                  _selectedMacro == CALORIE_LABEL ? 'cal' : 'g',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal, fontSize: 14),
                ),
              ),
            ),

            const SizedBox(width: 4,),

            Expanded(
              child:  SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: (){
                    if(_macroController.text.isNotEmpty){
                      setState(() {
                        if(_selectedMacro == CALORIE_LABEL){

                          int protein= int.parse(_addedMacros[PROTEIN_LABEL] ?? '0');
                          int carb= int.parse(_addedMacros[CARB_LABEL] ?? '0');
                          int fat= int.parse(_addedMacros[FAT_LABEL] ?? '0');

                          int calorie= int.parse(_macroController.text);

                          int totalCal= protein*4 + carb*4 + fat*9;
                          if(calorie < totalCal){
                            showErrorToast(context, '$ERROR_LOW_CALORIE $totalCal');
                          }else{
                            _addedMacros[CALORIE_LABEL]= _macroController.text;
                          }
                        }else if(_selectedMacro == PROTEIN_LABEL){

                          if(_addedMacros.containsKey(CALORIE_LABEL)){
                            int calories= int.parse(_addedMacros[CALORIE_LABEL] ?? '0');
                            int carb= int.parse(_addedMacros[CARB_LABEL] ?? '0');
                            int fat= int.parse(_addedMacros[FAT_LABEL] ?? '0');
                            int protein= int.parse(_macroController.text);

                            if(calories >= carb*4 + protein*4 + fat*9){
                              _addedMacros[PROTEIN_LABEL]= _macroController.text;
                            }else{
                              int maxValue= (calories - carb*4 - fat*9)~/4;
                              showErrorToast(context, '$ERROR_MAX_AMOUNT $maxValue');
                            }

                          }else{
                            _addedMacros[PROTEIN_LABEL]= _macroController.text;
                          }
                        }else if(_selectedMacro == CARB_LABEL){
                          if(_addedMacros.containsKey(CALORIE_LABEL)){
                            int calories= int.parse(_addedMacros[CALORIE_LABEL] ?? '0');
                            int protein= int.parse(_addedMacros[PROTEIN_LABEL] ?? '0');
                            int fat= int.parse(_addedMacros[FAT_LABEL] ?? '0');
                            int carb= int.parse(_macroController.text);

                            if(calories >= carb*4 + protein*4 + fat*9){
                              _addedMacros[CARB_LABEL]= _macroController.text;
                            }else{
                              int maxValue= (calories - protein*4 - fat*9)~/4;
                              showErrorToast(context, '$ERROR_MAX_AMOUNT $maxValue');
                            }
                          }else{
                            _addedMacros[CARB_LABEL]= _macroController.text;
                          }
                        }else if(_selectedMacro == FAT_LABEL){
                          if(_addedMacros.containsKey(CALORIE_LABEL)){
                            int calories= int.parse(_addedMacros[CALORIE_LABEL] ?? '0');
                            int protein= int.parse(_addedMacros[PROTEIN_LABEL] ?? '0');
                            int carb= int.parse(_addedMacros[CARB_LABEL] ?? '0');
                            int fat= int.parse(_macroController.text);

                            if(calories >= carb*4 + protein*4 + fat*9){
                              _addedMacros[FAT_LABEL]= _macroController.text;
                            }else{
                              int maxValue= (calories - carb*4 - protein*4)~/9;
                              showErrorToast(context, '$ERROR_MAX_AMOUNT $maxValue');
                            }
                          }else{
                            _addedMacros[FAT_LABEL]= _macroController.text;
                          }
                        }
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: MASTERPIE_YELLOW_COLOR
                  ),
                  child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(ADD_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),)
                  ),
                ),
              ),
            )

          ],
        )
      ],
    );
  }


}
