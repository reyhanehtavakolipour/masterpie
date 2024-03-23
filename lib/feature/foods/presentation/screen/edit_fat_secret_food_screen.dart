import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/debouncer.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/generic_food_detail_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/unit_options.dart';
import '../../../../main_screen.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../data/repository_impl/foods_repository_impl.dart';
import '../../domain/model/food_model.dart';
import '../../domain/model/food_type.dart';
import '../bloc/add_or_update_my_favorite_bloc/add_or_update_my_favorite_bloc.dart';
import '../bloc/add_or_update_my_favorite_bloc/state_event/add_or_update_my_favorite_state_event.dart';
import '../bloc/get_logged_foods_bloc/get_logged_foods_bloc.dart';
import '../bloc/get_logged_foods_bloc/state_event/get_logged_foods_state_event.dart';
import '../bloc/log_foods_bloc/log_foods_bloc.dart';
import '../bloc/log_foods_bloc/state_event/log_foods_state_event.dart';



class EditFatSecretFoodScreen extends StatefulWidget {

  final GenericFoodDetailArgumentModel foodDetailArgumentModel;

  const EditFatSecretFoodScreen({super.key, required this.foodDetailArgumentModel});

  @override
  State<EditFatSecretFoodScreen> createState() => _EditFatSecretFoodScreenState();
}

class _EditFatSecretFoodScreenState extends State<EditFatSecretFoodScreen> {

  /// for whole meal OR grocery,
   /// groceries: the first(the only item in the list) element is the value
   late TextEditingController _totalCalorieController;
   late TextEditingController _totalProteinController;
   late TextEditingController _totalCarbController;
   late TextEditingController _totalFatController;
   late TextEditingController _totalServingController;
   late TextEditingController _totalUnitController;
   GenericFood _initialStateFood = GenericFood();
   final _debouncer = Debouncer(milliseconds: 1000);
   double _previousoefficient= 1.0;

   Color _ingredientNameBorderColor = DARK_PRIMARY_COLOR;

   late TextEditingController _groceryNameController;

   int _selectedUnitIndex = 0;
   List<String> _groceryUnitOptions = manualUnitOptions;

   GenericFood newFood = GenericFood();
  late AddOrUpdateMyFavoriteBloc _addOrUpdateMyFavoriteBloc;
   late GetLoggedFoodsBloc _getLoggedFoodsBloc;
   late LogFoodsBloc _logFoodsBloc;

   bool _updatebuttonClicked= false;


  @override
  void initState() {
    super.initState();
    _addOrUpdateMyFavoriteBloc = context.read<AddOrUpdateMyFavoriteBloc>();
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();
    _logFoodsBloc = context.read<LogFoodsBloc>();
    _addOrUpdateMyFavoriteBloc.add(
      const AddOrUpdateMyFavoriteEvent.onReset(),
    );
    _totalCalorieController= TextEditingController(text: '0');
    _totalProteinController= TextEditingController(text: '0');
    _totalCarbController= TextEditingController(text: '0');
    _totalFatController= TextEditingController(text: '0');
    _totalServingController= TextEditingController(text: '100');
    _totalUnitController= TextEditingController(text: 'g');
    _groceryNameController= TextEditingController();
    init();
    _totalServingController.addListener(_onTotalServingChanged);
  }


