import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/presentation/screen/request_macro_wizard_step2_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/request_wizard_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/unit_options.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../domain/model/food_type.dart';
import '../../domain/model/logged_foods_model.dart';
import '../bloc/get_logged_foods_bloc/get_logged_foods_bloc.dart';
import '../bloc/get_logged_foods_bloc/state_event/get_logged_foods_state_event.dart';
import '../bloc/groceries_bloc/groceries_bloc.dart';
import '../bloc/groceries_bloc/state_event/groceries_state_event.dart';
import '../bloc/my_cook_book_foods_bloc/my_cook_book_foods_bloc.dart';
import '../bloc/my_cook_book_foods_bloc/state_event/my_cook_book_foods_state_event.dart';
import '../bloc/my_favorite_foods/my_favorite_foods_bloc.dart';
import '../bloc/my_favorite_foods/state_event/my_favorite_foods_state_event.dart';
import '../bloc/suggest_portion_bloc/state_event/suggest_portion_state_event.dart';
import '../bloc/suggest_portion_bloc/suggest_portion_bloc.dart';


const int MAX_CALORIES = 10000;
const int MAX_PROTEIN = 500;
const int MAX_CARB = 2000;
const int MAX_FAT = 5000;

class RequestMacroWizardStepOneScreen extends StatefulWidget {

  const RequestMacroWizardStepOneScreen({super.key});

  @override
  State<RequestMacroWizardStepOneScreen> createState() => _RequestMacroWizardStepOneScreenState();
}

class _RequestMacroWizardStepOneScreenState extends State<RequestMacroWizardStepOneScreen> {


  late TextEditingController _minCalorieGoalController;
  late TextEditingController _minProteinGoalController;
  late TextEditingController _minCarbGoalController;
  late TextEditingController _minFatGoalController;

  late TextEditingController _maxCalorieGoalController;
  late TextEditingController _maxProteinGoalController;
  late TextEditingController _maxCarbGoalController;
  late TextEditingController _maxFatGoalController;


  late GetLoggedFoodsBloc _getLoggedFoodsBloc;


  final List<String> _restrictionOptions= [NONE_LABEL, PORTION_MIN_CALORIE, PORTION_MAX_CALORIE, PORTION_MIN_PROTEIN, PORTION_MAX_PROTEIN,
    PORTION_MIN_CARB, PORTION_MAX_CARB, PORTION_MIN_FAT, PORTION_MAX_FAT];

  int _selectedRestrictionOption= -1;


  late RequestWizardArgumentModel _requestWizardArgumentModel;

  @override
  void initState() {
    super.initState();
    _minCalorieGoalController= TextEditingController(text: '0');
    _minProteinGoalController= TextEditingController(text: '0');
    _minCarbGoalController= TextEditingController(text: '0');
    _minFatGoalController= TextEditingController(text: '0');
    _maxCalorieGoalController= TextEditingController(text: '0');
    _maxProteinGoalController= TextEditingController(text: '0');
    _maxCarbGoalController= TextEditingController(text: '0');
    _maxFatGoalController= TextEditingController(text: '0');
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();
    _requestWizardArgumentModel= RequestWizardArgumentModel();
    requestLoggedFoods();
  }

  void requestLoggedFoods(){
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    _getLoggedFoodsBloc.add(
        GetLoggedFoodsEvent.onGetImmediateLoggedFoods(formattedDate)
    );
  }


