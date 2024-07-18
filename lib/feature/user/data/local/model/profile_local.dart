


import 'package:masterpie/util/core/constant/messages_constants.dart';

class ProfileLocal{
  String id;
  String email;
  String firstName;
  String lastName;
  String gender;
  String weight;
  String height;
  String weightUnit;
  String heightUnit;
  String goalWeight;
  String age;
  List<String> dailyMacroGoal;
  String activityLevel;
  String weightChangeWeekly;
  List<String> favoriteCategories;
  List<String> hateCategories;
  List<String> favoriteSubCategories;
  List<String> hateSubCategories;
  List<String> allergens;
  List<String> mainDishTypes;
  List<String> sideDishTypes;



  ProfileLocal({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName ,
    required this.gender,
    required this.weight,
    required this.height,
    required this.weightUnit,
    required this.heightUnit,
    required this.goalWeight,
    required this.age,
    required this.dailyMacroGoal,
    required this.activityLevel,
    required this.weightChangeWeekly,
    required this.favoriteCategories,
    required this.hateCategories,
    required this.favoriteSubCategories,
    required this.hateSubCategories,
    required this.allergens,
    required this.mainDishTypes,
    required this.sideDishTypes
  });


  factory ProfileLocal.fromJson(Map<String, dynamic> parsedJson) {
    return ProfileLocal(
        id: parsedJson['id'],
        email: parsedJson['email'],
        firstName: parsedJson['firstName'],
        lastName: parsedJson['lastName'],
        weight: parsedJson['weight'],
        height: parsedJson['height'],
        weightUnit: parsedJson['weightUnit'],
        heightUnit: parsedJson['heightUnit'],
        gender: parsedJson['gender'],
        goalWeight: parsedJson['goalWeight'],
        age: parsedJson['age'],
        activityLevel: parsedJson['activityLevel'],
        dailyMacroGoal: (parsedJson['dailyMacroGoal'] as String).split(';'),
        weightChangeWeekly: parsedJson['weightChangeWeekly'],
      mainDishTypes: (parsedJson['mainDishTypes'] as String).split(';'),
      sideDishTypes: (parsedJson['sideDishTypes'] as String).split(';'),
      favoriteCategories: (parsedJson['favoriteCategories'] as String).split(';'),
      hateCategories: (parsedJson['hateCategories'] as String).split(';'),
      favoriteSubCategories: (parsedJson['favoriteSubCategories'] as String).split(';'),
      hateSubCategories: (parsedJson['hateSubCategories'] as String).split(';'),
      allergens: (parsedJson['allergens'] as String).split(';'),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['weight'] = weight;
    data['height'] = height;
    data['weightUnit'] = weightUnit;
    data['heightUnit'] = heightUnit;
    data['goalWeight'] = goalWeight;
    data['age'] = age;
    data['activityLevel'] = activityLevel;
    data['weightChangeWeekly'] = weightChangeWeekly;
    data['dailyMacroGoal'] = dailyMacroGoal.join(';');
    data['mainDishTypes'] = mainDishTypes.join(';');
    data['sideDishTypes'] = sideDishTypes.join(';');
    data['favoriteCategories'] = favoriteCategories.join(';');
    data['hateCategories'] = hateCategories.join(';');
    data['favoriteSubCategories'] = favoriteSubCategories.join(';');
    data['hateSubCategories'] = hateSubCategories.join(';');
    data['allergens'] = allergens.join(';');

    return data;
  }

  @override
  String toString() {
    return 'id: $id,'
        'email: $email,'
        'firstName: $firstName,'
        'lastName: $lastName,'
        'gender: $gender,'
        'weight: $weight,'
        'height: $height,'
        'weightUnit: $weightUnit,'
        'heightUnit: $heightUnit,'
        'goalWeight: $goalWeight'
        'age: $age,'
        'activityLevel: $activityLevel,'
        'weightChangeWeekly: $weightChangeWeekly,'
        'favoriteCategories: $favoriteCategories,'
        'hateCategories: $hateCategories,'
        'favoriteSubCategories: $favoriteSubCategories,'
        'hateSubCategories: $hateSubCategories,'
        'mainDishTypes: $mainDishTypes,'
        'sideDishTypes: $sideDishTypes,'
        'allergens: $allergens,'
        'dailyMacroGoal: $dailyMacroGoal';
  }

}


ProfileLocal emptyProfile(){
  return ProfileLocal(
      id: '',
      email: '',
      firstName: '',
      lastName: '',
      age: '',
      gender: FEMALE_LABEL,
      weight: '',
      height: '',
      weightUnit: LB_LABEL,
      heightUnit: FT_LABEL,
      goalWeight: '',
      dailyMacroGoal: ['2197', '220', '165', '73'],
      activityLevel: SEDENTARY_LABEL,
      weightChangeWeekly: LB_1_LABEL,
      favoriteCategories: [],
      hateCategories: [],
      favoriteSubCategories: [],
      hateSubCategories: [],
      mainDishTypes: ['Breakfast', 'Lunch', 'Dinner'],
      sideDishTypes: ['Dessert', 'Beverage'],
      allergens: []
  );
}