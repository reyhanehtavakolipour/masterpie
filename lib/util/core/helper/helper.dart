

import 'dart:math';

int calculateDifferenceInDays(DateTime date1, DateTime date2) {

  Duration difference = date2.difference(date1);

  int differenceInDays = difference.inDays;

  return differenceInDays;
}


int generateRandomNumber(int length) {
  Random random = Random();
  int randomNumber = random.nextInt(length);
  print('random_number: $randomNumber');
  return randomNumber;
}


int getIngredientAmountInGrams(String unit){
  if(unit.contains('oz')){
    return 28;
  }else if(unit.contains('tsp')){
    return 5;
  }else if(unit.contains('tbsp') || unit.contains('tablespoon')){
    return 15;
  }else if(unit.contains('cup')){
    return 240;
  }else if(unit.contains('pt')){
    return 480;
  }else if(unit.contains('qt')){
    return 960;
  }else if(unit.contains('gl')){
    return 3840;
  }else if(unit.contains('stick')){
    return 113;
  }else if(unit.contains('lb')){
    return 454;
  }else if(unit.contains('package')){
    return 280;
  }
  return 0;
}

double roundToQuarter(double number) {
  return (number * 4).round() / 4;
}