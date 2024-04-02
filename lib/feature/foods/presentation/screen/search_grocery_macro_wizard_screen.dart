import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/request_macro_wizard_step2_screen.dart';
import 'package:masterpie/feature/foods/presentation/screen/search_grocery_list_ui_macro_wizard.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/debouncer.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/request_wizard_argument_model.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../domain/model/food_model.dart';
import '../bloc/groceries_bloc/groceries_bloc.dart';
import '../bloc/groceries_bloc/state_event/groceries_state_event.dart';
import '../food_calculator/generic_food_calculator.dart';



class SearchGroceryMacroWizardScreen extends StatefulWidget {

  final RequestWizardArgumentModel requestWizardArgumentModel;

  const SearchGroceryMacroWizardScreen({super.key, required this.requestWizardArgumentModel});

  @override
  State<SearchGroceryMacroWizardScreen> createState() => _SearchGroceryMacroWizardScreenState();
}

class _SearchGroceryMacroWizardScreenState extends State<SearchGroceryMacroWizardScreen> {



  late TextEditingController _searchController;

  late GroceriesBloc _groceriesBloc;

  List<GenericFood> _newGroceries= [];

  final _debouncer = Debouncer(milliseconds: 1000);


  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _groceriesBloc = context.read<GroceriesBloc>();
    _searchController.addListener(_onSearchChanged);

    requestFoodsList();

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
          title: const Text(SEARCH_GROCERY_LABEL, style: TextStyle(color: Colors.white)),
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
                                    hintText: CHEDDAR_CHEESE_LABEL,
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
                      ],
                    ),
                  ),


                  const SizedBox(height: 12,),

                  /// Groceries list
                  SearchGroceriesListUiForMacroWizard(foodCalculator: GenericFoodCalculator(visibleFoods: _newGroceries), foods: _newGroceries,
                    onAddButtonClicked: onAddButtonClicked,
                    foodBackGroundColor: DEFAULT_FOOD_BACKGROUND_COLOR, foodIcon: const Icon(Icons.fastfood, color: Colors.blueGrey,),),
                ],
              ),
            ),


            BlocConsumer<GroceriesBloc, GroceriesState>(
                builder: (context, state) {

                  if (state is GroceriesLoadingState) {
                    return const GFLoader(
                      type: GFLoaderType.circle,
                      loaderColorOne: DARK_PRIMARY_COLOR,
                      loaderColorTwo: DARK_PRIMARY_COLOR,
                      loaderColorThree: DARK_PRIMARY_COLOR,
                    );
                  }else if(state is GroceriesLoadedState){
                    Future.delayed(Duration.zero,(){
                      setState(() {
                        _newGroceries= [];
                        _newGroceries.addAll(state.foods);
                        _groceriesBloc.add(const GroceriesEvent.onReset());
                      });
                    });
                  }else if(state is GroceriesErrorState){
                    _groceriesBloc.add(const GroceriesEvent.onReset());
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
    _groceriesBloc.add(
      GroceriesEvent.onGetGroceries(_searchController.text),
    );
  }



  void onAddButtonClicked(Food food){
    List<Food> foods = [];
    foods.addAll(widget.requestWizardArgumentModel.foods);
    foods.add(food);

    List<RangeValues> servingRanges = [];
    servingRanges.addAll(widget.requestWizardArgumentModel.servingRanges);
    servingRanges.add(const RangeValues(0.5, 5.0));

    RequestWizardArgumentModel argumentModel= RequestWizardArgumentModel(
      restriction: widget.requestWizardArgumentModel.restriction,
      macroGoalRanges: widget.requestWizardArgumentModel.macroGoalRanges,
      foods: foods,
      servingRanges: servingRanges
    );

    Navigator.pop(context, argumentModel);

  }



  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }


}
