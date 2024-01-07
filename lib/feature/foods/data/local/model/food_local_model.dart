


import 'food_type_local.dart';

/**
 * This class is not needed for first version and it doesn't have any functionality in the app.
 * might be needed in future. otherwise delete it
 */

class FoodLocal{
  String foodId;
  FoodTypeLocal foodTypeLocal;
  String barcode;
  String name;
  String brandName;
  String description;
  String nationality;
  String image;
  List<String> servingAmounts;
  List<String> ingredients;
  List<String> servingIngredientsCount;
  List<String> units;
  String recipe;
  List<String> calorie;
  List<String> protein;
  List<String> carb;
  List<String> fat;
  List<String> diets;
  List<String> allergies;
  int servingAmount;
  String unit;



  FoodLocal({
    required this.foodId,
    required this.foodTypeLocal,
    required this.barcode,
    required this.name ,
    required this.brandName,
    required this.description,
    required this.nationality,
    required this.image,
    required this.servingAmounts,
    required this.ingredients,
    required this.servingIngredientsCount,
    required this.units,
    required this.recipe,
    required this.calorie,
    required this.protein,
    required this.carb,
    required this.fat,
    required this.diets,
    required this.allergies,
    required this.servingAmount,
    required this.unit,
});


  factory FoodLocal.fromJson(Map<String, dynamic> parsedJson) {
    return FoodLocal(
      foodId: parsedJson['foodId'],
      foodTypeLocal: getFoodType(parsedJson['foodTypeLocal']),
      barcode: parsedJson['barcode'],
      name: parsedJson['name'],
      brandName: parsedJson['brandName'],
      description: parsedJson['description'],
      nationality: parsedJson['nationality'],
      image: parsedJson['image'],
      servingAmounts: (parsedJson['servingAmounts'] as String).split(';'),
      ingredients: (parsedJson['ingredients'] as String).split(';'),
      servingIngredientsCount: (parsedJson['servingIngredientsCount'] as String).split(';'),
      units: (parsedJson['units'] as String).split(';'),
      recipe: parsedJson['recipe'],
      calorie: (parsedJson['calorie'] as String).split(';'),
      protein: (parsedJson['protein'] as String).split(';'),
      carb: (parsedJson['carb'] as String).split(';'),
      fat: (parsedJson['fat'] as String).split(';'),
      diets: (parsedJson['diets'] as String).split(';'),
      allergies: (parsedJson['allergies'] as String).split(';'),
      servingAmount: parsedJson['servingAmount'],
      unit: parsedJson['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['foodId'] = foodId;
    data['foodTypeLocal'] = foodTypeLocal.name;
    data['barcode'] = barcode;
    data['name'] = name;
    data['brandName'] = brandName;
    data['description'] = description;
    data['nationality'] = nationality;
    data['image'] = image;
    data['servingAmounts'] = servingAmounts.join(';');
    data['ingredients'] = ingredients.join(';');
    data['servingIngredientsCount'] = servingIngredientsCount.join(';');
    data['units'] = units.join(';');
    data['recipe'] = recipe;
    data['calorie'] = calorie.join(';');
    data['protein'] = protein.join(';');
    data['carb'] = carb.join(';');
    data['fat'] = fat.join(';');
    data['diets'] = diets.join(';');
    data['allergies'] = allergies.join(';');
    data['servingAmount'] = servingAmount;
    data['unit'] = unit;
    return data;
  }

  @override
  String toString() {
    return 'id: $foodId,'
        'foodTypeLocal: $foodTypeLocal,'
        'barcode: $barcode,'
        'name: $name,'
        'brandName: $brandName,'
        'description: $description,'
        'nationality: $nationality,'
        'servingAmounts: $servingAmounts,'
        'image: $image,'
        'ingredients: $ingredients,'
        'servingIngredientsCount: $servingIngredientsCount,'
        'units: $units,'
        'recipe: $recipe,'
        'calorie: $calorie,'
        'protein: $protein,'
        'carb: $carb,'
        'fat: $fat,'
        'diets: $diets,'
        'allergies: $allergies,'
        'servingAmount: $servingAmount,'
        'unit: $unit';
  }

}