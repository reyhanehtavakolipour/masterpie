



class GenericFoodInformation{
  final List<List<double>> calorie;
  final List<List<double>> protein;
  final List<List<double>> carb;
  final List<List<double>> fat;
  final double count;
  final List<double> servingAmount;
  final bool isFoodAdded;
  final List<String> unit;
  final List<List<String>> units;

  GenericFoodInformation({
    required this.calorie,
    required this.protein,
    required this.carb,
    required this.fat,
    required this.count,
    required this.servingAmount,
    required this.isFoodAdded,
    required this.unit,
    required this.units
  });
}
