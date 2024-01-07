



class FoodInformation{
  final double calorie;
  final double protein;
  final double carb;
  final double fat;
  final double quantity;
  final double totalCalorie;
  final double totalProtein;
  final double totalCarb;
  final double totalFat;
  final int servingQuantity;
  final bool isFoodAdded;
  final String foodUnit;

  FoodInformation({
    required this.calorie,
    required this.protein,
    required this.carb,
    required this.fat,
    required this.quantity,
    required this.totalCalorie,
    required this.totalProtein,
    required this.totalCarb,
    required this.totalFat,
    required this.servingQuantity,
    required this.foodUnit,
    required this.isFoodAdded
  });
}


class TotalMacroDialogValues {
  final double quantity;
  final List<String> totalCalorie;
  final List<String> totalProtein;
  final List<String> totalCarb;
  final List<String> totalFat;
  final bool shouldSaveToFavorites;


  TotalMacroDialogValues({required this.quantity, required this.totalCalorie, required this.totalProtein, required this.totalCarb, required this.totalFat, required this.shouldSaveToFavorites});
}

class ServingMacroDialogValues {
  final int serving;
  final List<String> calorie;
  final List<String> protein;
  final List<String> carb;
  final List<String> fat;
  final String unit;
  final bool shouldSaveToFavorites;

  ServingMacroDialogValues({required this.serving, required this.calorie, required this.protein, required this.carb, required this.fat, required this.unit, required this.shouldSaveToFavorites});
}

enum FoodInfoDialog{
  servingAndCalorie,
  quantityAndTotalCalorie
}
