import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/domain/model/fat_secret_foods_info_model.dart';
import 'package:masterpie/feature/foods/presentation/bloc/get_fat_secret_foods_info_bloc/get_fat_secret_foods_info_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/get_fat_secret_foods_info_bloc/state_event/get_fat_secret_foods_info_state_event.dart';
import 'package:masterpie/main_screen.dart';
import 'package:masterpie/util/design/color/app_colors.dart';

import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../../foods/presentation/screen/recie_types_popup.dart';
import '../../../foods/presentation/screen/ui_helper/custom_chips.dart';



class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  final PageController _pageController = PageController(initialPage: 0);

  int _currentPage = 0;


  late GetFatSecretFoodsInfoBloc _getFatSecretFoodsInfoBloc;

  FatSecretFoodsInfo _fatSecretFoodsInfo= FatSecretFoodsInfo();

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


  // form
  final _weightController = TextEditingController();

  final _ageController = TextEditingController();

  final _heightController = TextEditingController();

  final _goalWeightController = TextEditingController();


  String _heightSelectedUnit = FT_LABEL;
  String _weightSelectedUnit = LB_LABEL;
  String _activitySelected = SEDENTARY_LABEL;
  String _genderSelected = FEMALE_LABEL;



  @override
  void initState() {
    super.initState();
    _getFatSecretFoodsInfoBloc = context.read<GetFatSecretFoodsInfoBloc>();
    _mainDishTimesController= TextEditingController(text: '3');
    _sideDishTimesController= TextEditingController(text: '2');
    _updateMainDishType('');
    _updateSideDishType('');
    _requestFatSecretFoodsInfo();
    _setEditTextsListener();
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
                  _selectFavoriteCategories(),

                  /// step4
                  _selectHateCategories(),

                  /// step 5
                  _selectAllergens(),

                  /// step6
                  _fillForm()

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
            BlocConsumer<GetFatSecretFoodsInfoBloc, GetFatSecretFoodsInfoState>(
                builder: (mcontext, state) {
                  if(state is FatSecretFoodInfoLoadedState){
                    Future.delayed(Duration.zero,(){
                      _getFatSecretFoodsInfoBloc.add(const GetFatSecretFoodsInfoEvent.onReset());
                      _fatSecretFoodsInfo= state.fatSecretFoodsInfo;
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
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
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
      if(int.parse(_mainDishTimesController.text) <= _mainDishesType.length){
        List<String> newList= [];
        for (int i = 1; i <= int.parse(_mainDishTimesController.text); i++) {
          if(i <=  int.parse(_mainDishTimesController.text)){
            newList.add(_mainDishesType[i-1]);
          }
        }
        _mainDishesType= newList;
      }else{
        List<String> newList= [];
        for (int i = 1; i <= int.parse(_mainDishTimesController.text); i++) {
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
      if(int.parse(_sideDishTimesController.text) <= _sideDishesType.length){
        List<String> newList= [];
        for (int i = 1; i <= int.parse(_sideDishTimesController.text); i++) {
          if(i <=  int.parse(_sideDishTimesController.text)){
            newList.add(_sideDishesType[i-1]);
          }
        }
        _sideDishesType= newList;
      }else{
        List<String> newList= [];
        for (int i = 1; i <= int.parse(_sideDishTimesController.text); i++) {
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

          Container(
            margin: const EdgeInsets.only(top: 48),
            height: 30,
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    '2/6',
                    style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
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

          Container(
            margin: const EdgeInsets.only(top: 48),
            height: 30,
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    '4/6',
                    style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
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
                const Expanded(
                  child: Text(
                    '6/6',
                    style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
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
                    _goToMainScreen();
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

          Container(
            margin: const EdgeInsets.only(top: 48),
            height: 30,
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    '5/6',
                    style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
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
          )
        ],
      ),
    );
  }


  Widget _selectFavoriteCategories(){
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
                const Expanded(
                  child: Text(
                    '3/6',
                    style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
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


  Widget _buildHateCategories(){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 24,
        children:  _fatSecretFoodsInfo.categories.map(
              (item) {
            return RawChip(
              backgroundColor: _hateCategories.contains(item) ? DARK_PRIMARY_COLOR : LIGHT_GREY_COLOR,
              onSelected: (bool selected) {
                setState(() {
                  if(selected){
                    _hateCategories.add(item);
                  }else{
                    _hateCategories.remove(item);
                  }
                });
              },
              deleteIconColor: LIGHT_GREY_COLOR,
              onDeleted: (){
                setState(() {
                  _hateCategories.remove(item);
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
        children:  _fatSecretFoodsInfo.allergens.map(
              (item) {
            return RawChip(
              backgroundColor: _allergens.contains(item) ? DARK_PRIMARY_COLOR : LIGHT_GREY_COLOR,
              onSelected: (bool selected) {
                setState(() {
                  if(selected){
                    _allergens.add(item);
                  }else{
                    _allergens.remove(item);
                  }
                });
              },
              deleteIconColor: LIGHT_GREY_COLOR,
              onDeleted: (){
                setState(() {
                  _allergens.remove(item);
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 24,
        children:  _fatSecretFoodsInfo.categories.map(
              (item) {
            return RawChip(
              backgroundColor: _favoriteCategories.contains(item) ? DARK_PRIMARY_COLOR : LIGHT_GREY_COLOR,
              onSelected: (bool selected) {
                setState(() {
                  if(selected){
                    _favoriteCategories.add(item);
                  }else{
                    _favoriteCategories.remove(item);
                  }
                });
              },
              deleteIconColor: LIGHT_GREY_COLOR,
              onDeleted: (){
                setState(() {
                  _favoriteCategories.remove(item);
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
          types: _fatSecretFoodsInfo.recipeTypes,
        );
      },
    );
    setState(() {
      _sideDishesType[index] = _fatSecretFoodsInfo.recipeTypes[selectedIndex];
    });
  }


  void _showAllRecipeTypesForMainDishes(int index) async{
    int selectedIndex = await showDialog(
      context: context,
      builder: (context) {
        return RecipeTypesPopup(
          types: _fatSecretFoodsInfo.recipeTypes,
        );
      },
    );

    setState(() {
      _mainDishesType[index] = _fatSecretFoodsInfo.recipeTypes[selectedIndex];
    });
  }

  Widget _numberOfMealsDuringDays(){
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [

          Container(
            margin: const EdgeInsets.only(top: 48),
            height: 30,
            child: Row(
              children: [
                const Expanded(
                    child: Text(
                      '1/6',
                      style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    ),
                ),

              skipBtn()

              ],
            ),
          ),

          const SizedBox(height: 24,),

          Padding(
              padding: const EdgeInsets.all(4),
              child: Image.asset(FEQUENT_EATING_PATH, width: 200, height: 200,)
          ),

          const SizedBox(height: 32,),


          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            // Border color when the field is focused
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: DARK_PRIMARY_COLOR),
                            ),
                          ),
                          keyboardType: TextInputType.number,
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
                          keyboardType: TextInputType.number,
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
      onSelected: (bool selected) {
        setState(() {
          _selectedMainDishChoice = (selected ? value : null)!;
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
      onSelected: (bool selected) {
        setState(() {
          _selectedSideDishChoice = (selected ? value : null)!;
          _sideDishTimesController.text= _selectedSideDishChoice.toString();
          _updateSideDishType('');
        });
      },
    );
  }


  void _goToMainScreen(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ),
    );
  }

 Widget skipBtn(){
   return Expanded(
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
   );
 }

  List<Widget> _buildWizardInstructionContent() {
    return [
      _buildPage(
        image: 'assets/images/healthy_food.svg',
        title: 'Welcome',
        description: 'This is the first page of the onboarding.',
      ),
      _buildPage(
        image: 'assets/images/meal.svg',
        title: 'Discover',
        description: 'Discover new features on the second page.',
      ),
      _buildPage(
        image: 'assets/images/start.svg',
        title: 'Get Started',
        description: 'Get started with the app on the third page.',
      ),
    ];
  }



  Widget _buildPage({required String image, required String title, required String description}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(image, width: 300),

        SizedBox(height: 20.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }


}