   void _onTotalServingChanged() {
     setState(() {

     });
     _debouncer.run(() {
       if(newFood.foodType.name == MEAL_LABEL){
         // setState(() {
         //   double coefficient = num.parse(_totalServingController.text)/_initialStateFood.servingAmount;
         //   List<String> servingIngredientsCount = [];
         //   List<String> currentServingIngredientsCount = List<String>.from(newFood.servingIngredientsCount);
         //   currentServingIngredientsCount.forEach((element) {
         //     servingIngredientsCount.add((double.parse(element)*_previousCoefficient*coefficient).toString());
         //   });
         //
         //   newFood= newFood.copyWith(
         //       servingIngredientsCount: servingIngredientsCount,
         //       calorie: _initialStateFood.calorie,
         //       protein: _initialStateFood.protein,
         //       carb: _initialStateFood.carb,
         //       fat: _initialStateFood.fat
         //   );
         //   _previousCoefficient= 1/coefficient;
         //   calculateTotalMacros();
         // });
       }else{
         setState(() {
           double count = num.parse(_totalServingController.text)/double.parse(_initialStateFood.servingAmounts[0][_selectedUnitIndex]);
           _totalCalorieController = TextEditingController(text: '${double.parse(_initialStateFood.calorie[0][_selectedUnitIndex]) * count}');
           _totalProteinController = TextEditingController(text: '${double.parse(_initialStateFood.protein[0][_selectedUnitIndex]) * count}');
           _totalCarbController = TextEditingController(text: '${double.parse(_initialStateFood.carb[0][_selectedUnitIndex]) * count}');
           _totalFatController = TextEditingController(text: '${double.parse(_initialStateFood.fat[0][_selectedUnitIndex]) * count}');
         });
       }
     });
   }


   void requestLoggedFoods(){
     String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
     _getLoggedFoodsBloc.add(
         GetLoggedFoodsEvent.onGetImmediateLoggedFoods(formattedDate)
     );
   }

   void logFoodsOfToday(List<Food> foodsLoggedBefore){
     List<Food> foods = [];
     foods.addAll(foodsLoggedBefore);
     if(newFood.foodType.name == GROCERY_LABEL){
       foods.add(
         Food(
             id: newFood.id,
             calorie: [_totalCalorieController.text],
             protein: [_totalProteinController.text],
             carb: [_totalCarbController.text],
             fat: [_totalFatController.text],
             servingAmounts: [_totalServingController.text],
             units: [newFood.servingAmounts[0][_selectedUnitIndex]],
             foodType: FoodType.groceryProduct,
             count: newFood.count,
             name: _groceryNameController.text
         )
       );
     }else{

     }
     _logFoodsBloc.add(
         LogFoodsEvent.onLogFoods(foods)
     );
   }

