import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../../../../util/core/constant/messages_constants.dart';
import '../../../../../util/design/color/app_colors.dart';
import '../../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../../util/design/text/app_assets.dart';
import '../../../domain/model/food_model.dart';







class ViewRecipePopup extends StatefulWidget {


  final Food food;


  const ViewRecipePopup({super.key, required this.food});

  @override
  State<ViewRecipePopup> createState() => _ViewRecipePopupState();
}


class _ViewRecipePopupState extends State<ViewRecipePopup> {

  String _ingredients= '';

  @override
  void initState() {
    super.initState();

    //ingredients
    if(widget.food.ingredients.length == widget.food.calorie.length){
      for (int i = 0; i < widget.food.ingredients.length; i++) {
        if (i < widget.food.servingIngredientsCount.length) {
          String ingredient = '- ${double.parse(widget.food.servingIngredientsCount[i].isEmpty ? '0' : widget.food.servingIngredientsCount[i][0])} x'
              ' (${widget.food.units[i][0]}) '
              '${widget.food.ingredients[i]},\n';
          _ingredients = _ingredients + ingredient;
        }
      }
    }else{
      for (int i = 0; i < widget.food.ingredients.length; i++) {
        _ingredients = '$_ingredients- ${widget.food.ingredients[i]}\n';
      }
    }


  }


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: DefaultTextStyle(
          style: const TextStyle(
            fontFamily: MONTSERRAT_FONT,
          ),
          child: contentBox(context)
      ),
    );
  }

  Widget contentBox(BuildContext context) {

    String servingNumber= '';
    if(isValidNumber(widget.food.servingAmount.toString())){
      servingNumber= widget.food.servingAmount.toInt().toString();
    }

    return  Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: CATEGORY_COLOR,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: const Text(
              RECIPE_LABEL,
              style: TextStyle(
                fontSize: 14.0,
                color: DARK_PRIMARY_COLOR,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),



          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 8,),

                  /// food name
                  Text(widget.food.name, style: const TextStyle(fontSize: 16, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),


                  const SizedBox(height: 16,),

                  Text('$INGREDIENTS_LABEL for $servingNumber serving:', style: const TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),),

                  const SizedBox(height: 4,),


                  Text(_ingredients, style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),


                  const SizedBox(height: 16,),

                  const Text('$RECIPE_LABEL:', style: TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),),

                  const SizedBox(height: 4,),


                  Text(widget.food.recipe, style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.normal),),



                  const SizedBox(height: 8,),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }


}