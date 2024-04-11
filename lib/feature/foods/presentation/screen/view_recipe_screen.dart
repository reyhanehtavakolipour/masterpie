import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/presentation/bloc/add_or_update_my_cook_book_bloc/add_or_update_my_cook_book_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/add_or_update_my_cook_book_bloc/state_event/add_or_update_my_cook_book_state_event.dart';
import 'package:masterpie/feature/foods/presentation/bloc/get_recipe_bloc/get_recipe_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/get_recipe_bloc/state_event/get_recipe_state_event.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/generic_food_detail_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model_converter.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../data/repository_impl/foods_repository_impl.dart';
import '../../domain/model/food_model.dart';
import '../bloc/get_logged_foods_bloc/get_logged_foods_bloc.dart';
import '../bloc/get_logged_foods_bloc/state_event/get_logged_foods_state_event.dart';
import '../bloc/log_foods_bloc/log_foods_bloc.dart';
import '../bloc/log_foods_bloc/state_event/log_foods_state_event.dart';
import 'edit_recipe_screen.dart';


class ViewRecipeScreen extends StatefulWidget {

  final GenericFoodDetailArgumentModel foodDetailArgumentModel;

  const ViewRecipeScreen({super.key, required this.foodDetailArgumentModel});

  @override
  State<ViewRecipeScreen> createState() => _ViewRecipeScreenState();
}

class _ViewRecipeScreenState extends State<ViewRecipeScreen> {

  bool _isRecipeLoaded= false;

  String _totalCalorie= '';
  String _totalProtein= '';
  String _totalCarb= '';
  String _totalFat= '';
  String _totalServing= '';
  String _ingredients= '';
  String _foodName= '';
  String _recipe= '';

  late TextEditingController _foodCountController;

  GenericFood newFood = GenericFood();
  late AddOrUpdateMyCookBookBloc _addOrUpdateMyCookBookBloc;
  late GetRecipeBloc _getRecipeBloc;


  late GetLoggedFoodsBloc _getLoggedFoodsBloc;
  late LogFoodsBloc _logFoodsBloc;

  @override
  void initState() {
    super.initState();
    _addOrUpdateMyCookBookBloc = context.read<AddOrUpdateMyCookBookBloc>();
    _getRecipeBloc = context.read<GetRecipeBloc>();
    _getLoggedFoodsBloc = context.read<GetLoggedFoodsBloc>();
    _logFoodsBloc = context.read<LogFoodsBloc>();
    _foodCountController= TextEditingController(text: '1.0');
    _addOrUpdateMyCookBookBloc.add(const AddOrUpdateMyCookBookEvent.onReset(),);

    getRecipe();
  }

  void getRecipe(){
    _getRecipeBloc.add(
        GetRecipeEvent.onGetRecipe(widget.foodDetailArgumentModel.food!)
    );
  }

