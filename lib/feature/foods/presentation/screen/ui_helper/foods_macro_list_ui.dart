import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/view_recipe_popup.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import '../../../../../main_screen.dart';
import '../../../../../util/core/constant/messages_constants.dart';
import '../../../../../util/design/color/app_colors.dart';
import '../../../../../util/design/size/app_widget_size.dart';
import '../../../../../util/design/text/app_assets.dart';
import '../../../domain/model/food_model.dart';
import '../../../domain/model/food_type.dart';
import '../../../domain/model/food_unit.dart';
import 'debouncer.dart';

class FoodsMacroListUi extends StatefulWidget {

  final Function(int index, String type) onRemoveDishClicked;
  final Function(int index, String type) onRemoveFoodClicked;
  final List<Food> mainDishesFoods;
  final List<Food> sideDishesFoods;
  final List<String> mainDishesTypes;
  final List<String> sideDishesTypes;
  final Function(String source, int index) onMainDishClicked;
  final Function(String source, int index) onSideDishClicked;


  FoodsMacroListUi({super.key, required this.mainDishesFoods, required this.sideDishesFoods, required this.mainDishesTypes, required this.sideDishesTypes,
    required this.onRemoveDishClicked, required this.onRemoveFoodClicked, required this.onMainDishClicked, required this.onSideDishClicked});

  @override
  State<FoodsMacroListUi> createState() => _FoodsMacroListUiState();
}

class _FoodsMacroListUiState extends State<FoodsMacroListUi> {


  late TextEditingController _minServingController;
  late TextEditingController _maxServingController;


  List<Food> _foods= [];
  List<String> _types= [];



  @override
  void initState() {
    super.initState();
    _minServingController= TextEditingController(text: WIZARD_MIN_SERVING);
    _maxServingController= TextEditingController(text: WIZARD_MAX_SERVING);
  }


  @override
  Widget build(BuildContext context) {
    _foods= [];
    _types= [];
    _types.addAll(widget.mainDishesTypes);
    _types.addAll(widget.sideDishesTypes);
    _foods.addAll(widget.mainDishesFoods);
    _foods.addAll(widget.sideDishesFoods);

    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _foods.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          String foodName = _foods[index].name;

          String title= '';

          title= _types[index];

          Color titleColor= GREEN_COLOR;
          if(index < widget.mainDishesFoods.length){
            titleColor= GREEN_COLOR;
          }else{
            titleColor= Colors.lightGreen;
          }


          int typeIndex= 0;
          if(index < widget.mainDishesFoods.length){
            typeIndex= index;
          }else{
            typeIndex= index - widget.mainDishesFoods.length;
          }



          return Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            margin: const EdgeInsets.only(top: 8,),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(BORDER_RADIUS),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: titleColor, fontSize: 14),),

                    GestureDetector(
                      onTap: (){
                        removeDishClickListener(index);
                      },
                      child: const Icon(
                        Icons.close,
                        color: RED_ERROR_COLOR,
                        size: 20,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8,),


                Visibility(
                  visible: foodName.isEmpty,
                    child:
                    Row(
                        children: [

                          const SizedBox(width: 4,),


                          /// create manual
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                if(index < widget.mainDishesFoods.length){
                                  widget.onMainDishClicked(CREATE_MANUAL_LABEL, typeIndex);
                                }else{
                                  widget.onSideDishClicked(CREATE_MANUAL_LABEL, typeIndex);
                                }
                              },
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: LIGHT_GREY_COLOR,
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20), // Radius value
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Image.asset(HOW_MUCH_EAT_PATH, color: DARK_GREY_COLOR, width: 20, height: 20,),

                                    const SizedBox(height: 6,),

                                    const Text(CREATE_MANUAL_LABEL, style: TextStyle( color: DARK_GREY_COLOR, fontSize: 12), textAlign: TextAlign.center,),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 6,),

                          /// auto generate
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                if(index < widget.mainDishesFoods.length){
                                  widget.onMainDishClicked(AUTO_GENERATE_LABEL, typeIndex);
                                }else{
                                  widget.onSideDishClicked(AUTO_GENERATE_LABEL, typeIndex);
                                }
                              },
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: LIGHT_GREY_COLOR,
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20), // Radius value
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Image.asset(AUTO_PATH, color: DARK_GREY_COLOR, width: 20, height: 20,),

                                    const SizedBox(height: 6,),

                                    const Text(AUTO_GENERATE_LABEL, style: TextStyle( color: DARK_GREY_COLOR, fontSize: 12), textAlign: TextAlign.center,),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 6,),

                        ]
                    ),


                ),


                Visibility(
                  visible: foodName.isNotEmpty,
                  child: GestureDetector(
                    onTap: (){
                      if(_foods[index].foodType == FoodType.meal){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ViewRecipePopup(food: _foods[index],);
                          },
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      margin: const EdgeInsets.only(top: 4,),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: LIGHT_GREY_COLOR,
                          width: 2,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20), // Radius value
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Flexible(child: Text(foodName, style: const TextStyle(fontWeight: FontWeight.bold, color: DARK_PRIMARY_COLOR, fontSize: 14),)),


                              GestureDetector(
                                onTap: (){
                                  removeFoodClickListener(index);
                                },
                                child: const Icon(
                                  Icons.remove_circle,
                                  color: RED_ERROR_COLOR,
                                  size: 25,
                                ),
                              ),

                            ],
                          ),

                          Visibility(
                            visible: _foods[index].foodType == FoodType.meal,
                            child: Container(
                              child: const Text(
                                SEE_RECIPE_LABEL,
                                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey),
                              ),
                            ),
                          ),

                        ],
                      )
                    ),
                  ),
                ),
              ],
            )
          );
        }
    );
  }


  void removeDishClickListener(int index){
    setState(() {
      if(index < widget.mainDishesFoods.length){
        widget.onRemoveDishClicked(index, MAIN_DISH_LABEL);
      }else{
        int removeIndex= index - widget.mainDishesFoods.length;
        widget.onRemoveDishClicked(removeIndex, SIDE_DISH_LABEL);
      }
    });
  }

  void removeFoodClickListener(int index){
    setState(() {
      if(index < widget.mainDishesFoods.length){
        widget.onRemoveFoodClicked(index, MAIN_DISH_LABEL);
      }else{
        int removeIndex= index - widget.mainDishesFoods.length;
        widget.onRemoveFoodClicked(removeIndex, SIDE_DISH_LABEL);
      }
    });
  }


  Widget foodServingRange(int index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('$SERVINGS_RANGE:', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),

        const SizedBox(height: 16,),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ///min
            const Text(MIN_LABEL, style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: SizedBox(
                  width: 60,
                  height: MACRO_HEIGHT,
                  child: TextField(
                    controller: _minServingController,
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


            const SizedBox(width: 8,),

            ///max
            const Text(MAX_LABEL, style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: SizedBox(
                  width: 60,
                  height: MACRO_HEIGHT,
                  child: TextField(
                    controller: _maxServingController,
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

          ],
        )
      ],
    );
  }


}
