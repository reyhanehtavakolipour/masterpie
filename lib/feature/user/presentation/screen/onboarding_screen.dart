


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/user/presentation/bloc/get_profile_bloc/get_profile_bloc.dart';
import 'package:masterpie/feature/user/presentation/bloc/get_profile_bloc/state_event/get_profile_state_event.dart';
import 'package:masterpie/feature/user/presentation/bloc/update_profile_bloc/state_evnt/update_profile_state_event.dart';
import 'package:masterpie/main_screen.dart';
import 'package:masterpie/util/core/constant/sqflite_constants.dart';
import 'package:masterpie/util/design/color/app_colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../util/core/constant/api_constant.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../../foods/presentation/screen/ui_helper/custom_radio_button.dart';
import '../../domain/model/profile_model.dart';
import '../bloc/update_profile_bloc/update_profile_bloc.dart';


const String instagram= 'Instagram';
const String reddit= 'Reddit';
const String friend_recom= 'Friend\'s Recommendation';
const String web_search= 'Web Search';
const String other_label= 'Other';


final dietOptions= ['$CLASSIC_LABEL (30% $PROTEIN_LABEL, 30% $FAT_LABEL, 40% $CARB)',
  '$KETO_LABEL (25% $PROTEIN_LABEL, 5% $CARB_LABEL, 70% $FAT_LABEL)'];



class OnBoardingScreen extends StatefulWidget {

  final bool isOnBoard;

  const OnBoardingScreen({super.key, required this.isOnBoard});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {



  final PageController _pageController = PageController(initialPage: 0);

  int _currentPage = 0;


  Profile _profile= Profile();



  //diet
  String _diet= dietOptions[0];

  int _stepsCount= 2;

  // form
  final _weightController = TextEditingController();

  final _ageController = TextEditingController();

  final _heightController = TextEditingController();

  final _goalWeightController = TextEditingController();


  final _otherController = TextEditingController();


  late UpdateProfileBloc _updateProfileBloc;
  late GetProfileBloc _getProfileBloc;


  String _heightSelectedUnit = FT_LABEL;
  String _weightSelectedUnit = LB_LABEL;
  String _activitySelected = '-';
  String _genderSelected = FEMALE_LABEL;



  String _knowFrom= '';


  @override
  void initState() {
    super.initState();
    _updateProfileBloc = context.read<UpdateProfileBloc>();
    _getProfileBloc = context.read<GetProfileBloc>();
    getProfile();
  }


  void getProfile(){
    _getProfileBloc.add(
        const GetProfileEvent.onGetProfile()
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [

                  /// step 1
                  Visibility(
                      visible: widget.isOnBoard,
                      child: _knowUsFromWhere()
                  ),

                  /// step2
                  Visibility(
                      visible: widget.isOnBoard,
                      child: _fillForm()
                  ),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                    (int index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    height: 10.0,
                    width: _currentPage == index ? 20.0 : 10.0,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? MASTERPIE_YELLOW_COLOR
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  );
                },
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
                      _profile= state.profile;
                      _getProfileBloc.add(const GetProfileEvent.onReset());
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
                  }else if(state is ProfileUpdatedState){
                    Future.delayed(Duration.zero,(){
                      setState(() {
                        _updateProfileBloc.add(const UpdateProfileEvent.onReset());
                        _goToMainScreen();
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

            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }




  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }



  Widget _fillForm(){
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          const SizedBox(height: 24,),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Container(
                    margin: const EdgeInsets.only(top: 48),
                    height: 30,
                    child: Text(
                      '2/$_stepsCount',
                      style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    ),
                  ),


                  Padding(
                      padding: const EdgeInsets.all(4),
                      child: Center(child: Image.asset(FORM_PATH, width: 200, height: 200,))
                  ),


                  const SizedBox(height: 48,),


                  // /// Gender Dropdown
                  // Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 8),
                  //     child: buildGenderDropdown()
                  // ),
                  //
                  //
                  // const SizedBox(height: 24.0),
                  //
                  //
                  // /// Weight and Unit Row
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 8),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: buildNumberTextField(hintText: WEIGHT_LABEL, controller: _weightController),
                  //       ),
                  //       const SizedBox(width: 16.0),
                  //       Expanded(
                  //           child: buildWeightUnitDropdown()
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //
                  //
                  //
                  // const SizedBox(height: 24.0),
                  //
                  //
                  //
                  // /// age and weight Row
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 8),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: buildNumberTextField(hintText: AGE_LABEL, controller: _ageController),
                  //       ),
                  //       const SizedBox(width: 16.0),
                  //       Expanded(
                  //           child: buildNumberTextField(hintText: GOAL_WEIGHT_LABEL, controller: _goalWeightController)
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //
                  //
                  //
                  // const SizedBox(height: 24.0),
                  //
                  //
                  //
                  // /// Height and Unit Row
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 8),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: buildNumberTextField(hintText: HEIGHT_LABEL, controller: _heightController),
                  //       ),
                  //       const SizedBox(width: 32.0),
                  //       Expanded(
                  //           child: buildHeightUnitDropdown()
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //
                  //





                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(BORDER_RADIUS),
                        color: LIGHT_GREY_COLOR
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        /// age
                        Expanded(child: buildNumberTextField(hintText: AGE_LABEL, controller: _ageController)),

                        const SizedBox(height: 24.0),

                        /// Gender Dropdown
                        Expanded(child: buildGenderDropdown())
                      ],
                    ),
                  ),



