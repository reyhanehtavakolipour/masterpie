import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import '../../../../../util/core/constant/messages_constants.dart';
import '../../../../../util/design/color/app_colors.dart';
import '../../../../../util/design/size/app_widget_size.dart';
import '../../../domain/model/food_model.dart';
import 'model/dishes_ingredients_model.dart';


class FoodsMacroListUi extends StatefulWidget {

  final Function(int index, String type) onRemoveDishClicked;
  final List<Food> mainDishesFoods;
  final List<Food> sideDishesFoods;
  final List<String> mainDishesTypes;
  final List<String> sideDishesTypes;

  List<TextEditingController> ingredientsController= [];

  DishesIngredientsModel getDishesIngredientsModel(){
    List<List<String>> dishesIngredients= [];
    List<String> newMainDishTypes= [];
    List<String> newSideDishTypes= [];
    List<Food> newMainDishFoods= [];
    List<Food> newSideDishFoods= [];
    for(int i = 0; i < ingredientsController.length; i++){
      if(ingredientsController[i].text.isNotEmpty){
        dishesIngredients.add([ingredientsController[i].text]);

        if(i < mainDishesFoods.length){
          newMainDishFoods.add(mainDishesFoods[i]);
          newMainDishTypes.add(mainDishesTypes[i]);
        }else{
          newSideDishFoods.add(sideDishesFoods[i- mainDishesFoods.length]);
          newSideDishTypes.add(sideDishesTypes[i- mainDishesFoods.length]);
        }
      }
    }

    return DishesIngredientsModel(
      dishIngredients: dishesIngredients,
      newMainDishesFoods: newMainDishFoods,
      newSideDishesFoods: newSideDishFoods,
      newMainDishTypes: newMainDishTypes,
      newSideDishTypes: newSideDishTypes
    );
  }


  FoodsMacroListUi({super.key, required this.mainDishesFoods, required this.sideDishesFoods, required this.mainDishesTypes, required this.sideDishesTypes,
    required this.onRemoveDishClicked});

  @override
  State<FoodsMacroListUi> createState() => _FoodsMacroListUiState();
}

class _FoodsMacroListUiState extends State<FoodsMacroListUi> {


  List<Food> _foods= [];
  List<String> _types= [];


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    _foods= [];
    _types= [];
    _types.addAll(widget.mainDishesTypes);
    _types.addAll(widget.sideDishesTypes);
    _foods.addAll(widget.mainDishesFoods);
    _foods.addAll(widget.sideDishesFoods);

    widget.ingredientsController= [];
    _foods.forEach((element) {
      widget.ingredientsController.add(TextEditingController());
    });

    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _foods.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          String foodName = _foods[index].name;

          String title= '';

          if(_types.length <= index){
            return Container();
          }

          title= _types[index];

          String ingredients= cleanIngredients(_foods[index].ingredients).join(', ');


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


                const Text(LIST_INGREDIENTS_TITLE, style: TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 14, fontWeight: FontWeight.bold),),


                const SizedBox(height: 8,),


                /// all ingredients
                SizedBox(
                  height: 100,
                  child: TextField(
                    controller: widget.ingredientsController[index],
                    textInputAction: TextInputAction.done,
                    maxLines: null,
                    expands: true,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: const InputDecoration(
                      hintText: 'egg, avocado,...',
                      hintStyle: TextStyle(fontSize: 12),
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
                    style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 13),
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


}
