import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/presentation/bloc/add_or_update_my_cook_book_bloc/add_or_update_my_cook_book_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/add_or_update_my_cook_book_bloc/state_event/add_or_update_my_cook_book_state_event.dart';
import 'package:masterpie/feature/foods/presentation/bloc/get_recipe_bloc/get_recipe_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/get_recipe_bloc/state_event/get_recipe_state_event.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/food_detail_macro_wizard_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/generic_food_detail_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/generic_food_detail_macro_wizard_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model_converter.dart';
import 'package:masterpie/main_screen.dart';
import 'package:masterpie/util/core/helper/print.dart';
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
import 'edit_recipe_macro_wizard_screen.dart';
import 'edit_recipe_screen.dart';


class ViewRecipeMacroWizardScreen extends StatefulWidget {

  final GenericFoodDetailForMacroWizardArgumentModel foodDetailArgumentModel;

  const ViewRecipeMacroWizardScreen({super.key, required this.foodDetailArgumentModel});

  @override
  State<ViewRecipeMacroWizardScreen> createState() => _ViewRecipeMacroWizardScreenState();
}

class _ViewRecipeMacroWizardScreenState extends State<ViewRecipeMacroWizardScreen> {

  bool _isRecipeLoaded= false;

  String _totalCalorie= '';
  String _totalProtein= '';
  String _totalCarb= '';
  String _totalFat= '';
  String _totalServing= '';
  String _ingredients= '';
  String _foodName= '';
  String _recipe= '';


  String _prepTime= '';


  late TextEditingController _foodCountController;

  GenericFood newFood = GenericFood();
  late AddOrUpdateMyCookBookBloc _addOrUpdateMyCookBookBloc;
  late GetRecipeBloc _getRecipeBloc;


  late GetLoggedFoodsBloc _getLoggedFoodsBloc;
  late LogFoodsBloc _logFoodsBloc;

  bool _logFoodButtonCLicked= false;


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
    if(widget.foodDetailArgumentModel.food!.createdFromFatSecretRecipes == 1){
      _getRecipeBloc.add(
          GetRecipeEvent.onGetRecipe(widget.foodDetailArgumentModel.food!)
      );
    }else{
      _isRecipeLoaded= true;
      fillUi(widget.foodDetailArgumentModel.food!);
    }
  }


  @override
  Widget build(BuildContext context) {

    String servingNumber= '';
    if(newFood.servingAmount.isNotEmpty){
      if(isValidDouble(newFood.servingAmount[0].toString())){
        servingNumber= newFood.servingAmount[0].toInt().toString();
      }
    }


    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(FOOD_DETAIL_LABEL, style: TextStyle(color: Colors.white),),
          backgroundColor: PRIMARY_COLOR,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.white,),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.white,),
              onPressed: () {
                final argument= widget.foodDetailArgumentModel.copyWith(
                  food: newFood
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditRecipeMacroWizardScreen(genericGroceryDetailForMacroWizardArgumentModel: argument,),
                  ),
                ).then((result) {
                  setState(() {
                    if(result != null){
                      Navigator.pop(context, result);
                    }
                  });
                });
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


                        Visibility(
                            visible: _prepTime.isNotEmpty,
                            child: const SizedBox(height: 16,)
                        ),

                        Visibility(
                          visible: _prepTime.isNotEmpty,
                            child: Text('$_prepTime $PREP_TIME_LABEL', style: const TextStyle(fontSize: 16, color: Colors.lightGreen, fontWeight: FontWeight.bold),)
                        ),


                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const SizedBox(height: 16,),

                            Text('$INGREDIENTS_LABEL for $servingNumber serving:', style: const TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),),

                            const SizedBox(height: 4,),


                            Text(_ingredients, style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),


                            const SizedBox(height: 16,),

                            const Text('$RECIPE_LABEL:', style: TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),),

                            const SizedBox(height: 4,),


                            Text(_recipe, style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),

                          ],
                        ),



                        const SizedBox(height: 32,),



                        const Text('$TOTAL_MACRO_PER_SERVING_LABEL:', style: TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),),


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


                        buildAddFoodButton(context),
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

              ],
            )
        ),
      ),
    );
  }



  void fillUi(GenericFood genericFood){
    setState(() {
      if(genericFood.ingredients.length == genericFood.calorie.length){

        _prepTime= genericFood.prepTime;

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
            String ingredient = '- ${double.parse(genericFood.servingIngredientsCount[i].isEmpty ? '0' : genericFood.servingIngredientsCount[i][0])} x'
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

      }else{

        _prepTime= genericFood.prepTime;

        String ingredients = '';
        for (int i = 0; i < genericFood.ingredients.length; i++) {
          ingredients = '$ingredients- ${genericFood.ingredients[i]}\n';
        }


        _foodName = genericFood.name;
        _totalCalorie = genericFood.calorie[0][0];
        _totalProtein = genericFood.protein[0][0];
        _totalCarb = genericFood.carb[0][0];
        _totalFat = genericFood.fat[0][0];
        _recipe = genericFood.recipe;
        _ingredients = ingredients;
      }
      newFood = genericFood;
    });
  }

  Widget buildAddFoodButton(BuildContext context){
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

                List<int> selectedIngredientsUnitIndexList= [];
                newFood.ingredients.forEach((element) {
                  selectedIngredientsUnitIndexList.add(0);
                });


                final food= fromGenericRecipe(newFood);


                FoodDetailForMacroWizardArgumentModel model= FoodDetailForMacroWizardArgumentModel(
                  type: widget.foodDetailArgumentModel.type,
                  index: widget.foodDetailArgumentModel.index,
                  food: food,
                );
                showSuccessToast(context, FOOD_ADDED_TO_WIZARD_MSG);
                Navigator.pop(context, model);
              },
              child: const Text(ADD_FOOD_LABEL,
                style: TextStyle( color: Colors.white),)
          ),
        ),
      ],
    );
  }



}
