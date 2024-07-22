import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/search_grocery_list_ui_macro_wizard.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/food_detail_macro_wizard_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/generic_food_detail_macro_wizard_argument_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model_converter.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../domain/model/food_model.dart';
import '../bloc/groceries_bloc/groceries_bloc.dart';
import '../bloc/groceries_bloc/state_event/groceries_state_event.dart';
import '../food_calculator/generic_food_calculator.dart';
import 'edit_grocery_macro_wizard_screen.dart';



class SearchGroceryMacroWizardScreen extends StatefulWidget {

  final GenericFoodDetailForMacroWizardArgumentModel genericFoodDetailForMacroWizardArgumentModel;

  const SearchGroceryMacroWizardScreen({super.key, required this.genericFoodDetailForMacroWizardArgumentModel});

  @override
  State<SearchGroceryMacroWizardScreen> createState() => _SearchGroceryMacroWizardScreenState();
}

class _SearchGroceryMacroWizardScreenState extends State<SearchGroceryMacroWizardScreen> {


  late TextEditingController _searchController;

  late GroceriesBloc _groceriesBloc;

  List<GenericFood> _newGroceries= [];


  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _groceriesBloc = context.read<GroceriesBloc>();
    _searchController.addListener(_onSearchChanged);

    logEvent(MACRO_DIET_GROCERY_VIEWED, null);

    requestFoodsList();

  }

  void _onSearchChanged() {
    setState(() {

    });
    debouncer.run(() {
      if(_searchController.text.isNotEmpty){
        requestFoodsList();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return  PopScope(
      canPop: false,
      onPopInvoked: (bool didPop){
        // Navigator.pop(context, _requestWizardArgumentModel);
      },
      child: MaterialApp(
        theme: ThemeData(fontFamily: MONTSERRAT_FONT),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          /// App bar
          appBar: AppBar(
            title: const Text(SEARCH_GROCERY_LABEL, style: TextStyle(color: Colors.white)),
            backgroundColor: PRIMARY_COLOR,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context, FoodDetailForMacroWizardArgumentModel(food: null,));
              },
              child: const Icon(Icons.arrow_back_ios, color: Colors.white,),
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
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  child: const CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Colors.orange,
                                    child: Icon(
                                      Icons.document_scanner,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  scanBarcodeNormal();
                                },
                              )
                            ],
                          ),

                          fatSecretAttribute(),

                        ],
                      ),
                    ),


                    const SizedBox(height: 12,),

                    /// Groceries list
                    SearchGroceriesListUiForMacroWizard(foodCalculator: GenericFoodCalculator(visibleFoods: _newGroceries), foods: _newGroceries,
                      onAddButtonClicked: onAddButtonClicked, onGroceryClicked: onGroceryClicked,
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
                      FocusScope.of(context).unfocus();
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
      ),
    );
  }

  void requestFoodsList(){
    _groceriesBloc.add(
      GroceriesEvent.onGetGroceries(_searchController.text),
    );
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      requestGroceryWithBarcode(barcodeScanRes);
    });
  }

  void requestGroceryWithBarcode(String barcodeId){
    _groceriesBloc.add(
      GroceriesEvent.onGetGroceryWithBarcode(barcodeId),
    );
  }


  void onAddButtonClicked(Food food){
    FoodDetailForMacroWizardArgumentModel argumentModel= FoodDetailForMacroWizardArgumentModel(
      food: food,
      type: widget.genericFoodDetailForMacroWizardArgumentModel.type,
      index: widget.genericFoodDetailForMacroWizardArgumentModel.index
    );

    Navigator.pop(context, argumentModel);

  }


  void onGroceryClicked(GenericFood food){
    GenericFoodDetailForMacroWizardArgumentModel argumentModel = GenericFoodDetailForMacroWizardArgumentModel(
        type: widget.genericFoodDetailForMacroWizardArgumentModel.type,
        index: widget.genericFoodDetailForMacroWizardArgumentModel.index,
        food: food
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditGroceryForMacroWizardScreen(genericFoodDetailForMacroWizardArgumentModel: argumentModel,),
      ),
    ).then((result) {
      setState(() {
        Navigator.pop(context, result);
      });
    });
  }



  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }


}
