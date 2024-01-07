


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
        'dailyMacroGoal: $dailyMacroGoal';
  }

}