  void requestLoggedFoods(){
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    _getLoggedFoodsBloc.add(
        GetLoggedFoodsEvent.onGetLoggedFoods(formattedDate)
    );
  }

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
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
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.white,),
              onPressed: () {
                GenericFoodDetailArgumentModel argumentModel = GenericFoodDetailArgumentModel(food: newFood,
                    macroEdition: widget.foodDetailArgumentModel.macroEdition);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditRecipeScreen(foodDetailArgumentModel: argumentModel,),
                  ),
                );
              },
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Stack(
              children: [

                Visibility(
                  visible: _isRecipeLoaded,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [



                        const Text('$NAME_LABEL:', style: TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),),

                        const SizedBox(height: 4,),

                        Text(_foodName, style: const TextStyle(fontSize: 16, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),



                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const SizedBox(height: 16,),

                            const Text('$INGREDIENTS_LABEL:', style: TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),),

                            const SizedBox(height: 4,),


                            Text(_ingredients, style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),


                            const SizedBox(height: 16,),

                            const Text('$RECIPE_LABEL:', style: TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),),

                            const SizedBox(height: 4,),


                            Text(_recipe, style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),

                          ],
                        ),



                        const SizedBox(height: 32,),



                        const Text('$TOTAL_MACRO_LABEL:', style: TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),),


                        const SizedBox(height: 16,),

                        Row(
                          children: [
                            Text('${SERVING_LABEL.capitalize()}:', style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
                            const SizedBox(width: 4,),
                            Text(_totalServing, style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),
                          ],
                        ),

                        const SizedBox(height: 16,),


                        Row(
                          children: [
                            Expanded(
                                child: Row(
                                  children: [
                                    const Text('$CALORIE_LABEL:', style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
                                    const SizedBox(width: 4,),
                                    Text(_totalCalorie, style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),
                                  ],
                                )
                            ),
                            Expanded(
                                child: Row(
                                  children: [
                                    const Text('$PROTEIN_LABEL:', style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
                                    const SizedBox(width: 4,),
                                    Text(_totalProtein, style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),
                                  ],
                                )
                            ),
                          ],
                        ),


                        const SizedBox(height: 16,),


                        Row(
                          children: [
                            Expanded(
                                child: Row(
                                  children: [
                                    const Text('$CARB_LABEL:', style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
                                    const SizedBox(width: 4,),
                                    Text(_totalCarb, style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),
                                  ],
                                )
                            ),
                            Expanded(
                                child: Row(
                                  children: [
                                    const Text('$FAT_LABEL:', style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
                                    const SizedBox(width: 4,),
                                    Text(_totalFat, style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),
                                  ],
                                )
                            ),
                          ],
                        ),



                        const SizedBox(height: 32,),



                        ///add to cookbook button
                        buildAddToCookBookButton(context),

                        const SizedBox(height: 16,),


                        foodCount(),

                        const SizedBox(height: 16,),

                        ///log food button
                        buildLogFoodButton(context),
                      ],
                    ),
                  ),
                ),


                BlocConsumer<GetRecipeBloc, GetRecipeState>(
                    builder: (mcontext, state) {
                      if (state is GetRecipeLoadingState) {
                        return const GFLoader(
                          type: GFLoaderType.circle,
                          loaderColorOne: DARK_PRIMARY_COLOR,
                          loaderColorTwo: DARK_PRIMARY_COLOR,
                          loaderColorThree: DARK_PRIMARY_COLOR,
                        );
                      }else if(state is GetRecipeLoadedState){
                        _getRecipeBloc.add(const GetRecipeEvent.onReset());
                        Future.delayed(Duration.zero,(){
                          _isRecipeLoaded= true;
                          fillUi(state.food);
                        });
                      }else if(state is GetRecipeErrorState){
                        _getRecipeBloc.add(const GetRecipeEvent.onReset());
                        Future.delayed(Duration.zero,(){
                          return showErrorToast(context, state.message);
                        });
                      }
                      return Container();
                    },
                    listener: (context, state){

                    }
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
                      }else if(state is GetLoggedFoodsLoadedState){
                        _getLoggedFoodsBloc.add(const GetLoggedFoodsEvent.onReset());
                        Future.delayed(Duration.zero,(){
                          logFoodsOfToday(state.loggedFoods.foods);
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
                        _logFoodsBloc.add(const LogFoodsEvent.onReset());
                        Future.delayed(Duration.zero,(){
                          showSuccessToast(context, LOGGED_SUCCESSFULLY);
                        });
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
            )
        ),
      ),
    );
  }


  void fillUi(GenericFood genericFood){

    setState(() {
      double calorie = 0;
      for (int i = 0; i < genericFood.calorie.length; i++) {
        if (i < genericFood.servingIngredientsCount.length) {
          double servingCount = double.parse(
              genericFood.servingIngredientsCount[i].isEmpty ? '0' : genericFood.servingIngredientsCount[i][0]);
          calorie = calorie + double.parse(genericFood.calorie[i].isEmpty ? '0' : genericFood.calorie[i][0]) * servingCount;
        }
      }

      double protein = 0;
      for (int i = 0; i < genericFood.protein.length; i++) {
        if (i < genericFood.servingIngredientsCount.length) {
          double servingCount = double.parse(genericFood.servingIngredientsCount[i].isEmpty ? '0' : genericFood.servingIngredientsCount[i][0]);
          protein = protein + double.parse(genericFood.protein[i].isEmpty ? '0' : genericFood.protein[i][0]) * servingCount;
        }
      }

      double carb = 0;
      for (int i = 0; i < genericFood.carb.length; i++) {
        if (i < genericFood.servingIngredientsCount.length) {
          double servingCount = double.parse(genericFood.servingIngredientsCount[i].isEmpty ? '0' : genericFood.servingIngredientsCount[i][0]);
          carb = carb + double.parse(genericFood.carb[i].isEmpty ? '0' : genericFood.carb[i][0]) * servingCount;
        }
      }


      double fat = 0;
      for (int i = 0; i <
          genericFood.fat.length; i++) {
        if (i < genericFood.servingIngredientsCount.length) {
          double servingCount = double.parse(genericFood.servingIngredientsCount[i].isEmpty ? '0' : genericFood.servingIngredientsCount[i][0]);
          fat = fat + double.parse(genericFood.fat[i].isEmpty ? '0' : genericFood.fat[i][0]) * servingCount;
        }
      }


      String ingredients = '';
      for (int i = 0; i < genericFood.ingredients.length; i++) {
        if (i < genericFood.servingIngredientsCount.length) {
          String ingredient = '- ${double.parse(genericFood.servingIngredientsCount[i].isEmpty ? '0' : genericFood.servingIngredientsCount[i][0])
              * double.parse(genericFood.servingAmounts[i].isEmpty ? '0' : genericFood.servingAmounts[i][0])} x'
              ' (${genericFood.units[i][0]}) '
              '${genericFood.ingredients[i]},\n';
          ingredients = ingredients + ingredient;
        }
      }

      _foodName = genericFood.name;
      _totalServing = '${genericFood.servingAmount[0]} ${genericFood.unit[0]}';
      _totalCalorie = calorie.toStringAsFixed(2);
      _totalProtein = protein.toStringAsFixed(2);
      _totalCarb = carb.toStringAsFixed(2);
      _totalFat = fat.toStringAsFixed(2);
      _recipe = genericFood.recipe;
      _ingredients = ingredients;


      newFood = genericFood;
    });
  }

  Widget buildLogFoodButton(BuildContext context){
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
                if(_foodCountController.text.isEmpty){
                  showErrorToast(context, ERROR_FOOD_COUNT_EMPTY);
                }else{
                  requestLoggedFoods();
                }
              },
              child: const Text(LOG_FOOD_LABEL,
                style: TextStyle( color: Colors.white),)
          ),
        ),
      ],
    );
  }


  Widget foodCount(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('$HOW_MANY_SERVINGS:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

        const SizedBox(width: 16,),
        GestureDetector(
          child: const CircleAvatar(
            radius: 14,
            backgroundColor: DARK_PRIMARY_COLOR,
            child: Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
          onTap: (){
            setState(() {
              if(double.parse(_foodCountController.text) >= STEP_AMOUNT){
                _foodCountController = TextEditingController(text: (double.parse(_foodCountController.text) - STEP_AMOUNT).toString());
              }
            });
          },

        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: SizedBox(
              width: 60,
              height: MACRO_HEIGHT,
              child: TextField(
                controller: _foodCountController,
                textAlign: TextAlign.center,
                style: const TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: PRIMARY_COLOR),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: PRIMARY_COLOR),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: PRIMARY_COLOR, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                ),
              ),
            )
        ),
        GestureDetector(
          child: const CircleAvatar(
            radius: 14,
            backgroundColor: DARK_PRIMARY_COLOR,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          onTap: (){
            setState(() {
              _foodCountController = TextEditingController(text: (double.parse(_foodCountController.text) + STEP_AMOUNT).toString());
            });
          },
        ),
      ],
    );
  }

  void logFoodsOfToday(List<Food> foodsLoggedBefore){
    List<Food> foods = [];

    foods.addAll(foodsLoggedBefore);

    newFood= newFood.copyWith(count: num.parse(_foodCountController.text).toDouble());

    foods.add(fromGenericRecipe(newFood));

    _logFoodsBloc.add(
        LogFoodsEvent.onLogFoods(foods)
    );
  }

  Widget buildAddToCookBookButton(BuildContext context){
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
                addToCookBookClickListener(context);
              },
              child: const Text(ADD_TO_MY_COOK_BOOK,
                style: TextStyle( color: Colors.white),)
          ),
        ),
        BlocConsumer<AddOrUpdateMyCookBookBloc, AddOrUpdateMyCookBookState>(
            builder: (mcontext, state) {
              if (state is AddOrUpdateMyCookBookLoadingState) {
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
              }else if(state is AddOrUpdateMyCookBookLoadedState){
                Future.delayed(Duration.zero,(){
                  _addOrUpdateMyCookBookBloc.add(const AddOrUpdateMyCookBookEvent.onReset());
                  showSuccessToast(context, FOOD_ADDED_COOKBOOK_SUCCESS);
                });
              }else if(state is AddOrUpdateMyCookBookErrorState){
                _addOrUpdateMyCookBookBloc.add(const AddOrUpdateMyCookBookEvent.onReset());
                Future.delayed(Duration.zero,(){
                  if(state.message == ERROR_FREE_USER_COOKBOOK_FOOD_NOT_ALLOWED){
                    return showUpgradePopupForFreeUsers(context, UPGRADE_MSG_COOKBOOK_FOOD);
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


  void addToCookBookClickListener(BuildContext context){
    _addOrUpdateMyCookBookBloc.add(
      AddOrUpdateMyCookBookEvent.onAddToMyCookBook(
        fromGenericRecipe(newFood),
      ),
    );
  }

}
