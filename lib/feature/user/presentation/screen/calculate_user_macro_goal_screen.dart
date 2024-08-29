import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/user/presentation/screen/calculated_macro_goal_dialog.dart';
import 'package:masterpie/feature/user/presentation/screen/onboarding_screen.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import '../../../../main_screen.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../../foods/presentation/screen/ui_helper/custom_radio_button.dart';
import '../../domain/model/profile_model.dart';
import '../bloc/get_profile_bloc/get_profile_bloc.dart';
import '../bloc/get_profile_bloc/state_event/get_profile_state_event.dart';
import '../bloc/update_profile_bloc/state_evnt/update_profile_state_event.dart';
import '../bloc/update_profile_bloc/update_profile_bloc.dart';
import 'calculated_macro_goals_dialog_screen.dart';



class CalculateUserMacroGoalScreen extends StatefulWidget {


  const CalculateUserMacroGoalScreen({super.key});

  @override
  State<CalculateUserMacroGoalScreen> createState() => _CalculateUserMacroGoalScreenState();
}

class _CalculateUserMacroGoalScreenState extends State<CalculateUserMacroGoalScreen> {

  static const BORDER_RADIUS = 5.0;

  final _calorieController = TextEditingController();
  final _proteinController = TextEditingController(text: '30');
  final _carbController = TextEditingController(text: '40');
  final _fatController = TextEditingController(text: '30');



  final _weightController = TextEditingController();

  final _ageController = TextEditingController();

  final _heightController = TextEditingController();

  final _goalWeightController = TextEditingController();


  String _heightSelectedUnit = FT_LABEL;
  String _weightSelectedUnit = LB_LABEL;
  String _activitySelected = SEDENTARY_LABEL;
  String _genderSelected = FEMALE_LABEL;
  String _weightChangeWeekly = LB_1_LABEL;


  List<String> _dailyMacroGoal = ['2197', '220', '165', '73'];

  late GetProfileBloc _getProfileBloc;
  late UpdateProfileBloc _updateProfileBloc;

  String _diet= dietOptions[0];


