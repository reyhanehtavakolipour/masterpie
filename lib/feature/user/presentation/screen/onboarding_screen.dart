import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/foods/presentation/bloc/get_fat_secret_foods_info_bloc/get_fat_secret_foods_info_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/get_fat_secret_foods_info_bloc/state_event/get_fat_secret_foods_info_state_event.dart';
import 'package:masterpie/feature/user/presentation/bloc/get_profile_bloc/get_profile_bloc.dart';
import 'package:masterpie/feature/user/presentation/bloc/get_profile_bloc/state_event/get_profile_state_event.dart';
import 'package:masterpie/feature/user/presentation/bloc/update_profile_bloc/state_evnt/update_profile_state_event.dart';
import 'package:masterpie/main_screen.dart';
import 'package:masterpie/util/core/helper/helper.dart';
import 'package:masterpie/util/core/helper/print.dart';
import 'package:masterpie/util/design/color/app_colors.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../util/core/constant/api_constant.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../../foods/presentation/screen/recie_types_popup.dart';
import '../../domain/model/profile_model.dart';
import '../bloc/update_profile_bloc/update_profile_bloc.dart';


const String instagram= 'Instagram';
const String reddit= 'Reddit';
const String friend_recom= 'Friend\'s Recommendation';
const String web_search= 'Web Search';
const String other_label= 'Other';


class OnBoardingScreen extends StatefulWidget {

  final bool isOnBoard;

  const OnBoardingScreen({super.key, required this.isOnBoard});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  final PageController _pageController = PageController(initialPage: 0);

  int _currentPage = 0;


  late GetFatSecretFoodsInfoBloc _getFatSecretFoodsInfoBloc;

  Profile _profile= Profile();


  // fatsecret
  List<String> _fatSecretMainDishesTypes= [];
  List<String> _fatSecretSideDishesTypes= [];
  List<String> _allCategoryOptions= [];
  List<String> _allAllergenOptions= [];



  //main dishes
  bool _isCustomNumberMainDishSelected = false;
  int _selectedMainDishChoice= 3;
  late TextEditingController _mainDishTimesController;
  List<String> _mainDishesType= [];

  //side dishes
  bool _isCustomNumberSideDishSelected = false;
  int _selectedSideDishChoice= 2;
  late TextEditingController _sideDishTimesController;
  List<String> _sideDishesType= [];


  //favorite categories
  List<String> _favoriteCategories=[];


  //hate categories
  List<String> _hateCategories=[];

  //allergens
  List<String> _allergens= [];


  int _stepsCount= 7;

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
  String _activitySelected = SEDENTARY_LABEL;
  String _genderSelected = FEMALE_LABEL;



  String _knowFrom= '';


  @override
  void initState() {
    super.initState();
    _getFatSecretFoodsInfoBloc = context.read<GetFatSecretFoodsInfoBloc>();
    _mainDishTimesController= TextEditingController(text: '3');
    _sideDishTimesController= TextEditingController(text: '2');
    _updateProfileBloc = context.read<UpdateProfileBloc>();
    _getProfileBloc = context.read<GetProfileBloc>();
    getProfile();
    _setEditTextsListener();
  }


  void getProfile(){
    _getProfileBloc.add(
      const GetProfileEvent.onGetProfile()
    );
  }

