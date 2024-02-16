

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import '../../../../main_screen.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../domain/model/profile_model.dart';
import '../bloc/get_profile_bloc/get_profile_bloc.dart';
import '../bloc/get_profile_bloc/state_event/get_profile_state_event.dart';
import '../bloc/update_profile_bloc/state_evnt/update_profile_state_event.dart';
import '../bloc/update_profile_bloc/update_profile_bloc.dart';

class ProfileAfterRegistrationScreen extends StatefulWidget {

  static const routeName = '/profile-after-registration-screen';


  const ProfileAfterRegistrationScreen({super.key});

  @override
  State<ProfileAfterRegistrationScreen> createState() => _ProfileAfterRegistrationScreenState();
}

class _ProfileAfterRegistrationScreenState extends State<ProfileAfterRegistrationScreen> {

  static const BORDER_RADIUS = 5.0;

  final _firstNameController = TextEditingController();

  final _lastNameController = TextEditingController();

  final _weightController = TextEditingController();

  final _ageController = TextEditingController();

  final _heightController = TextEditingController();

  final _emailController = TextEditingController();

  final _goalWeightController = TextEditingController();


  String _heightSelectedUnit = FT_LABEL;
  String _weightSelectedUnit = LB_LABEL;
  String _activitySelected = SEDENTARY_LABEL;
  String _genderSelected = FEMALE_LABEL;
  String _weightChangeWeekly = LB_1_LABEL;


  List<String> _weightChangeWeeklyOptions = [];



  late GetProfileBloc _getProfileBloc;
  late UpdateProfileBloc _updateProfileBloc;


  @override
  void initState() {
    super.initState();
    _getProfileBloc = context.read<GetProfileBloc>();
    _updateProfileBloc = context.read<UpdateProfileBloc>();
    setLoseWeightAmountWeeklyOptions();
    getProfile();
  }



  void getProfile(){
    _getProfileBloc.add(const GetProfileEvent.onGetProfile());
  }


  void updateProfile(){
    _updateProfileBloc.add(
      UpdateProfileEvent.onUpdateProfileAfterRegister(
          _emailController.text,
          _firstNameController.text,
          _lastNameController.text,
          _genderSelected,
          _weightController.text,
          _heightController.text,
          _weightSelectedUnit,
          _heightSelectedUnit,
          _goalWeightController.text,
          _ageController.text,
          _activitySelected,
          _weightChangeWeekly
      )
    );
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(PROFILE_LABEL, style: TextStyle(color: Colors.white,),),
          backgroundColor: PRIMARY_COLOR,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ),
                );
              },
              child: const Text(
                SKIP_LABEL,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          /// welcome
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
                            decoration: BoxDecoration(
                              color: LIGHT_GREY_COLOR,
                              border: Border.all(
                                color: DARK_PRIMARY_COLOR,
                                width: 1,
                              ),
                            ),
                            child:  Center(
                                child: Column(
                                  children: [
                                    Image.asset(WELCOME_PATH, width: 200, height: 200,),

                                    const SizedBox(height: 8,),


                                    const Text(
                                      PROFILE_EXPLANATION,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: DARK_PRIMARY_COLOR,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ),



                          const SizedBox(height: 32,),

                          /// First and Last Name
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: buildNameTextField(hintText: FIRST_NAME_LABEL, controller: _firstNameController),
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: buildNameTextField(hintText: LAST_NAME_LABEL, controller: _lastNameController),
                                ),
                              ],
                            ),
                          ),



                          const SizedBox(height: 24.0),



                          /// Email Address
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: buildNameTextField(
                                hintText: 'email',
                                initialValue: '',
                                isEditable: false,
                                controller: _emailController
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



                          /// age and activity level Row
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
                          buildWeightChangeWeeklyDropdown(),


                          const SizedBox(height: 32.0),


                        ],
                      ),
                    )
                ),

                /// Save Button
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                    child: buildSaveButton()
                )
              ],
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
                  }else if(state is ProfileUpdatedAfterRegisterState){
                    Future.delayed(Duration.zero,(){
                      setState(() {
                        showSuccessToast(context, PROFILE_UPDATED_MSG);
                        _updateProfileBloc.add(const UpdateProfileEvent.onReset());
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(),
                          ),
                        );
                      });

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
    );
  }


  void fulfillWidgets(Profile profile){
    setState(() {
      _emailController.text = profile.email;
      _firstNameController.text = profile.firstName;
      _lastNameController.text = profile.lastName;
      _weightController.text = profile.weight;
      _heightController.text = profile.height;
      _goalWeightController.text = profile.goalWeight;
      _genderSelected = profile.gender.isEmpty ? FEMALE_LABEL : profile.gender;
      _weightSelectedUnit = profile.weightUnit.isEmpty ? LB_LABEL : profile.weightUnit;
      _heightSelectedUnit = profile.heightUnit.isEmpty ? FT_LABEL : profile.heightUnit;
      _ageController.text = profile.age;
      _activitySelected = profile.activityLevel.isEmpty ? SEDENTARY_LABEL : profile.activityLevel;

      _getProfileBloc.add(const GetProfileEvent.onReset());
    });
  }


  Widget buildSaveButton(){
    return ElevatedButton(
      onPressed: (){
        updateProfile();
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: MASTERPIE_YELLOW_COLOR
      ),
      child: const Padding(
        padding: EdgeInsets.all(12),
          child: Text(SAVE_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),)
      ),
    );
  }


  Widget buildNameTextField({
    required String hintText,
    String? initialValue,
    required TextEditingController controller,
    bool isEditable = true,
  }) {
    return SizedBox(
      height: 48,
      child: TextFormField(
        cursorColor: DARK_PRIMARY_COLOR,
        controller: controller,
        enabled: isEditable,
        decoration: InputDecoration(
          labelText: hintText,
          border:  const OutlineInputBorder(borderSide: BorderSide(color: DARK_PRIMARY_COLOR),),
          fillColor: Colors.white,
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
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
          items: [MALE_LABEL, FEMALE_LABEL, NOT_WISH_ANSWER_LABEL].map((String item) {
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


  Widget buildWeightChangeWeeklyDropdown() {
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
          items: _weightChangeWeeklyOptions.map((String item) {
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


  setLoseWeightAmountWeeklyOptions(){
    if(_weightSelectedUnit == KG_LABEL){
      _weightChangeWeeklyOptions =  [GRAM_250_LABEL, GRAM_500_LABEL, GRAM_750_LABEL, GRAM_1000_LABEL];
    }else{
      _weightChangeWeeklyOptions =  [LB_HALF_LABEL, LB_1_LABEL, LB_15_LABEL, LB_2_LABEL];
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
