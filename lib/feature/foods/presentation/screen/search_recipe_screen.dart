

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/presentation/food_calculator/generic_food_calculator.dart';
import 'package:masterpie/feature/foods/presentation/screen/search_recipe_list_ui.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/debouncer.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/generic_food_detail_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/view_recipe_screen.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../domain/model/food_model.dart';
import '../bloc/recipes_bloc/recipes_bloc.dart';
import '../bloc/recipes_bloc/state_event/recipes_state_event.dart';




class SearchRecipeScreen extends StatefulWidget {

  const SearchRecipeScreen({super.key});


  @override
  State<SearchRecipeScreen> createState() => _SearchRecipeScreenState();
}


class _SearchRecipeScreenState extends State<SearchRecipeScreen> {


  late TextEditingController _searchController;

  late RecipesBloc _recipeBloc;


  List<GenericFood> _newRecipes= [];


  final _debouncer = Debouncer(milliseconds: 1000);


  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _recipeBloc = context.read<RecipesBloc>();
    _searchController.addListener(_onSearchChanged);

    requestFoodsList();

  }

  void onRecipeClicked(GenericFood food){
    GenericFoodDetailArgumentModel argumentModel = GenericFoodDetailArgumentModel(
        food: food,
        macroEdition: true
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewRecipeScreen(foodDetailArgumentModel: argumentModel,),
      ),
    );
  }

  List<GenericFood> toGenericFoods(List<Food> foods){
    return foods.map((element) =>
        GenericFood(
            count: element.count,
            units: [element.units],
            servingAmounts: [element.servingAmounts],
            calorie: [element.calorie],
            protein: [element.protein],
            carb: [element.carb],
            fat: [element.fat],
            foodType: element.foodType,
          name: element.name,
          id: element.id
        )
    ).toList();
  }


  void _onSearchChanged() {
    setState(() {

    });
    _debouncer.run(() {
      requestFoodsList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /// App bar
        appBar: AppBar(
          title: const Text(SEARCH_RECIPE_LABEL, style: TextStyle(color: Colors.white)),
          backgroundColor: PRIMARY_COLOR,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const SizedBox(
              width: 48,
              height: double.infinity,
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          actions: [

          ],
        ),


        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 12,),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [

                        /// search bar
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: SEARCH_BAR_HEIGHT,
                                child: TextField(
                                  controller: _searchController,
                                  decoration: const InputDecoration(
                                    hintText: PASTA_LABEL,
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
                            ),
                            const SizedBox(width: 8,),
                            GestureDetector(
                              child: const CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.orange,
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                requestFoodsList();
                              },
                            )
                          ],
                        ),

                        const SizedBox(height: 4,),

                        fatSecretAttribute()

                      ],
                    ),
                  ),

                  const SizedBox(height: 12,),

                  /// recipes list
                  SearchRecipesListUi(foodCalculator: GenericFoodCalculator(visibleFoods: _newRecipes), foods: _newRecipes,
                    onRecipeClicked: onRecipeClicked,
                    foodBackGroundColor: DEFAULT_FOOD_BACKGROUND_COLOR, foodIcon: const Icon(Icons.fastfood, color: Colors.blueGrey,)),
                ],
              ),
            ),


            BlocConsumer<RecipesBloc, RecipesState>(
                builder: (context, state) {

                  if (state is RecipesLoadingState) {
                    return const GFLoader(
                      type: GFLoaderType.circle,
                      loaderColorOne: DARK_PRIMARY_COLOR,
                      loaderColorTwo: DARK_PRIMARY_COLOR,
                      loaderColorThree: DARK_PRIMARY_COLOR,
                    );
                  }else if(state is RecipesLoadedState){
                    Future.delayed(Duration.zero,(){
                      setState(() {
                        _newRecipes= [];
                        _newRecipes.addAll(state.foods);
                        _recipeBloc.add(const RecipesEvent.onReset());
                      });
                    });
                  }else if(state is RecipesErrorState){
                    FocusScope.of(context).unfocus();
                    _recipeBloc.add(const RecipesEvent.onReset());
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
      ),
    );
  }

  void requestFoodsList(){
    _recipeBloc.add(
      RecipesEvent.onGetRecipes(_searchController.text),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

}