  void _setEditTextsListener(){
    _mainDishTimesController.addListener(() {
      if(_mainDishTimesController.text.isNotEmpty){
        _updateMainDishType('');
      }
    });
    _sideDishTimesController.addListener(() {
      if(_sideDishTimesController.text.isNotEmpty){
        _updateSideDishType('');
      }
    });
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

                  ///step 1
                  _numberOfMealsDuringDays(),

                  /// step2
                  _selectRecipesType(),

                  /// step 3
                  _selectAllergens(),


                  /// step4
                  _selectFavoriteCategories(),


                  /// step 5
                  _selectHateCategories(),

                  /// step6
                  Visibility(
                      visible: widget.isOnBoard,
                      child: _fillForm()
                  ),


                  /// step 7
                  Visibility(
                      visible: widget.isOnBoard,
                      child: _knowUsFromWhere()
                  )

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
                      fillUiWithProfile(state.profile);
                      _requestFatSecretFoodsInfo();
                    });
                  }else if(state is GetProfileErrorState){
                    _getProfileBloc.add(const GetProfileEvent.onReset());
                    Future.delayed(Duration.zero,(){
                      _requestFatSecretFoodsInfo();
                      return showErrorToast(context, state.message);
                    });
                  }else{
                  }
                  return Container();
                },
                listener: (context, state){

                }
            ),

            BlocConsumer<GetFatSecretFoodsInfoBloc, GetFatSecretFoodsInfoState>(
                builder: (mcontext, state) {
                  if(state is FatSecretFoodInfoLoadedState){
                    Future.delayed(Duration.zero,(){
                      _getFatSecretFoodsInfoBloc.add(const GetFatSecretFoodsInfoEvent.onReset());
                      _fatSecretMainDishesTypes= state.fatSecretFoodsInfo.recipeTypes;
                      _fatSecretSideDishesTypes= state.fatSecretFoodsInfo.recipeTypes;
                      _allCategoryOptions= state.fatSecretFoodsInfo.categories;
                      _allAllergenOptions= state.fatSecretFoodsInfo.allergens;
                      _convertFatSecretDataToUiData();
                      _updateMainDishType('');
                      _updateSideDishType('');
                    });
                    return Container();
                  }else if(state is FatSecretFoodInfoErrorState){
                    Future.delayed(Duration.zero,(){
                      return showErrorToast(context, state.message);
                    });
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



  void fillUiWithProfile(Profile profile){
    setState(() {
      _mainDishTimesController.text= profile.mainDishTypes.length.toString();
      _sideDishTimesController.text= profile.sideDishTypes.length.toString();
      _selectedMainDishChoice= profile.mainDishTypes.length;
      _selectedSideDishChoice= profile.sideDishTypes.length;
      _mainDishesType= profile.mainDishTypes;
      _sideDishesType= profile.sideDishTypes;
      _favoriteCategories= profile.favoriteCategories;
      _hateCategories= profile.hateCategories;
      _allergens= profile.allergens;
    });
  }


  void _convertFatSecretDataToUiData(){

    //organize main dishes types
    List<String> mainDishTypes= [];
    mainDishTypes.add('Breakfast');
    mainDishTypes.add('Lunch');
    mainDishTypes.add('Dinner');
    _fatSecretMainDishesTypes= sortAlphabetically(mainDishTypes);


    //organize side dishes types
    List<String> sideDishTypes= [];
    _fatSecretSideDishesTypes.forEach((element) {
      if(element != 'Breakfast'  && element != 'Lunch' &&
          element != 'Baked' && element != 'Sauce and Condiment' &&
          element != 'Side Dish' && element != 'Main Dish' && element != 'Other'){
        sideDishTypes.add(element);
      }
    });
    _fatSecretSideDishesTypes= sideDishTypes;



    //remove useless categories
    List<String> categories= [];
    _allCategoryOptions.forEach((element) {
      if(element != 'Beverages' &&  element != 'Fast Food' &&
          element != 'Fruit' &&  element != 'Other' &&
          element != 'Salads' &&  element != 'Sauces Spices & Spreads' &&
          element != 'Snack' &&  element != 'Vegetables'
      ){
        categories.add(element);
      }
    });
    _allCategoryOptions= categories;



    //remove useless allergen
    List<String> allergens= [];
    _allAllergenOptions.forEach((element) {
      if(element != 'Peanuts' && element != 'Milk'){
        allergens.add(element);
      }
    });
    _allAllergenOptions= allergens;

  }


  void _requestFatSecretFoodsInfo(){
    _getFatSecretFoodsInfoBloc.add(
        const GetFatSecretFoodsInfoEvent.onGetFatSecretFoodsInfo()
    );
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _updateMainDishType(String type){
    setState(() {

      int mainDishTimes= 3;
      bool isValid= isValidInteger(_mainDishTimesController.text);
      if(isValid){
        mainDishTimes= int.parse(_mainDishTimesController.text);
      }

      if( mainDishTimes <= _mainDishesType.length){
        List<String> newList= [];
        for (int i = 1; i <= mainDishTimes; i++) {
          if(i <=  mainDishTimes){
            newList.add(_mainDishesType[i-1]);
          }
        }
        _mainDishesType= newList;
      }else{
        List<String> newList= [];
        for (int i = 1; i <= mainDishTimes; i++) {
          if(i <= _mainDishesType.length){
            newList.add(_mainDishesType[i-1]);
          }else{
            newList.add('');
          }
        }
        _mainDishesType= newList;
      }
    });
  }


  void _updateSideDishType(String type){
    setState(() {

      int sideDishTimes= 3;
      bool isValid= isValidInteger(_sideDishTimesController.text);
      if(isValid){
        sideDishTimes= int.parse(_sideDishTimesController.text);
      }

      if(sideDishTimes <= _sideDishesType.length){
        List<String> newList= [];
        for (int i = 1; i <= sideDishTimes; i++) {
          if(i <=  sideDishTimes){
            newList.add(_sideDishesType[i-1]);
          }
        }
        _sideDishesType= newList;
      }else{
        List<String> newList= [];
        for (int i = 1; i <= sideDishTimes; i++) {
          if(i <= _sideDishesType.length){
            newList.add(_sideDishesType[i-1]);
          }else{
            newList.add('');
          }
        }
        _sideDishesType= newList;
      }
    });
  }

  Widget _selectRecipesType(){
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Visibility(
            visible: widget.isOnBoard,
            child: Container(
              margin: const EdgeInsets.only(top: 48),
              height: 30,
              child: Row(
                children: [
                   Expanded(
                    child: Text(
                      '2/$_stepsCount',
                      style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    ),
                  ),

                  skipBtn()

                ],
              ),
            ),
          ),

          const SizedBox(height: 24,),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: LIGHT_GREY_COLOR,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      SELECT_RECIPE_TYPE,
                      style: TextStyle(fontSize: 16, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    ),
                  ),

                  const SizedBox(height: 16,),


                  const Text(
                    MAIN_DISH_LABEL,
                    style: TextStyle(fontSize: 14, color: MASTERPIE_ORANGE_COLOR, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),


                  _buildMainDishesTypes(),

                  const SizedBox(height: 32,),


                  const Text(
                    SIDE_DISH_LABEL,
                    style: TextStyle(fontSize: 14, color: MASTERPIE_ORANGE_COLOR, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),


                  _buildSideDishesTypes(),

                ],
              ),
            ),
          ),


          const SizedBox(height: 16,),

          /// next & previous button
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
                    _goToPage(2);
                  },
                  child: const Text(NEXT_LABEL, style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _selectHateCategories(){
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Visibility(
            visible: widget.isOnBoard,
            child: Container(
              margin: const EdgeInsets.only(top: 48),
              height: 30,
              child: Row(
                children: [
                   Expanded(
                    child: Text(
                      '5/$_stepsCount',
                      style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    ),
                  ),

                  skipBtn()

                ],
              ),
            ),
          ),

          const SizedBox(height: 24,),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(4),
                      child: Center(child: Image.asset(HATE_RECIPE_PATH, width: 200, height: 200,))
                  ),

                  const SizedBox(height: 16,),


                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: LIGHT_GREY_COLOR,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      SELECT_HATE_CATEGORIES,
                      style: TextStyle(fontSize: 16, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),


                  _buildHateCategories()

                ],
              ),
            ),
          ),


          const SizedBox(height: 16,),


          /// next & previous button
          Visibility(
            visible: widget.isOnBoard,
            child: Row(
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
                        _goToPage(3);
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
                      _goToPage(5);
                    },
                    child: const Text(NEXT_LABEL, style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
          ),

          /// done & previous button
          Visibility(
              visible: !widget.isOnBoard,
              child: Row(
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
                          _goToPage(3);
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
                        _saveUserInputsInsideApp();
                      },
                      child: const Text(DONE_LABEL, style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }


  Widget _fillForm(){
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            margin: const EdgeInsets.only(top: 48),
            height: 30,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '6/$_stepsCount',
                    style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                  ),
                ),

                skipBtn()

              ],
            ),
          ),

          const SizedBox(height: 24,),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Padding(
                      padding: const EdgeInsets.all(4),
                      child: Center(child: Image.asset(FORM_PATH, width: 200, height: 200,))
                  ),



                  const SizedBox(height: 48,),


                  /// Gender Dropdown
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: buildGenderDropdown()
                  ),


                  const SizedBox(height: 24.0),


                  /// Weight and Unit Row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
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
                    padding: const EdgeInsets.symmetric(horizontal: 8),
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
                    padding: const EdgeInsets.symmetric(horizontal: 8),
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



          /// next & previous button
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
                      _goToPage(4);
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
                        _ageController.text.isEmpty || _heightController.text.isEmpty){
                      showErrorToast(context, FILL_ALL_ERROR);
                      return;
                    }

                    _goToPage(6);
                  },
                  child: const Text(NEXT_LABEL, style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }



  Widget _knowUsFromWhere(){
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            margin: const EdgeInsets.only(top: 48),
            height: 30,
            child: Row(
              children: [
                 Expanded(
                  child: Text(
                    '7/$_stepsCount',
                    style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                  ),
                ),

                skipBtn()

              ],
            ),
          ),

          const SizedBox(height: 24,),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[


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
                      _goToPage(5);
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




  void saveUserSourceToSupabase() async{

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

    // try{
    //
    // }on PostgrestException catch (error) {
    // } catch (error) {
    // }
  }


  void _saveUserInputsInOnboard() {

    saveUserSourceToSupabase();


    String weightChangeWeekly= _weightSelectedUnit == LB_LABEL ? LB_1_LABEL : GRAM_250_LABEL;

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
        _mainDishesType,
        _sideDishesType,
        _favoriteCategories,
        _hateCategories,
        _allergens,
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

  Widget _selectAllergens(){
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Visibility(
            visible: widget.isOnBoard,
            child: Container(
              margin: const EdgeInsets.only(top: 48),
              height: 30,
              child: Row(
                children: [
                   Expanded(
                    child: Text(
                      '3/$_stepsCount',
                      style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    ),
                  ),

                  skipBtn()

                ],
              ),
            ),
          ),

          const SizedBox(height: 24,),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Padding(
                      padding: const EdgeInsets.all(4),
                      child: Center(child: Image.asset(ALLERGEN_PATH, width: 200, height: 200,))
                  ),

                  const SizedBox(height: 16,),


                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: LIGHT_GREY_COLOR,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      SELECT_ALLERGENS,
                      style: TextStyle(fontSize: 16, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  _buildAllergens(),

                ],
              ),
            ),
          ),


          const SizedBox(height: 16,),

          /// next & previous button
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
                      _goToPage(1);
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
                    _goToPage(3);
                  },
                  child: const Text(NEXT_LABEL, style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }


  void _saveUserInputsInsideApp(){

    //favorites
    List<String> favorites= [];
    _favoriteCategories.forEach((element) {
      if(element.isNotEmpty){
        favorites.add(element);
      }
    });
    _favoriteCategories= favorites;


    //hates
    List<String> hates= [];
    _hateCategories.forEach((element) {
      if(element.isNotEmpty){
        hates.add(element);
      }
    });
    _hateCategories= hates;


    //main dish types
    List<String> mainDishTypes= [];
    _mainDishesType.forEach((element) {
      if(element.isNotEmpty){
        mainDishTypes.add(element);
      }
    });
    _mainDishesType= mainDishTypes;


    //sideDishTypes
    List<String> sideDishTypes= [];
    _sideDishesType.forEach((element) {
      if(element.isNotEmpty){
        sideDishTypes.add(element);
      }
    });
    _sideDishesType= sideDishTypes;



    //allergens
    List<String> allergens= [];
    _allergens.forEach((element) {
      if(element.isNotEmpty){
        allergens.add(element);
      }
    });
    _allergens= allergens;


    _updateProfileBloc.add(
        UpdateProfileEvent.onUpdateProfile(
          _profile.email,
          _profile.firstName,
          _profile.lastName,
          _profile.gender,
          _profile.weight,
          _profile.height,
          _profile.weightUnit,
          _profile.heightUnit,
          _profile.goalWeight,
          _profile.age,
          _profile.activityLevel,
          _profile.weightChangeWeekly,
          _mainDishesType,
          _sideDishesType,
          _favoriteCategories,
          _hateCategories,
          _allergens,
          _profile.dailyMacroGoal
        )
    );
  }

  Widget _selectFavoriteCategories(){
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Visibility(
            visible: widget.isOnBoard,
            child: Container(
              margin: const EdgeInsets.only(top: 48),
              height: 30,
              child: Row(
                children: [
                   Expanded(
                    child: Text(
                      '4/$_stepsCount',
                      style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    ),
                  ),

                  skipBtn()

                ],
              ),
            ),
          ),

          const SizedBox(height: 24,),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[

                  Padding(
                      padding: const EdgeInsets.all(4),
                      child: Center(child: Image.asset(FAVORITE_RECIPE_PATH, width: 200, height: 200,))
                  ),

                  const SizedBox(height: 16,),


                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: LIGHT_GREY_COLOR,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      SELECT_FAVORITE_CATEGORIES,
                      style: TextStyle(fontSize: 16, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  _buildFavoriteCategories(),


                ],
              ),
            ),
          ),


          const SizedBox(height: 16,),

          /// next & previous button
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
                        _goToPage(2);
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
                    _goToPage(4);
                  },
                  child: const Text(NEXT_LABEL, style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }


  Widget _buildHateCategories(){

    //remove favorite categories from the options

    List<String> hateOptions= [];
    _allCategoryOptions.forEach((element) {
      if(!_favoriteCategories.contains(element)){
        hateOptions.add(element);
      }
    });


    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 24,
        children:  hateOptions.map(
              (item) {
            return RawChip(
              backgroundColor: _hateCategories.contains(item) ? DARK_PRIMARY_COLOR : LIGHT_GREY_COLOR,
              onSelected: (bool selected) {
                setState(() {
                  if(selected){
                    if(!_hateCategories.contains(item)){
                      List<String> list= [];
                      list.addAll(_hateCategories);
                      list.add(item);
                      _hateCategories= list;
                    }
                  }else{
                    _hateCategories.remove(item);
                  }
                });
              },
              deleteIconColor: LIGHT_GREY_COLOR,
              onDeleted: (){
                setState(() {
                  List<String> list= [];
                  _hateCategories.forEach((element) {
                    if(element != item){
                      list.add(element);
                    }
                  });
                  _hateCategories= list;
                });
              },
              label: Text(item, style: TextStyle(color: _hateCategories.contains(item) ? Colors.white : DARK_PRIMARY_COLOR),),
            );
          },
        ).toList(),
      ),
    );
  }

  Widget _buildAllergens(){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 24,
        children:  _allAllergenOptions.map(
              (item) {
            return RawChip(
              backgroundColor: _allergens.contains(item) ? DARK_PRIMARY_COLOR : LIGHT_GREY_COLOR,
              onSelected: (bool selected) {
                setState(() {
                  if(selected){
                    if(!_allergens.contains(item)){
                      List<String> list= [];
                      list.addAll(_allergens);
                      list.add(item);
                      _allergens= list;
                    }
                  }else{
                    _allergens.remove(item);
                  }
                });
              },
              deleteIconColor: LIGHT_GREY_COLOR,
              onDeleted: (){
                setState(() {
                  List<String> list= [];
                  _allergens.forEach((element) {
                    if(element != item){
                      list.add(element);
                    }
                  });
                  _allergens= list;
                });
              },
              label: Text(item, style: TextStyle(color: _allergens.contains(item) ? Colors.white : DARK_PRIMARY_COLOR),),
            );
          },
        ).toList(),
      ),
    );
  }


  Widget _buildFavoriteCategories(){

    //remove allergens
    if(_allergens.contains('Egg') || _allergens.contains('Fish') || _allergens.contains('Nuts')){
      List<String> categories= [];
      _allCategoryOptions.forEach((element) {
        if(element == 'Eggs'){
          if(!_allergens.contains('Egg')){
            categories.add(element);
          }
        }else if(element == 'Nuts & Seeds'){
          if(!_allergens.contains('Nuts')){
            categories.add(element);
          }
        }else if(element == 'Fish & Seafood'){
          if(!_allergens.contains('Fish')){
            categories.add(element);
          }
        }else{
          categories.add(element);
        }
      });

      _allCategoryOptions= categories;
    }


    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 24,
        children:  _allCategoryOptions.map(
              (item) {
            return RawChip(
              backgroundColor: _favoriteCategories.contains(item) ? DARK_PRIMARY_COLOR : LIGHT_GREY_COLOR,
              onSelected: (bool selected) {
                setState(() {
                  if(selected){
                    if(!_favoriteCategories.contains(item)){
                      List<String> list= [];
                      list.addAll(_favoriteCategories);
                      list.add(item);
                      _favoriteCategories= list;
                    }
                  }else{
                    _favoriteCategories.remove(item);
                  }
                });
              },
              deleteIconColor: LIGHT_GREY_COLOR,
              onDeleted: (){
                setState(() {
                  List<String> list= [];
                  _favoriteCategories.forEach((element) {
                    if(element != item){
                      list.add(element);
                    }
                  });
                  _favoriteCategories= list;
                });
              },
              label: Text(item, style: TextStyle(color: _favoriteCategories.contains(item) ? Colors.white : DARK_PRIMARY_COLOR),),
            );
          },
        ).toList(),
      ),
    );
  }


  Widget _buildMainDishesTypes(){
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 16),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _mainDishesType.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            _showAllRecipeTypesForMainDishes(index);
          },
          child: Container(
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: _mainDishesType[index].isEmpty ? LIGHT_GREY_COLOR : Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.grey, // Border color
                width: 1, // Border width
              ),
            ),
            height: 70.0,
            child: Center(
              child: _mainDishesType[index].isEmpty ? Text(
                'NUMBER ${index+1} MAIN DISH',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ) : Text(
                _mainDishesType[index],
                style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 14, fontWeight: FontWeight.bold),
              ) ,
            ),
          ),
        );
      },
    );
  }

  Widget _buildSideDishesTypes(){
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 16),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _sideDishesType.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            _showAllRecipeTypesForSideDishes(index);
          },
          child: Container(
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: _sideDishesType[index].isEmpty ? LIGHT_GREY_COLOR : Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: _sideDishesType[index].isEmpty ? Colors.grey : DARK_PRIMARY_COLOR, // Border color
                width: 1,          // Border width
              ),
            ),
            height: 70.0,
            child: Center(
              child: _sideDishesType[index].isEmpty ? Text(
                'NUMBER ${index+1} SIDE DISH',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ) : Text(
                _sideDishesType[index],
                style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 14, fontWeight: FontWeight.bold),
              ) ,
            ),
          ),
        );
      },
    );
  }


  void _showAllRecipeTypesForSideDishes(int index) async{
    int selectedIndex = await showDialog(
      context: context,
      builder: (context) {
        return RecipeTypesPopup(
          types: _fatSecretSideDishesTypes,
        );
      },
    );
    setState(() {
      _sideDishesType[index] = _fatSecretSideDishesTypes[selectedIndex];
    });
  }


  void _showAllRecipeTypesForMainDishes(int index) async{
    int selectedIndex = await showDialog(
      context: context,
      builder: (context) {
        return RecipeTypesPopup(
          types: _fatSecretMainDishesTypes,
        );
      },
    );

    setState(() {
      _mainDishesType[index] = _fatSecretMainDishesTypes[selectedIndex];
    });
  }

  Widget _numberOfMealsDuringDays(){
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [

          Visibility(
            visible: widget.isOnBoard,
            child: Container(
              margin: const EdgeInsets.only(top: 48),
              height: 30,
              child: Row(
                children: [
                   Expanded(
                      child: Text(
                        '1/$_stepsCount',
                        style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                      ),
                  ),

                skipBtn()

                ],
              ),
            ),
          ),



          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Padding(
                      padding: const EdgeInsets.all(4),
                      child: Center(child: Image.asset(FEQUENT_EATING_PATH, width: 200, height: 200,))
                  ),

                  const SizedBox(height: 32,),

                  ///main dish
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: LIGHT_GREY_COLOR,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      EATING_MAIN_DISH_FREQUENCY,
                      style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (_isCustomNumberMainDishSelected)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                         TextField(
                           controller: _mainDishTimesController,
                           inputFormatters: <TextInputFormatter>[
                             FilteringTextInputFormatter.digitsOnly
                           ],
                           keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                           decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            // Border color when the field is focused
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isCustomNumberMainDishSelected = false;
                            });
                          },
                          child: const Text(
                            SELECT_ANSWER,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              color: DARK_PRIMARY_COLOR,
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _buildNumberOfMainDishChoiceChip(1),
                            _buildNumberOfMainDishChoiceChip(2),
                          ],
                        ),
                        // const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _buildNumberOfMainDishChoiceChip(3),
                            _buildNumberOfMainDishChoiceChip(4),
                          ],
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isCustomNumberMainDishSelected = true;
                            });
                          },
                          child: const Text(
                            ENTER_MANUALLY,
                            style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              color: DARK_PRIMARY_COLOR,
                            ),
                          ),
                        ),
                      ],
                    ),


                  const SizedBox(height: 48,),

                  ///side dish
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: LIGHT_GREY_COLOR,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      EATING_SIDE_DISH_FREQUENCY,
                      style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (_isCustomNumberSideDishSelected)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                         TextField(
                          controller: _sideDishTimesController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            // Border color when the field is focused
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                            ),
                          ),
                           inputFormatters: <TextInputFormatter>[
                             FilteringTextInputFormatter.digitsOnly
                           ],
                           keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isCustomNumberSideDishSelected = false;
                            });
                          },
                          child: const Text(
                            SELECT_ANSWER,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              color: DARK_PRIMARY_COLOR,
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _buildNumberOfSideDishChoiceChip(1),
                            _buildNumberOfSideDishChoiceChip(2),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _buildNumberOfSideDishChoiceChip(3),
                            _buildNumberOfSideDishChoiceChip(4),
                          ],
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isCustomNumberSideDishSelected = true;
                            });
                          },
                          child: const Text(
                            ENTER_MANUALLY,
                            style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              color: DARK_PRIMARY_COLOR,
                            ),
                          ),
                        ),
                      ],
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
          )
        ],
      ),
    );
  }

  Widget _buildNumberOfMainDishChoiceChip(int value) {
    return ChoiceChip(
      label: SizedBox(width: 70, child: Text(value.toString(), style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 14), textAlign: TextAlign.center,),),
      selected: _selectedMainDishChoice == value,
      selectedColor: MASTERPIE_YELLOW_COLOR,
      showCheckmark: false,
      onSelected: (bool? selected) {
        setState(() {

          if(selected != null){
            _selectedMainDishChoice = selected ? value : 3;
          }else{
            _selectedMainDishChoice= 3;
          }

          _mainDishTimesController.text= _selectedMainDishChoice.toString();
          _updateMainDishType('');
        });
      },
    );
  }


  Widget _buildNumberOfSideDishChoiceChip(int value) {
    return ChoiceChip(
      label: SizedBox(width: 70, child: Text(value.toString(), style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 14), textAlign: TextAlign.center,),),
      selected: _selectedSideDishChoice == value,
      selectedColor: MASTERPIE_YELLOW_COLOR,
      showCheckmark: false,
      onSelected: (bool? selected) {
        setState(() {
          if(selected != null){
            _selectedSideDishChoice = selected ? value : 2;
          }else{
            _selectedSideDishChoice= 3;
          }

          _sideDishTimesController.text= _selectedSideDishChoice.toString();
          _updateSideDishType('');
        });
      },
    );
  }


  void _goToMainScreen(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(isFromOnboard: widget.isOnBoard),
      ),
    );
  }

 Widget skipBtn(){
   return Expanded(
     child: Visibility(
       visible: false,
       child: GestureDetector(
         onTap: (){
           _goToMainScreen();
         },
         child: const Text(
           SKIP_LABEL,
           style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
           textAlign: TextAlign.end,
         ),
       ),
     ),
   );
 }

}