                  /// Weight and goal weight and weight unit
                  Container(
                    margin: const EdgeInsets.only(bottom: 16, top: 16),
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(BORDER_RADIUS),
                        color: LIGHT_GREY_COLOR
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: buildNumberTextField(hintText: WEIGHT_LABEL, controller: _weightController),
                            ),
                            const SizedBox(width: 4.0),
                            Expanded(
                              child:  buildNumberTextField(hintText: GOAL_WEIGHT_LABEL, controller: _goalWeightController),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24.0),


                        buildWeightUnitDropdown(),
                      ],
                    ),
                  ),




                  /// Height and Unit Row
                   const Padding(
                     padding: EdgeInsets.only(left: 4),
                       child: Text(HEIGHT_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 14, fontWeight: FontWeight.bold),)
                   ),

                  const SizedBox(height: 4.0),

                  Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16),
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(BORDER_RADIUS),
                        color: LIGHT_GREY_COLOR
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: buildHeightTextField(hintText: HEIGHT_LABEL, controller: _heightController),
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
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(ACTIVITY_LEVEL_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),)
                  ),
                  const SizedBox(height: 4.0),


                  buildActivityLevelDropdown(),




                ],
              ),
            ),
          ),


          const SizedBox(height: 16,),


          /// done & previous button
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(BORDER_RADIUS),
                      ),
                      backgroundColor: MASTERPIE_YELLOW_COLOR
                  ),
                  onPressed: (){
                    setState(() {
                      _goToPage(0);
                    });
                  },
                  child: const Text(PREVIOUS_LABEL, style: TextStyle( color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
                ),
              ),

              const SizedBox(width: 8,),

              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(BORDER_RADIUS),
                      ),
                      backgroundColor: DARK_PRIMARY_COLOR
                  ),
                  onPressed: (){
                    if(_weightController.text.isEmpty || _goalWeightController.text.isEmpty ||
                        _ageController.text.isEmpty || _heightController.text.isEmpty || _activitySelected == '-'){
                      showErrorToast(context, FILL_ALL_ERROR);
                      return;
                    }

                    _saveUserInputsInOnboard();
                  },
                  child: const Text(DONE_LABEL, style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }


  Widget buildHeightTextField({
    required String hintText,
    String? initialValue,
    bool isEditable = true,
    required TextEditingController controller
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
          labelText: _heightSelectedUnit == FT_LABEL ? 'eg: 5.6' : 'eg: 170',
          border:  const OutlineInputBorder(borderSide: BorderSide(color: DARK_PRIMARY_COLOR),),
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _knowUsFromWhere(){
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 24,),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[


                  Container(
                    margin: const EdgeInsets.only(top: 48),
                    height: 30,
                    child: Text(
                      '1/$_stepsCount',
                      style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    ),
                  ),

                  const SizedBox(height: 18,),


                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: LIGHT_GREY_COLOR,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      HOW_KNOW_US,
                      style: TextStyle(fontSize: 16, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),


                  const SizedBox(height: 32,),



                  Row(
                    children: [

                      Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                if(_knowFrom == instagram){
                                  _knowFrom= '';
                                }else{
                                  _knowFrom= instagram;
                                }
                                _otherController.text = '';
                              });
                            },
                            child: Container(
                              height: 80,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: _knowFrom == instagram ? MASTERPIE_YELLOW_COLOR : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: DARK_PRIMARY_COLOR,
                                  width: 0.5,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  instagram,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, ),
                                ),
                              ),
                            ),
                          )
                      ),

                      const SizedBox(width: 18,),

                      Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                if(_knowFrom == reddit){
                                  _knowFrom= '';
                                }else{
                                  _knowFrom= reddit;
                                }
                                _otherController.text = '';
                              });
                            },
                            child: Container(
                              height: 80,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: _knowFrom == reddit ? MASTERPIE_YELLOW_COLOR : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: DARK_PRIMARY_COLOR,
                                  width: 0.5,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  reddit,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, ),
                                ),
                              ),
                            ),
                          )
                      ),

                    ],
                  ),


                  const SizedBox(height: 16,),


                  Row(
                    children: [

                      Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                if(_knowFrom == web_search){
                                  _knowFrom= '';
                                }else{
                                  _knowFrom= web_search;
                                }
                                _otherController.text = '';
                              });
                            },
                            child: Container(
                              height: 80,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: _knowFrom == web_search ? MASTERPIE_YELLOW_COLOR : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: DARK_PRIMARY_COLOR,
                                  width: 0.5,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  web_search,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, ),
                                ),
                              ),
                            ),
                          )
                      ),

                      const SizedBox(width: 18,),

                      Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                if(_knowFrom == friend_recom){
                                  _knowFrom= '';
                                }else{
                                  _knowFrom= friend_recom;
                                }
                                _otherController.text = '';
                              });
                            },
                            child: Container(
                              height: 80,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: _knowFrom == friend_recom ? MASTERPIE_YELLOW_COLOR : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: DARK_PRIMARY_COLOR,
                                  width: 0.5,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  friend_recom,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, ),
                                ),
                              ),
                            ),
                          )
                      ),

                    ],
                  ),



                  const SizedBox(height: 18,),


                  SizedBox(
                    height: 48,
                    child: TextFormField(
                      cursorColor: DARK_PRIMARY_COLOR,
                      controller: _otherController,
                      enabled: _knowFrom.isEmpty,
                      decoration: const InputDecoration(
                        labelText: OTHER_WRITE_SOURCE,
                        border:  OutlineInputBorder(borderSide: BorderSide(color: DARK_PRIMARY_COLOR),),
                        fillColor: Colors.white,
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),


          const SizedBox(height: 16,),


          /// next button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(BORDER_RADIUS),
                  ),
                  backgroundColor: DARK_PRIMARY_COLOR
              ),
              onPressed: (){
                _goToPage(1);
              },
              child: const Text(NEXT_LABEL, style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),),
            ),
          ),
        ],
      ),
    );
  }



  void saveUserSourceToSupabase() async{
    try{

      final supabase = Supabase.instance.client;

      if(_knowFrom == instagram || _knowFrom == reddit || _knowFrom == web_search || _knowFrom == friend_recom){

        final sourceResponse = await supabase
            .from(USER_SOURCE_TABLE)
            .select<List<dynamic>>()
            .eq('id', 1);


        if(sourceResponse.isNotEmpty){

          final Map<String, dynamic> data = <String, dynamic>{};
          data['id'] = 1;


          if(_knowFrom == instagram){
            final instaCount= sourceResponse[0]['instagram'].toString();
            data['instagram'] = int.parse(instaCount) + 1;
          }else if(_knowFrom == reddit){
            final redditCount= sourceResponse[0]['reddit'].toString();
            data['reddit'] = int.parse(redditCount) + 1;
          }else if(_knowFrom == web_search){
            final webCount= sourceResponse[0]['web'].toString();
            data['web'] = int.parse(webCount) + 1;
          }else if(_knowFrom == friend_recom){
            final friendCount= sourceResponse[0]['friend'].toString();
            data['friend'] = int.parse(friendCount) + 1;
          }

          await supabase.from(USER_SOURCE_TABLE).update(data).eq('id', 1);

        }
      }else if(_otherController.text.isNotEmpty){
        //other
        final Map<String, dynamic> data = <String, dynamic>{};
        data['other'] = _otherController.text;

        await supabase.from(USER_SOURCE_TABLE).insert(data);

      }
    }on PostgrestException catch (error) {
    } catch (error) {
    }
  }


  void _saveUserInputsInOnboard() {


    String weightChangeWeekly= _weightSelectedUnit == LB_LABEL ? LB_1_LABEL : GRAM_250_LABEL;


    //diet
    String diet= CLASSIC_LABEL;
    if(_diet.contains(CLASSIC_LABEL)){
      diet= CLASSIC_LABEL;
    }else if(_diet.contains(KETO_LABEL)){
      diet= KETO_LABEL;
    } else if(_diet.contains(VEGETERIAN_LABEL)){
      diet= VEGETERIAN_LABEL;
    }

    _updateProfileBloc.add(
        UpdateProfileEvent.onUpdateProfile(
            _profile.email,
            _profile.firstName,
            _profile.lastName,
            _genderSelected,
            _weightController.text,
            _heightController.text,
            _weightSelectedUnit,
            _heightSelectedUnit,
            _goalWeightController.text,
            _ageController.text,
            _activitySelected,
            weightChangeWeekly,
            ['Breakfast', 'Lunch', 'Dinner'],
            ['Snack'],
            diet,
            [],
            [],
            _profile.dailyMacroGoal
        )
    );
  }



  Widget buildActivityLevelDropdown() {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BORDER_RADIUS),
        border: Border.all(
          color: DARK_PRIMARY_COLOR,
          width: 0.5,
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: DropdownButtonFormField<String?>(
          value: _activitySelected,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
          ),
          focusColor: PRIMARY_COLOR,
          items: ['-',SEDENTARY_LABEL, LIGHT_LABEL, MODERATE_LABEL, VERY_ACTIVE_LABEL].map((String item) {
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
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
        ],
        keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
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
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BORDER_RADIUS),
        border: Border.all(
          color: DARK_PRIMARY_COLOR,
          width: 0.5,
        ),
      ),
      child: SizedBox(
        width: double.infinity,
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


  void _updateDietUi(String diet){
    setState(() {
      _diet= diet;
    });
  }


  void _goToMainScreen() async{
    saveUserSourceToSupabase();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainScreen(isFromOnboard: true),
      ),
    );
  }


}