  @override
  void initState() {
    super.initState();
    _getProfileBloc = context.read<GetProfileBloc>();
    _updateProfileBloc = context.read<UpdateProfileBloc>();
    getProfile();
  }



  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
        child: MaterialApp(
          theme: ThemeData(fontFamily: MONTSERRAT_FONT),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text(MACRO_GOAL_LABEL, style: TextStyle(color: Colors.white,),),
                backgroundColor: PRIMARY_COLOR,
                leading: InkWell(
                  onTap: () {
                    List<String> goals= [];
                    _dailyMacroGoal.forEach((element) {
                      goals.add(element);
                    });

                    //diet
                    String diet= CLASSIC_LABEL;
                    if(_diet.contains(KETO_LABEL)){
                      diet= KETO_LABEL;
                    } else if(_diet.contains(VEGETERIAN_LABEL)){
                      diet= VEGETERIAN_LABEL;
                    }

                    print('fdhfds: ${goals}');

                    goals.add(diet);
                    Navigator.pop(context, goals);
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [


                        /// current macro goal
                        Container(
                          width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              color: CATEGORY_COLOR,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                            ),
                          child: const Text(
                            YOUR_MACRO_GOAL_LABEL,
                            style: TextStyle(fontSize: 16, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                          ),
                        ),


                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                            decoration: const BoxDecoration(
                              color: CATEGORY_COLOR,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                            ),
                            child: Text(
                              '${_dailyMacroGoal[0]} $CALORIE_LABEL, ${_dailyMacroGoal[1]} grams $PROTEIN_LABEL, ${_dailyMacroGoal[2]} grams $CARB_LABEL, ${_dailyMacroGoal[3]} grams $FAT_LABEL',
                              style: const TextStyle(fontSize: 13, color: MASTERPIE_ORANGE_COLOR, fontWeight: FontWeight.bold),
                            ),
                        ),





                        const SizedBox(height: 24.0),


                        /// Gender Dropdown
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: buildGenderDropdown()
                        ),


                        const SizedBox(height: 24.0),



                        /// Weight and Unit Row
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: buildNumberTextField(hintText: WEIGHT_LABEL, controller: _weightController),
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                  child: buildWeightUnitDropdown()
                              ),
                            ],
                          ),
                        ),



                        const SizedBox(height: 24.0),



                        /// age and goal weight Row
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: buildNumberTextField(hintText: AGE_LABEL, controller: _ageController),
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                  child: buildNumberTextField(hintText: GOAL_WEIGHT_LABEL, controller: _goalWeightController)
                              ),
                            ],
                          ),
                        ),



                        const SizedBox(height: 24.0),



                        /// Height and Unit Row
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: buildNumberTextField(hintText: HEIGHT_LABEL, controller: _heightController),
                              ),
                              const SizedBox(width: 32.0),
                              Expanded(
                                  child: buildHeightUnitDropdown()
                              ),
                            ],
                          ),
                        ),




                        const SizedBox(height: 24.0),



                        /// activity level
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(ACTIVITY_LEVEL_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),)
                        ),
                        const SizedBox(height: 4.0),
                        buildActivityLevelDropdown(),


                        const SizedBox(height: 24.0),



                        /// weekly weight change
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(WEEKLY_WEIGHT_CHANGE_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),)
                        ),
                        const SizedBox(height: 4.0),
                        buildLoseWeightAmountPerDayDropdown(),

                        const SizedBox(height: 24.0),


                        /// diet
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(DIET_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),)
                        ),

                        _buildDiets(),

                        const SizedBox(height: 32.0),


                        Row(
                          children: [
                            Expanded(
                                child:  /// calculate button
                                buildCalculateButton(),
                            ),

                            const SizedBox(width: 4.0),

                            Expanded(
                                child:  /// set macros manually button
                                buildSetMacrosManuallyButton(),
                            ),
                          ],
                        ),


                        const SizedBox(height: 64.0),


                      ],
                    ),
                  ),

                  BlocConsumer<GetProfileBloc, GetProfileState>(
                      builder: (mcontext, state) {
                        if (state is GetProfileLoadingState) {
                          return const GFLoader(
                            type: GFLoaderType.circle,
                            loaderColorOne: DARK_PRIMARY_COLOR,
                            loaderColorTwo: DARK_PRIMARY_COLOR,
                            loaderColorThree: DARK_PRIMARY_COLOR,
                          );
                        }else if(state is GetProfileLoadedState){
                          Future.delayed(Duration.zero,(){
                            fulfillWidgets(state.profile);
                          });
                        }else if(state is GetProfileErrorState){
                          _getProfileBloc.add(const GetProfileEvent.onReset());
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

                  BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
                      builder: (mcontext, state) {
                        if (state is UpdateProfileLoadingState) {
                          return const GFLoader(
                            type: GFLoaderType.circle,
                            loaderColorOne: DARK_PRIMARY_COLOR,
                            loaderColorTwo: DARK_PRIMARY_COLOR,
                            loaderColorThree: DARK_PRIMARY_COLOR,
                          );
                        }else if(state is MacroGoalsCalculatedState){
                          Future.delayed(Duration.zero,(){
                            setState(() {
                              _updateProfileBloc.add(const UpdateProfileEvent.onReset());
                              showMacroGoalsPopup(context, state.dailyGoals, false);
                            });

                          });
                        }else if(state is MacroGoalsAndInputsUpdatedState){
                          _updateProfileBloc.add(const UpdateProfileEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            showSuccessToast(context, MACRO_SAVED_SUCCESS_MSG);
                            if(_calorieController.text.isNotEmpty){
                              int calorie = int.parse(_calorieController.text).toInt();
                              int protein = (calorie * int.parse(_proteinController.text)/100)~/4;
                              int carb = (calorie * int.parse(_carbController.text)/100)~/4;
                              int fat = (calorie * int.parse(_fatController.text)/100)~/9;
                              onUpdatedGoalMacros(true, [calorie.toString(), protein.toString(), carb.toString(), fat.toString()]);
                            }
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
              )
          ),
        )
    );
  }


  void _updateDietUi(String diet){
    setState(() {
      _diet= diet;
    });
  }

  Widget _buildDiets(){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomRadioListTile(
        options: dietOptions,
        onSelectedOptionChanged: _updateDietUi,
        selectedOption: _diet,
        orientation: VERTICAL_ORIENTATION,
        isEditable: true,
      ),
    );
  }


  void getProfile(){
    _getProfileBloc.add(const GetProfileEvent.onGetProfile());
  }

  void calculateDailyMacro(){

    //diet
    String diet= CLASSIC_LABEL;
    if(_diet.contains(KETO_LABEL)){
      diet= KETO_LABEL;
    } else if(_diet.contains(VEGETERIAN_LABEL)){
      diet= VEGETERIAN_LABEL;
    }

    _updateProfileBloc.add(
        UpdateProfileEvent.onCalculateDailyMacroGoal(
            _genderSelected,
            _weightController.text,
            _heightController.text,
            _weightSelectedUnit,
            _heightSelectedUnit,
            _goalWeightController.text,
            _ageController.text,
            _activitySelected,
            diet,
            _weightChangeWeekly
        )
    );
  }

  void showMacroGoalsPopup(BuildContext context, List<String> dailyMacros, bool isEditable) {

    //diet
    String diet= CLASSIC_LABEL;
    if(_diet.contains(KETO_LABEL)){
      diet= KETO_LABEL;
    } else if(_diet.contains(VEGETERIAN_LABEL)){
      diet= VEGETERIAN_LABEL;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CalculatedMacroGoalDialog(calorie: dailyMacros[0], protein: dailyMacros[1], gender: _genderSelected, weight: _weightController.text, height: _heightController.text,
          weightUnit: _weightSelectedUnit, heightUnit: _heightSelectedUnit, activityLevel: _activitySelected, weightChangeWeekly: _weightChangeWeekly,
          age: _ageController.text, goalWeight: _goalWeightController.text,
          carb: dailyMacros[2], fat: dailyMacros[3], onMacroGoalSaved: onUpdatedGoalMacros, isEditable: isEditable, diet: diet,);
      },
    );
  }


  // void showManualMacroPopup(BuildContext context, List<String> dailyMacros, bool isEditable) {
  //
  //   //diet
  //   String diet= CLASSIC_LABEL;
  //   if(_diet.contains(KETO_LABEL)){
  //     diet= KETO_LABEL;
  //   } else if(_diet.contains(VEGETERIAN_LABEL)){
  //     diet= VEGETERIAN_LABEL;
  //   }
  //
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return CalculatedMacroGoalsPopup(calorie: dailyMacros[0], protein: dailyMacros[1], gender: _genderSelected, weight: _weightController.text, height: _heightController.text,
  //           weightUnit: _weightSelectedUnit, heightUnit: _heightSelectedUnit, activityLevel: _activitySelected, weightChangeWeekly: _weightChangeWeekly,
  //           age: _ageController.text, goalWeight: _goalWeightController.text,
  //           carb: dailyMacros[2], fat: dailyMacros[3], onMacroGoalSaved: onUpdatedGoalMacros, isEditable: isEditable, diet: diet,);
  //     },
  //   );
  // }


  void saveManualMacros(){

    if(_calorieController.text.isEmpty || _proteinController.text.isEmpty || _carbController.text.isEmpty || _fatController.text.isEmpty){
      showErrorToast(context, FILL_ALL_ERROR);
      return;
    }


    if(int.parse(_proteinController.text) + int.parse(_carbController.text) + int.parse(_fatController.text) != 100){
      showErrorToast(context, ERROR_MACRO_PERCENTAGE);
      return;
    }

    //diet
    String diet= CLASSIC_LABEL;
    if(_diet.contains(KETO_LABEL)){
      diet= KETO_LABEL;
    } else if(_diet.contains(VEGETERIAN_LABEL)){
      diet= VEGETERIAN_LABEL;
    }


    int calorie = int.parse(_calorieController.text);
    int protein = (calorie * int.parse(_proteinController.text)/100)~/4;
    int carb = (calorie * int.parse(_carbController.text)/100)~/4;
    int fat = (calorie * int.parse(_fatController.text)/100)~/9;


    Navigator.of(context).pop();


    _updateProfileBloc.add(
        UpdateProfileEvent.onUpdateMacroGoalsAndInputs(
            _genderSelected,
            _weightController.text,
            _heightController.text,
            _weightSelectedUnit,
            _heightSelectedUnit,
            _goalWeightController.text,
            _ageController.text,
            _activitySelected,
            _weightChangeWeekly,
            calorie.toString(),
            protein.toString(),
            carb.toString(),
            fat.toString(),
            diet
        )
    );
  }

  Future<void>  showManualMacroPopup() async{

    _calorieController.text= _dailyMacroGoal[0];


    showDialog(
      context: context,
      builder: (BuildContext mcontext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
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

                    /// calorie
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: TextFormField(
                        cursorColor: DARK_PRIMARY_COLOR,
                        controller: _calorieController,
                        style: const TextStyle(fontSize: 15, color: DARK_PRIMARY_COLOR),
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: const InputDecoration(
                          labelText: CALORIE_LABEL,
                          border:  OutlineInputBorder(borderSide: BorderSide(color: DARK_PRIMARY_COLOR),),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),


                    const SizedBox(height: 16.0),


                    /// protein
                    SizedBox(
                      height: 48,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              cursorColor: DARK_PRIMARY_COLOR,
                              controller: _proteinController,
                              style: const TextStyle(fontSize: 15, color: DARK_PRIMARY_COLOR),
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration: const InputDecoration(
                                labelText: PROTEIN_LABEL,
                                border:  OutlineInputBorder(borderSide: BorderSide(color: DARK_PRIMARY_COLOR),),
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                          const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 8),
                                  child: Text('%', style: TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 15), textAlign: TextAlign.start,)
                              )
                          )
                        ],
                      ),
                    ),



                    const SizedBox(height: 16.0),


                    /// carb
                    SizedBox(
                      height: 48,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              cursorColor: DARK_PRIMARY_COLOR,
                              controller: _carbController,
                              style: const TextStyle(fontSize: 15, color: DARK_PRIMARY_COLOR),
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration: const InputDecoration(
                                labelText: CARB_LABEL,
                                border:  OutlineInputBorder(borderSide: BorderSide(color: DARK_PRIMARY_COLOR),),
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                          const Expanded(
                              child: Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text('%', style: TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 15), textAlign: TextAlign.start,)
                              )
                          )
                        ],
                      ),
                    ),



                    const SizedBox(height: 16.0),


                    /// fat
                    SizedBox(
                      height: 48,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              cursorColor: DARK_PRIMARY_COLOR,
                              controller: _fatController,
                              style: const TextStyle(fontSize: 15, color: DARK_PRIMARY_COLOR),
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration: const InputDecoration(
                                labelText: FAT_LABEL,
                                border:  OutlineInputBorder(borderSide: BorderSide(color: DARK_PRIMARY_COLOR),),
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                          const Expanded(
                              child: Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text('%', style: TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 15), textAlign: TextAlign.start,)
                              )
                          )
                        ],
                      ),
                    ),



                    const SizedBox(height: 16.0),


                    /// done button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async{
                          // FocusScope.of(context).unfocus();
                          SystemChannels.textInput.invokeMethod('TextInput.hide');
                          saveManualMacros();
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


                    const SizedBox(height: 8,),

                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }




  void onUpdatedGoalMacros(bool saved, List<String> macros) {
    if(saved){
      setState(() {
        _dailyMacroGoal = macros;
      });
    }
  }

  Widget buildSetMacrosManuallyButton(){
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (){
          showManualMacroPopup();
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: DARK_PRIMARY_COLOR
        ),
        child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text(SET_MACRO_MANUALLY_LABEL, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
        ),
      ),
    );
  }


  void fulfillWidgets(Profile profile){
    setState(() {

      //diet
      if(profile.diet.contains(CLASSIC_LABEL)){
        _diet= dietOptions[0];
      }else if(profile.diet.contains(KETO_LABEL)){
        _diet= dietOptions[1];
      } else if(profile.diet.contains(VEGETERIAN_LABEL)){
        _diet= dietOptions[2];
      }

      _weightController.text = profile.weight;
      _heightController.text = profile.height;
      _goalWeightController.text = profile.goalWeight;
      _genderSelected = profile.gender.isEmpty ? FEMALE_LABEL : profile.gender;
      _weightSelectedUnit = profile.weightUnit.isEmpty ? LB_LABEL : profile.weightUnit;
      _heightSelectedUnit = profile.heightUnit.isEmpty ? FT_LABEL : profile.heightUnit;
      _ageController.text = profile.age;
      _activitySelected = profile.activityLevel.isEmpty ? SEDENTARY_LABEL : profile.activityLevel;
      _weightChangeWeekly= profile.weightChangeWeekly;
      _dailyMacroGoal = profile.dailyMacroGoal;
      _getProfileBloc.add(const GetProfileEvent.onReset());
    });
  }


  Widget buildCalculateButton(){
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: ElevatedButton(
        onPressed: (){
          if(_weightController.text.isEmpty || _goalWeightController.text.isEmpty ||
              _ageController.text.isEmpty || _heightController.text.isEmpty){
            showErrorToast(context, FILL_ALL_ERROR);
          }else{
            calculateDailyMacro();
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
            child: Text(CALCULATE_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),)
        ),
      ),
    );
  }


  Widget buildNumberTextField({
    required String hintText,
    String? initialValue,
    bool isEditable = true,
    required TextEditingController controller
  }) {
    return SizedBox(
      height: 48,
      child: TextFormField(
        cursorColor: DARK_PRIMARY_COLOR,
        controller: controller,
        enabled: isEditable,
        keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(numericRegExp),
        ],
        decoration: InputDecoration(
          labelText: hintText,
          border:  const OutlineInputBorder(borderSide: BorderSide(color: DARK_PRIMARY_COLOR),),
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget buildGenderDropdown() {

    return Container(
      width: 100,
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
          value: _genderSelected,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
          ),
          focusColor: PRIMARY_COLOR,
          items: [MALE_LABEL, FEMALE_LABEL].map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _genderSelected = newValue.toString();
            });
          },
        ),
      ),
    );
  }


  Widget buildLoseWeightAmountPerDayDropdown() {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BORDER_RADIUS),
        border: Border.all(
          color: DARK_PRIMARY_COLOR,
          width: 0.5,
        ),
      ),
      child: SizedBox(
        height: 45,
        child: DropdownButtonFormField<String?>(
          value: _weightChangeWeekly,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
          ),
          focusColor: PRIMARY_COLOR,
          items: getWeightChangeWeeklyOptions().map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _weightChangeWeekly = newValue.toString();
            });
          },
        ),
      ),
    );
  }


  List<String> getWeightChangeWeeklyOptions(){
    if(_weightSelectedUnit == KG_LABEL){
      return [GRAM_250_LABEL, GRAM_500_LABEL, GRAM_750_LABEL, GRAM_1000_LABEL];
    }else{
      return [LB_HALF_LABEL, LB_1_LABEL, LB_15_LABEL, LB_2_LABEL];
    }
  }


  Widget buildWeightUnitDropdown() {

    return Container(
      width: 100,
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
          value: _weightSelectedUnit,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
          ),
          focusColor: PRIMARY_COLOR,
          items: [LB_LABEL, KG_LABEL].map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _weightSelectedUnit = newValue.toString();
              updateWeightChangeWeekly();
            });
          },
        ),
      ),
    );
  }


  void updateWeightChangeWeekly(){
    if(_weightSelectedUnit == KG_LABEL && (_weightChangeWeekly == LB_HALF_LABEL || _weightChangeWeekly == LB_1_LABEL ||
        _weightChangeWeekly == LB_15_LABEL || _weightChangeWeekly == LB_2_LABEL )){
      if(_weightChangeWeekly == LB_HALF_LABEL){
        _weightChangeWeekly = GRAM_250_LABEL;
      }else if(_weightChangeWeekly == LB_1_LABEL){
        _weightChangeWeekly = GRAM_500_LABEL;
      }else if(_weightChangeWeekly == LB_15_LABEL){
        _weightChangeWeekly = GRAM_750_LABEL;
      }else{
        _weightChangeWeekly = GRAM_1000_LABEL;
      }
    }else if(_weightSelectedUnit == LB_LABEL && (_weightChangeWeekly == GRAM_250_LABEL || _weightChangeWeekly == GRAM_500_LABEL ||
        _weightChangeWeekly == GRAM_750_LABEL || _weightChangeWeekly == GRAM_1000_LABEL )){
      if(_weightChangeWeekly == GRAM_250_LABEL){
        _weightChangeWeekly = LB_HALF_LABEL;
      }else if(_weightChangeWeekly == GRAM_500_LABEL){
        _weightChangeWeekly = LB_1_LABEL;
      }else if(_weightChangeWeekly == GRAM_750_LABEL){
        _weightChangeWeekly = LB_15_LABEL;
      }else{
        _weightChangeWeekly = LB_2_LABEL;
      }
    }
  }


  Widget buildActivityLevelDropdown() {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: 100,
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
          value: _activitySelected,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
          ),
          focusColor: PRIMARY_COLOR,
          items: [SEDENTARY_LABEL, LIGHT_LABEL, MODERATE_LABEL, VERY_ACTIVE_LABEL].map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _activitySelected = newValue.toString();
            });
          },
        ),
      ),
    );
  }


  Widget buildHeightUnitDropdown() {

    return Container(
      width: 100,
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
          value: _heightSelectedUnit,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
          ),
          focusColor: PRIMARY_COLOR,
          items: [FT_LABEL, CM_LABEL].map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _heightSelectedUnit = newValue.toString();
            });
          },
        ),
      ),
    );
  }



}