   void handleMealMacrosWithoutIngredient(){
     if(newFood.foodType == FoodType.meal && newFood.ingredients.isEmpty){
       String calorie= newFood.calorie.isEmpty ? '0.0' : newFood.calorie[0][0];
       String protein= newFood.protein.isEmpty ? '0.0' : newFood.protein[0][0];
       String carb= newFood.carb.isEmpty ? '0.0' : newFood.carb[0][0];
       String fat= newFood.fat.isEmpty ? '0.0' : newFood.fat[0][0];

       _totalCalorieController = TextEditingController(text: calorie);
       _totalProteinController = TextEditingController(text: protein);
       _totalCarbController = TextEditingController(text: carb);
       _totalFatController = TextEditingController(text: fat);
     }
   }

@override
  Widget build(BuildContext context) {
    handleMealMacrosWithoutIngredient();
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(FOOD_DETAIL_LABEL, style: TextStyle(color: Colors.white),),
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
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  newGrocery(),

                  const SizedBox(height: 16,),


                  const Text('$TOTAL_MACRO_LABEL:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

                  const SizedBox(height: 16,),

                  /// total macros
                  macroAmountsWidgets(_totalServingController, _totalCalorieController, _totalProteinController, _totalCarbController, _totalFatController, _totalUnitController, true),

                  const SizedBox(height: 36,),

                  /// button
                  buildBottomButton(context),


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
                          if(_updatebuttonClicked){
                            _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
                            Future.delayed(Duration.zero,(){
                              logFoodsOfToday(state.loggedFoods.foods);
                            });
                          }
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


                  BlocConsumer<LogFoodsBloc, LogFoodsState>(
                      builder: (mcontext, state) {
                        if (state is LogFoodsLoadingState) {
                          return const GFLoader(
                            type: GFLoaderType.circle,
                            loaderColorOne: DARK_PRIMARY_COLOR,
                            loaderColorTwo: DARK_PRIMARY_COLOR,
                            loaderColorThree: DARK_PRIMARY_COLOR,
                          );
                        }else if(state is LogFoodsLoadedState){
                          if(_updatebuttonClicked){
                            _logFoodsBloc.add(const LogFoodsEvent.onReset());
                            Future.delayed(Duration.zero,(){
                              _updatebuttonClicked= false;
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ), (route) => false);
                            });
                          }
                        }else if(state is LogFoodsErrorState){
                          _logFoodsBloc.add(const LogFoodsEvent.onReset());
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
            )
        ),
      ),
    );
  }


  void init(){
    _groceryNameController.text = widget.foodDetailArgumentModel.food!.name;
    _totalServingController.text = widget.foodDetailArgumentModel.food!.servingAmounts[0][0];
    _totalCalorieController.text = widget.foodDetailArgumentModel.food!.calorie[0][0];
    _totalProteinController.text = widget.foodDetailArgumentModel.food!.protein[0][0];
    _totalCarbController.text = widget.foodDetailArgumentModel.food!.carb[0][0];
    _totalFatController.text = widget.foodDetailArgumentModel.food!.fat[0][0];
    _totalUnitController.text = widget.foodDetailArgumentModel.food!.units[0][0];
    newFood = widget.foodDetailArgumentModel.food!;
    _groceryUnitOptions= newFood.units[0];
    _initialStateFood= newFood;
  }


  Widget buildBottomButton(BuildContext context){
     return Column(
       children: [
         Container(
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
                 bottomButtonClickListener(context);
               },
               child: const Text(ADD_TO_MY_FAVORTITE,
                 style: TextStyle( color: Colors.white),)
           ),
         ),
         BlocConsumer<AddOrUpdateMyFavoriteBloc, AddOrUpdateMyFavoriteState>(
             builder: (mcontext, state) {
               if (state is AddOrUpdateMyFavoriteLoadingState) {
                 return const Stack(
                   children: [
                     GFLoader(
                       type: GFLoaderType.circle,
                       loaderColorOne: DARK_PRIMARY_COLOR,
                       loaderColorTwo: DARK_PRIMARY_COLOR,
                       loaderColorThree: DARK_PRIMARY_COLOR,
                     ),
                   ],
                 );
               }else if(state is AddOrUpdateMyFavoriteLoadedState){
                 Future.delayed(Duration.zero,(){
                   _addOrUpdateMyFavoriteBloc.add(const AddOrUpdateMyFavoriteEvent.onReset());
                   showSuccessToast(context, FOOD_ADDED_TO_FAVORITE_MSG);
                 });
               }else if(state is AddOrUpdateMyFavoriteErrorState){
                 _addOrUpdateMyFavoriteBloc.add(const AddOrUpdateMyFavoriteEvent.onReset());
                 Future.delayed(Duration.zero,(){
                   if(state.message == ERROR_FREE_USER_FAVORITE_FOOD_NOT_ALLOWED){
                     return showUpgradePopupForFreeUsers(context, UPGRADE_MSG_FAVORITE_FOOD);
                   }
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
     );
  }


  void bottomButtonClickListener(BuildContext context){
       if(_groceryNameController.text.isEmpty){
         setState(() {
           _ingredientNameBorderColor = Colors.red;
         });
         return;
       }
       setState(() {
         _ingredientNameBorderColor = Colors.black;
       });
       requestOperationOnFood(context);
  }


  void requestOperationOnFood(BuildContext context){
    if(newFood.foodType.name == GROCERY_LABEL){
      _addOrUpdateMyFavoriteBloc.add(
        AddOrUpdateMyFavoriteEvent.onAddOrUpdateMyFavorite(
            Food(
                id: newFood.id,
                calorie: [_totalCalorieController.text.isEmpty ? '0.0' : _totalCalorieController.text],
                protein: [_totalProteinController.text.isEmpty ? '0.0' : _totalProteinController.text],
                carb: [_totalCarbController.text.isEmpty ? '0.0' : _totalCarbController.text],
                fat: [_totalFatController.text.isEmpty ? '0.0' : _totalFatController.text],
                servingAmounts: [_totalServingController.text.isEmpty ? '1.0' : _totalServingController.text],
                units: [newFood.servingAmounts[0][_selectedUnitIndex]],
                foodType: FoodType.groceryProduct,
                count: newFood.count,
                name: _groceryNameController.text
            )
        ),
      );
    }else{

    }
  }

   Widget groceryUnitDropDown(){
     return  SizedBox(
       width: MACRO_DROP_DOWN_WIDTH,
       height: MACRO_DROP_DOWN_HEIGHT,
       child: DropdownButtonHideUnderline(
         child: ButtonTheme(
           alignedDropdown: true,
           child: DropdownButton(
             isExpanded: true,
             value: _groceryUnitOptions[_selectedUnitIndex],
             items: _groceryUnitOptions.map((String item) {
               return DropdownMenuItem<String>(
                 value: item,
                 child: Text(item, style: const TextStyle(fontSize: 12),),
               );
             }).toList(),
             onChanged: (String? newValue){
               setState(() {
                 int selectedIndex = 0;
                 for (int i = 0; i < _groceryUnitOptions.length; i++){
                   if(newValue.toString() == _groceryUnitOptions[i]){
                     selectedIndex = i;
                   }
                 }
                 _selectedUnitIndex = selectedIndex;
                 _totalServingController = TextEditingController(text: _initialStateFood.servingAmounts[0][_selectedUnitIndex].toString());
                 _totalCalorieController = TextEditingController(text: _initialStateFood.calorie[0][_selectedUnitIndex].toString());
                 _totalProteinController = TextEditingController(text: _initialStateFood.protein[0][_selectedUnitIndex].toString());
                 _totalCarbController = TextEditingController(text: _initialStateFood.carb[0][_selectedUnitIndex].toString());
                 _totalFatController = TextEditingController(text: _initialStateFood.fat[0][_selectedUnitIndex].toString());
                 _totalServingController.addListener(_onTotalServingChanged);
               });

             },
             // style: Theme.of(context).textTheme.title,
           ),
         ),
       ),
     );
   }

  Widget macroAmountsWidgets(TextEditingController servingController,TextEditingController calorieController,
      TextEditingController proteinController,TextEditingController carbController,TextEditingController fatController, TextEditingController unitController, bool isTotal){

    return Column(
      children: [
        ///  serving + unit
        Row(
          children: [
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$SERVING_AMOUNT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: servingController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
              ),
            ),
            const SizedBox(width: 20,),
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$UNIT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),


            groceryUnitDropDown()

          ],
        ),
        const SizedBox(height: 4,),

        /// total calorie + protein
        Row(
          children: [
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$CALORIE_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: calorieController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
              ),
            ),
            const SizedBox(width: 20,),
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$PROTEIN_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: proteinController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12,),

        /// total carb + fat
        Row(
          children: [
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$CARB_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: carbController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
              ),
            ),
            const SizedBox(width: 20,),
            const SizedBox(
                width: MACRO_TITLE_WIDTH,
                child: Text('$FAT_LABEL:', style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: FONT_HEADER),)
            ),
            const SizedBox(width: 4,),
            SizedBox(
              width: MACRO_WIDTH,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: fatController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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
                style: const TextStyle(color: DARK_PRIMARY_COLOR),
              ),
            ),
          ],
        ),

      ],
    );
  }


  Widget newGrocery(){
     return TextField(
       controller: _groceryNameController,
       decoration:  InputDecoration(
         hintText: CHEDDAR_CHEESE_LABEL,
         border: OutlineInputBorder(
           borderSide: BorderSide(color: _ingredientNameBorderColor),
         ),
         enabledBorder: OutlineInputBorder(
           borderSide: BorderSide(color: _ingredientNameBorderColor),
         ),
         focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(color: _ingredientNameBorderColor, width: 2),
         ),
         contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
       ),
       style: const TextStyle(color: DARK_PRIMARY_COLOR),
     );
  }


  void updateSelectedFoodType(String type){

  }

}