  void setMacroGoalsInScreen(LoggedFoods loggedFoods){
    double totalTakenCalories= 0;
    double totalTakenProteins= 0;
    double totalTakenCarbs= 0;
    double totalTakenFats= 0;
    loggedFoods.foods.forEach((element) {
      double calorie= 0;
      double protein= 0;
      double carb= 0;
      double fat= 0;

      element.calorie.forEach((cal) {
        calorie= calorie + double.parse(cal);
      });
      element.protein.forEach((prot) {
        protein= protein + double.parse(prot);
      });
      element.carb.forEach((car) {
        carb= carb + double.parse(car);
      });
      element.fat.forEach((fats) {
        fat= fat + double.parse(fats);
      });
      double foodCalorie= calorie * element.count;
      double foodProtein= protein * element.count;
      double foodCarb= carb * element.count;
      double foodFat= fat * element.count;

      totalTakenCalories= totalTakenCalories+ foodCalorie;
      totalTakenProteins= totalTakenProteins+ foodProtein;
      totalTakenCarbs= totalTakenCarbs+ foodCarb;
      totalTakenFats= totalTakenFats+ foodFat;

    });
    setState(() {

      int remainedCalorie= (loggedFoods.goals[0] - totalTakenCalories).toInt();
      int remainedProtein= (loggedFoods.goals[1] - totalTakenProteins).toInt();
      int remainedCarb= (loggedFoods.goals[2] - totalTakenCarbs).toInt();
      int remainedFat= (loggedFoods.goals[3] - totalTakenFats).toInt();

      if(remainedCalorie <= 0){
        remainedCalorie = 0;
      }

      if(remainedProtein <= 0){
        remainedProtein = 0;
      }

      if(remainedCarb <= 0){
        remainedCarb = 0;
      }

      if(remainedFat <= 0){
        remainedFat = 0;
      }

      _minCalorieGoalController.text = '${(4/5 * remainedCalorie).toInt()}';
      _minProteinGoalController.text = '${(4/5 * remainedProtein).toInt()}';
      _minCarbGoalController.text = '${(4/5 * remainedCarb).toInt()}';
      _minFatGoalController.text = '${(4/5 * remainedFat).toInt()}';

      _maxCalorieGoalController.text = '${(6/5 * remainedCalorie).toInt()}';
      _maxProteinGoalController.text = '${(6/5 * remainedProtein).toInt()}';
      _maxCarbGoalController.text = '${(6/5 * remainedCarb).toInt()}';
      _maxFatGoalController.text = '${(6/5 * remainedFat).toInt()}';

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(HOW_MUCH_TO_EAT, style: TextStyle(color: Colors.white)),
          backgroundColor: PRIMARY_COLOR,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24,
            ),
          ),
          actions: [
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              /// total macros
                              Container(
                                color: LIGHT_GREY_COLOR,
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('$TOTAL_MACRO_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

                                    const SizedBox(height: 8,),

                                    calorieGoalRangeWidgets(),

                                    proteinGoalRangeWidgets(),

                                    carbGoalRangeWidgets(),

                                    fatGoalRangeWidgets()

                                  ],
                                ),
                              ),

                              const SizedBox(height: 16,),

                              /// restriction
                              restrictionWidgets(),
                            ],
                          ),
                        )
                    ),

                    /// request portions
                    nextButton(),

                  ],
                ),

                BlocConsumer<GetLoggedFoodsBloc, GetLoggedFoodsState>(
                    builder: (mcontext, state) {

                      if (state is GetLoggedFoodsLoadingState) {
                        return const GFLoader(
                          type: GFLoaderType.circle,
                          loaderColorOne: DARK_PRIMARY_COLOR,
                          loaderColorTwo: DARK_PRIMARY_COLOR,
                          loaderColorThree: DARK_PRIMARY_COLOR,
                        );
                      }else if(state is GetImmediateLoggedFoodsState){
                        Future.delayed(Duration.zero,(){
                          _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
                          setMacroGoalsInScreen(state.loggedFoods);
                        });
                      }else if(state is GetLoggedFoodsErrorState){
                        _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
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
            )
        ),
      ),
    );
  }


  Widget restrictionWidgets(){
    return Container(
      width: double.infinity,
      color: TOTAL_MACRO_RESTRICTION_BACKGROUND_COLOR,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text('$RESTRICTION_LABEL($OPTIONAL_LABEL):', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

          const SizedBox(height: 4,),

          const Text(
            ASK_RETRICTION_FOOD_PORTION,
            style: TextStyle(fontSize: 12),
            // overflow: TextOverflow.ellipsis,
          ),

          Column(
            children: _restrictionOptions
                .asMap()
                .entries
                .map(
                  (entry) {
                return RadioListTile(
                  contentPadding: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
                  title: Text(entry.value, style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 12, fontFamily: MONTSERRAT_FONT)),
                  value: entry.key,
                  activeColor: DARK_PRIMARY_COLOR,
                  groupValue: _selectedRestrictionOption,
                  onChanged: (value) {
                    bool isEnabled= false;
                    switch(value){
                      case 0:
                        isEnabled= true;
                        break;
                      case 1:
                        if(_minCalorieGoalController.text.isNotEmpty && _minCalorieGoalController.text != '0' &&
                            _maxCalorieGoalController.text.isNotEmpty && _minCalorieGoalController.text != '0'){
                          isEnabled = true;
                        }else{
                          showErrorToast(context,ERROR_RESTRICTION_CALORIE);
                        }
                        break;
                      case 2:
                        if(_minCalorieGoalController.text.isNotEmpty && _minCalorieGoalController.text != '0' &&
                            _maxCalorieGoalController.text.isNotEmpty && _minCalorieGoalController.text != '0'){
                          isEnabled = true;
                        }else{
                          showErrorToast(context,ERROR_RESTRICTION_CALORIE);
                        }
                        break;
                      case 3:
                        if(_minProteinGoalController.text.isNotEmpty && _minProteinGoalController.text != '0' &&
                            _maxProteinGoalController.text.isNotEmpty && _minProteinGoalController.text != '0'){
                          isEnabled = true;
                        }else{
                          showErrorToast(context,ERROR_RESTRICTION_PROTEIN);
                        }
                        break;
                      case 4:
                        if(_minProteinGoalController.text.isNotEmpty && _minProteinGoalController.text != '0' &&
                            _maxProteinGoalController.text.isNotEmpty && _minProteinGoalController.text != '0'){
                          isEnabled = true;
                        }else{
                          showErrorToast(context,ERROR_RESTRICTION_PROTEIN);
                        }
                        break;
                      case 5:
                        if(_minCarbGoalController.text.isNotEmpty && _minCarbGoalController.text != '0' &&
                            _maxCarbGoalController.text.isNotEmpty && _minCarbGoalController.text != '0'){
                          isEnabled = true;
                        }else{
                          showErrorToast(context,ERROR_RESTRICTION_CARB);
                        }
                        break;
                      case 6:
                        if(_minCarbGoalController.text.isNotEmpty && _minCarbGoalController.text != '0' &&
                            _maxCarbGoalController.text.isNotEmpty && _minCarbGoalController.text != '0'){
                          isEnabled = true;
                        }else{
                          showErrorToast(context,ERROR_RESTRICTION_CARB);
                        }
                        break;
                      case 7:
                        if(_minFatGoalController.text.isNotEmpty && _minFatGoalController.text != '0' &&
                            _maxFatGoalController.text.isNotEmpty && _minFatGoalController.text != '0'){
                          isEnabled = true;
                        }else{
                          showErrorToast(context,ERROR_RESTRICTION_FAT);
                        }
                        break;
                      case 8:
                        if(_minFatGoalController.text.isNotEmpty && _minFatGoalController.text != '0' &&
                            _maxFatGoalController.text.isNotEmpty && _minFatGoalController.text != '0'){
                          isEnabled = true;
                        }else{
                          showErrorToast(context,ERROR_RESTRICTION_FAT);
                        }
                        break;
                    }
                    if(isEnabled){
                      setState(() {
                        _selectedRestrictionOption = value ?? -1;
                      });
                    }
                  },
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }

  Widget nextButton(){
    return Container(
            padding: const EdgeInsets.only(bottom: 24),
            width: double.infinity,
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: DARK_PRIMARY_COLOR
            ),
            onPressed: () {
              List<List<double>> macroGoalsRange= [];
              double minCalorie= _minCalorieGoalController.text.isEmpty ? 0.0 : double.parse(_minCalorieGoalController.text);
              double minProtein= _minProteinGoalController.text.isEmpty ? 0.0 : double.parse(_minProteinGoalController.text);
              double minCarb= _minCarbGoalController.text.isEmpty ? 0.0 : double.parse(_minCarbGoalController.text);
              double minFat= _minFatGoalController.text.isEmpty ? 0.0 : double.parse(_minFatGoalController.text);

              double maxCalorie= _maxCalorieGoalController.text.isEmpty ? 0.0 : double.parse(_maxCalorieGoalController.text);
              double maxProtein= _maxProteinGoalController.text.isEmpty ? 0.0 : double.parse(_maxProteinGoalController.text);
              double maxCarb= _maxCarbGoalController.text.isEmpty ? 0.0 : double.parse(_maxCarbGoalController.text);
              double maxFat= _maxFatGoalController.text.isEmpty ? 0.0 : double.parse(_maxFatGoalController.text);


              if(minCalorie == 0.0 && maxCalorie == 0.0 &&
                minProtein == 0.0 && maxProtein == 0.0 &&
                minCarb == 0.0 && maxCarb == 0.0 &&
                minFat == 0.0 && maxFat == 0.0){
                showErrorToast(context, ERROR_NO_GOAL);
                return;
              }


              if(minCalorie >= MAX_CALORIES || maxCalorie >= MAX_CALORIES){
                showErrorToast(context, ERROR_MAX_CALORIE);
                return;
              }

              if(minProtein >= MAX_PROTEIN || maxProtein >= MAX_PROTEIN ){
                showErrorToast(context, ERROR_MAX_PROTEIN);
                return;
              }

              if(minCarb >= MAX_CARB|| maxCarb >= MAX_CARB){
                showErrorToast(context, ERROR_MAX_CARB);
                return;
              }

              if(minFat >= MAX_FAT || maxFat >= MAX_FAT){
                showErrorToast(context, ERROR_MAX_FAT);
                return;
              }

              if(maxCalorie == 0){
                maxCalorie= MAX_CALORIES.toDouble();
              }
              if(maxProtein == 0){
                maxProtein= MAX_PROTEIN.toDouble();
              }

              if(maxCarb == 0){
                maxCarb = MAX_CARB.toDouble();
              }

              if(maxFat == 0){
                maxFat = MAX_FAT.toDouble();
              }

              macroGoalsRange.add(maxCalorie > minCalorie ? [minCalorie, maxCalorie] : [maxCalorie, minCalorie]);
              macroGoalsRange.add(maxProtein > minProtein ? [minProtein, maxProtein] : [maxProtein, minProtein]);
              macroGoalsRange.add(maxCarb > minCarb ? [minCarb, maxCarb] : [maxCarb, minCarb]);
              macroGoalsRange.add(maxFat > minFat ? [minFat, maxFat] : [maxFat, minFat]);

              List<String> restriction= [];
              if(_selectedRestrictionOption != -1 && _selectedRestrictionOption != 0){
                switch(_selectedRestrictionOption){
                  case 1:
                    restriction= ['0', 'min'];
                    break;
                  case 2:
                    restriction= ['0', 'max'];
                    break;
                  case 3:
                    restriction= ['1', 'min'];
                    break;
                  case 4:
                    restriction= ['1', 'max'];
                    break;
                  case 5:
                    restriction= ['2', 'min'];
                    break;
                  case 6:
                    restriction= ['2', 'max'];
                    break;
                  case 7:
                    restriction= ['3', 'min'];
                    break;
                  case 8:
                    restriction= ['3', 'max'];
                    break;
                }
              }

              _requestWizardArgumentModel = _requestWizardArgumentModel.copyWith(
                  restriction: restriction,
                macroGoalRanges: macroGoalsRange
              );


              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RequestMacroWizardStepTwoScreen(requestWizardArgumentModel: _requestWizardArgumentModel)),
              ).then((result) {
                setState(() {
                  _requestWizardArgumentModel= result;
                });
              });
            },

            child: const Text(NEXT_LABEL, style: TextStyle( color: Colors.white),),
        ),
      );
  }


  Widget calorieGoalRangeWidgets(){
    return Column(
      children: [
        /// calorie
        const SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _minCalorieGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
                ],
                decoration: const InputDecoration(
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
              ),
            ),
            const SizedBox(width: 16,),

            const SizedBox(
              width: MACRO_SIZE_WIDTH,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '$CALORIE_RANGE_LABEL',
                  style: TextStyle(
                    color: DARK_PRIMARY_COLOR,
                    fontWeight: FontWeight.bold,
                    fontSize: FONT_HEADER,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16,),


            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _maxCalorieGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
                ],
                decoration: const InputDecoration(
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
              ),
            ),

          ],
        ),
      ],
    );
  }
  Widget proteinGoalRangeWidgets(){
    return Column(
      children: [

        const SizedBox(height: 12,),

        /// protein
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _minProteinGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
                ],
                decoration: const InputDecoration(
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
              ),
            ),
            const SizedBox(width: 16,),

            const SizedBox(
              width: MACRO_SIZE_WIDTH,
              child: Align(
                alignment: Alignment.center,
                  child: Text('$PROTEIN_RANGE_LABEL', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
              ),
            ),

            const SizedBox(width: 16,),

            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _maxProteinGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
                ],
                decoration: const InputDecoration(
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
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget carbGoalRangeWidgets(){
    return Column(
      children: [

        const SizedBox(height: 12,),

        ///  carb
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _minCarbGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
                ],
                decoration: const InputDecoration(
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
              ),
            ),

            const SizedBox(width: 16,),

            const SizedBox(
              width: MACRO_SIZE_WIDTH,
              child: Align(
                alignment: Alignment.center,
                  child: Text('$CARB_RANGE_LABEL', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
              ),
            ),

            const SizedBox(width: 16,),

            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _maxCarbGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
                ],
                decoration: const InputDecoration(
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
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget fatGoalRangeWidgets(){
    return Column(
      children: [

        const SizedBox(height: 12,),

        ///  fat
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _minFatGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
                ],
                decoration: const InputDecoration(
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
              ),
            ),
            const SizedBox(width: 16,),

            const SizedBox(
              width: MACRO_SIZE_WIDTH,
              child: Align(
                alignment: Alignment.center,
                  child: Text('$FAT_RANGE_LABEL', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
              ),
            ),

            const SizedBox(width: 16,),

            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _maxFatGoalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(numericRegExp),
                ],
                decoration: const InputDecoration(
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
              ),
            ),

          ],
        ),
      ],
    );
  }


}
