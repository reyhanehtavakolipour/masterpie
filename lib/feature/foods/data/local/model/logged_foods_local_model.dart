


import 'food_type_local.dart';

class LoggedFoodsLocal{
  String id;
  String date;
  String myId;
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
  double servingAmount;
  String unit;
  String count;
  int createdFromFatSecretRecipes;




  LoggedFoodsLocal({
    required this.id,
    required this.date,
    required this.myId,
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
    required this.count,
    required this.createdFromFatSecretRecipes
});


  factory LoggedFoodsLocal.fromJson(Map<String, dynamic> parsedJson) {
    return LoggedFoodsLocal(
      id: parsedJson['id'],
      date: parsedJson['date'],
      myId: parsedJson['myId'],
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
      servingAmount: double.parse(parsedJson['servingAmount'].toString()),
      unit: parsedJson['unit'],
      createdFromFatSecretRecipes: parsedJson['createdFromFatSecretRecipes'],
      count: parsedJson['count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['myId'] = myId;
    data['foodTypeLocal'] = foodTypeLocal.name;
    data['barcode'] = barcode;
    data['name'] = name.replaceAll(',', '');
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
    data['count'] = count;
    data['createdFromFatSecretRecipes']= createdFromFatSecretRecipes;
    return data;
  }

  @override
  String toString() {
    return 'id: $id,'
        'date: $date,'
        'myId: $myId,'
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
        'count: $count,'
        'createdFromFatSecretRecipes: $createdFromFatSecretRecipes,'
        'unit: $unit';
  }

}