


import 'package:masterpie/feature/foods/data/remote/model/generic_food_remote_model.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';

import '../../domain/model/food_model.dart';
import '../../domain/model/food_type.dart';
import '../../domain/model/suggested_foods_portion_model.dart';
import '../local/model/food_local_model.dart';
import '../local/model/food_type_local.dart';
import '../local/model/international_meal_local_model.dart';
import '../local/model/logged_foods_local_model.dart';
import '../local/model/my_food_local_model.dart';
import '../remote/model/food_remote_model.dart';
import '../remote/model/food_type_remote.dart';
import '../remote/model/suggested_foods_portion_remote_model.dart';
import 'foods_mapper.dart';

class FoodsMapperImpl extends FoodsMapper{

  @override
  List<Food> fromMealsLocal(foodsLocal) {
    return foodsLocal.map((foodLocal) =>
        fromMealLocal(foodLocal)
    ).toList();
  }

  @override
  List<Food> fromGroceryProductsLocal(List<FoodLocal> foodsLocal) {
    return foodsLocal.map((foodLocal) =>
        Food(
            id: foodLocal.foodId,
            foodType: FoodType.groceryProduct,
            name: foodLocal.name,
            barcode: foodLocal.barcode,
            brandName: foodLocal.brandName,
            description: foodLocal.description,
            nationality: '',
            image: foodLocal.image,
            servingAmounts: foodLocal.servingAmounts,
            ingredients: [],
            servingIngredientsCount: [],
            units: foodLocal.units,
            recipe: '',
            calorie: foodLocal.calorie,
            protein: foodLocal.protein,
            carb: foodLocal.carb,
            fat: foodLocal.fat,
            diets: [],
            allergies: [],
            servingAmount: 0,
            unit: '',
        )
    ).toList();
  }

  @override
  List<Food> fromMealsRemote(List<FoodRemote> mealsRemote) {
    return mealsRemote.map((mealRemote) =>
        Food(
          id: mealRemote.id,
          foodType: FoodType.meal,
          name: mealRemote.name,
          brandName: mealRemote.brandName,
          description: mealRemote.description,
          nationality: mealRemote.nationality,
          image: mealRemote.image,
          servingAmounts: mealRemote.servingAmounts,
          ingredients: mealRemote.ingredients,
          servingIngredientsCount: mealRemote.servingIngredientsCount,
          units: mealRemote.units,
          recipe: mealRemote.recipe,
          calorie: mealRemote.calorie,
          protein: mealRemote.protein,
          carb: mealRemote.carb,
          fat: mealRemote.fat,
          diets: mealRemote.diets,
          allergies: mealRemote.allergies,
          servingAmount: mealRemote.servingAmount,
          unit: mealRemote.unit
        )
    ).toList();
  }

  @override
  List<GenericFood> fromGroceryProductsRemote(List<GenericFoodRemote> productsRemote) {
    return productsRemote.map((productRemote) =>
        GenericFood(
            id: productRemote.id,
            foodType: FoodType.groceryProduct,
            name: productRemote.name,
            barcode: productRemote.barcode,
            brandName: productRemote.brandName,
            description: productRemote.description,
            nationality: '',
            image: productRemote.image,
            servingAmounts: productRemote.servingAmounts,
            ingredients: [],
            servingIngredientsCount: productRemote.servingIngredientsCount,
            units: productRemote.units,
            recipe: '',
            calorie: productRemote.calorie,
            protein: productRemote.protein,
            carb: productRemote.carb,
            fat: productRemote.fat,
            diets: [],
            allergies: [],
            servingAmount: [],
            unit: []
        )
    ).toList();
  }


  @override
  List<FoodLocal> toGroceryProductsLocal(List<Food> foods) {
    return foods.map((food) =>
        FoodLocal(
            foodId: food.id,
            foodTypeLocal: FoodTypeLocal.groceryProduct,
            name: food.name,
            barcode: food.barcode,
            brandName: food.brandName,
            description: food.description,
            nationality: '',
            image: food.image,
            servingAmounts: food.servingAmounts,
            ingredients: [],
            servingIngredientsCount: [],
            units: food.units,
            recipe: '',
            calorie: food.calorie,
            protein: food.protein,
            carb: food.carb,
            fat: food.fat,
            diets: [],
            allergies: [],
            servingAmount: 0,
            unit: '',
        )
    ).toList();
  }


  @override
  Food fromMealRemote(FoodRemote mealRemote) {
    return Food(
      id: mealRemote.id,
      foodType: FoodType.meal,
      name: mealRemote.name,
      brandName: mealRemote.brandName,
      description: mealRemote.description,
      nationality: mealRemote.nationality,
      image: mealRemote.image,
      servingAmounts: mealRemote.servingAmounts,
      ingredients: mealRemote.ingredients,
      servingIngredientsCount: mealRemote.servingIngredientsCount,
      units: mealRemote.units,
      recipe: mealRemote.recipe,
      calorie: mealRemote.calorie,
      protein: mealRemote.protein,
      carb: mealRemote.carb,
      fat: mealRemote.fat,
      diets: mealRemote.diets,
      allergies: mealRemote.allergies,
      servingAmount: mealRemote.servingAmount,
      unit: mealRemote.unit
    );
  }


  @override
  FoodLocal toMealLocal(Food food) {
    return FoodLocal(
        foodId: food.id,
        foodTypeLocal: FoodTypeLocal.meal,
        name: food.name,
        barcode: food.barcode,
        brandName: food.brandName,
        description: food.description,
        nationality: food.nationality,
        image: food.image,
        servingAmounts: food.servingAmounts,
        servingIngredientsCount: food.servingIngredientsCount,
        ingredients: food.ingredients,
        units: food.units,
        recipe: food.recipe,
        calorie: food.calorie,
        protein: food.protein,
        carb: food.carb,
        fat: food.fat,
        diets: food.diets,
        allergies: food.allergies,
        servingAmount: food.servingAmount,
        unit: food.unit,
    );
  }

  @override
  Food fromMealLocal(FoodLocal foodLocal) {
    return Food(
        id: foodLocal.foodId,
        foodType: FoodType.meal,
        name: foodLocal.name,
        brandName: foodLocal.brandName,
        description: foodLocal.description,
        nationality: foodLocal.nationality,
        image: foodLocal.image,
        servingAmounts: foodLocal.servingAmounts,
        ingredients: foodLocal.ingredients,
        servingIngredientsCount: foodLocal.servingIngredientsCount,
        units: foodLocal.units,
        recipe: foodLocal.recipe,
        calorie: foodLocal.calorie,
        protein: foodLocal.protein,
        carb: foodLocal.carb,
        fat: foodLocal.fat,
        diets: foodLocal.diets,
        allergies: foodLocal.allergies,
        servingAmount: foodLocal.servingAmount,
        unit: foodLocal.unit
    );
  }

  @override
  MyFoodLocal toMyMealLocal(Food food, String userId) {
    return MyFoodLocal(
        foodId: food.id,
        myId: userId,
        foodTypeLocal: FoodTypeLocal.meal,
        name: food.name,
        barcode: food.barcode,
        brandName: food.brandName,
        description: food.description,
        nationality: food.nationality,
        image: food.image,
        servingAmounts: food.servingAmounts,
        servingIngredientsCount: food.servingIngredientsCount,
        ingredients: food.ingredients,
        units: food.units,
        recipe: food.recipe,
        calorie: food.calorie,
        protein: food.protein,
        carb: food.carb,
        fat: food.fat,
        diets: food.diets,
        allergies: food.allergies,
        servingAmount: food.servingAmount,
        unit: food.unit,
    );
  }

  @override
  MyFoodLocal toMyGroceryLocal(Food food, String userId) {
    return MyFoodLocal(
        foodId: food.id,
        myId: userId,
        foodTypeLocal: FoodTypeLocal.groceryProduct,
        name: food.name,
        barcode: food.barcode,
        brandName: food.brandName,
        description: food.description,
        nationality: food.nationality,
        image: food.image,
        servingAmounts: food.servingAmounts,
        servingIngredientsCount: food.servingIngredientsCount,
        ingredients: food.ingredients,
        units: food.units,
        recipe: food.recipe,
        calorie: food.calorie,
        protein: food.protein,
        carb: food.carb,
        fat: food.fat,
        diets: food.diets,
        allergies: food.allergies,
        servingAmount: food.servingAmount,
        unit: food.unit
    );
  }

  @override
  List<Food> fromMyFoodsLocal(List<MyFoodLocal> foodsLocal) {
    return foodsLocal.map((food) =>
        Food(
            id: food.foodId,
            foodType: food.foodTypeLocal == FoodTypeLocal.groceryProduct ? FoodType.groceryProduct : FoodType.meal,
            name: food.name,
            barcode: food.barcode,
            brandName: food.brandName,
            description: food.description,
            nationality: food.nationality,
            image: food.image,
            servingAmounts: food.servingAmounts,
            ingredients: food.ingredients,
            servingIngredientsCount: food.servingIngredientsCount,
            units: food.units,
            recipe: food.recipe,
            calorie: food.calorie,
            protein: food.protein,
            carb: food.carb,
            fat: food.fat,
            diets: food.diets,
            allergies: food.allergies,
            servingAmount: food.servingAmount,
            unit: food.unit
        )
    ).toList();
  }

  @override
  List<Food> fromMyGroceryProductsLocal(List<MyFoodLocal> foodsLocal) {
    return foodsLocal.map((food) =>
        Food(
            id: food.foodId,
            foodType: FoodType.groceryProduct,
            name: food.name,
            barcode: food.barcode,
            brandName: food.brandName,
            description: food.description,
            nationality: '',
            image: food.image,
            servingAmounts: food.servingAmounts,
            ingredients: [],
            servingIngredientsCount: [],
            units: food.units,
            recipe: '',
            calorie: food.calorie,
            protein: food.protein,
            carb: food.carb,
            fat: food.fat,
            diets: [],
            allergies: [],
            servingAmount: 0,
            unit: ''
        )
    ).toList();
  }

  @override
  List<Food> fromMyMealsLocal(List<MyFoodLocal> foodsLocal) {
    List<Food> foods = [];
    foodsLocal.forEach((foodLocal) {
      if(foodLocal.foodTypeLocal == FoodTypeLocal.groceryProduct){
        foods.add(fromMyGroceryLocal(foodLocal));
      }else{
        foods.add(fromMyMealLocal(foodLocal));
      }
    });
    return foods;
  }

  @override
  List<MyFoodLocal> toMyFoodsLocal(List<Food> foods, String userId) {
    List<MyFoodLocal> myFoodsLocal = [];
     foods.forEach((food) {
       if(food.foodType == FoodType.groceryProduct){
         myFoodsLocal.add(toMyGroceryLocal(food, userId));
       }else{
         myFoodsLocal.add(toMyMealLocal(food, userId));
       }
     });
     return myFoodsLocal;
  }

  @override
  List<MyFoodLocal> toMyGroceryProductsLocal(List<Food> foods, String userId) {
    return foods.map((food) =>
        MyFoodLocal(
          foodId: food.id,
          myId: userId,
          foodTypeLocal: FoodTypeLocal.groceryProduct,
          name: food.name,
          barcode: food.barcode,
          brandName: food.brandName,
          description: food.description,
          nationality: '',
          image: food.image,
          servingAmounts: food.servingAmounts,
          ingredients: [],
          servingIngredientsCount: [],
          units: food.units,
          recipe: '',
          calorie: food.calorie,
          protein: food.protein,
          carb: food.carb,
          fat: food.fat,
          diets: [],
          allergies: [],
          servingAmount: 0,
          unit: ''
        )
    ).toList();
  }

  @override
  List<MyFoodLocal> toMyMealsLocal(List<Food> foods, String userId) {
    return foods.map((food) =>
        MyFoodLocal(
          foodId: food.id,
          myId: userId,
          foodTypeLocal: FoodTypeLocal.meal,
          name: food.name,
          barcode: food.barcode,
          brandName: food.brandName,
          description: food.description,
          nationality: food.nationality,
          image: food.image,
          servingAmounts: food.servingAmounts,
          ingredients: food.ingredients,
          servingIngredientsCount: [],
          units: food.units,
          recipe: food.recipe,
          calorie: food.calorie,
          protein: food.protein,
          carb: food.carb,
          fat: food.fat,
          diets: food.diets,
          allergies: food.allergies,
          servingAmount: food.servingAmount,
          unit: food.unit
        )
    ).toList();
  }

  @override
  Food fromMyGroceryLocal(MyFoodLocal food) {
    return  Food(
        id: food.foodId,
        foodType: FoodType.groceryProduct,
        name: food.name,
        barcode: food.barcode,
        brandName: food.brandName,
        description: food.description,
        nationality: '',
        image: food.image,
        servingAmounts: food.servingAmounts,
        ingredients: [],
        servingIngredientsCount: [],
        units: food.units,
        recipe: '',
        calorie: food.calorie,
        protein: food.protein,
        carb: food.carb,
        fat: food.fat,
        diets: [],
        allergies: [],
        servingAmount: 0,
        unit: ''
    );
  }

  @override
  Food fromMyMealLocal(MyFoodLocal food) {
    return  Food(
        id: food.foodId,
        foodType: FoodType.meal,
        name: food.name,
        barcode: food.barcode,
        brandName: food.brandName,
        description: food.description,
        nationality: food.nationality,
        image: food.image,
        servingAmounts: food.servingAmounts,
        ingredients: food.ingredients,
        servingIngredientsCount: food.servingIngredientsCount,
        units: food.units,
        recipe: food.recipe,
        calorie: food.calorie,
        protein: food.protein,
        carb: food.carb,
        fat: food.fat,
        diets: food.diets,
        allergies: food.allergies,
        servingAmount: food.servingAmount,
        unit: food.unit
    );
  }

  @override
  List<Food> fromInternationalMealsLocal(List<InternationalMealLocal> foodsLocal) {
    return foodsLocal.map((food) =>
        Food(
            id: food.id.toString(),
            foodType: FoodType.meal,
            name: food.name,
            barcode: food.barcode,
            brandName: food.brandName,
            description: food.description,
            nationality: food.nationality,
            image: food.image,
            servingAmounts: food.servingAmounts,
            ingredients: food.ingredients,
            servingIngredientsCount: food.servingIngredientsCount,
            units: food.units,
            recipe: food.recipe,
            calorie: food.calorie,
            protein: food.protein,
            carb: food.carb,
            fat: food.fat,
            diets: food.diets,
            allergies: food.allergies,
            servingAmount: food.servingAmount,
            unit: food.unit,
        )
    ).toList();
  }

  @override
  FoodRemote toGroceryRemote(Food food) {
    return  FoodRemote(
        id: food.id,
        foodTypeRemote: FoodTypeRemote.groceryProduct,
        name: food.name,
        barcode: food.barcode,
        brandName: food.brandName,
        description: food.description,
        nationality: '',
        image: food.image,
        servingAmounts: food.servingAmounts,
        ingredients: [],
        servingIngredientsCount: [],
        units: food.units,
        recipe: '',
        calorie: food.calorie,
        protein: food.protein,
        carb: food.carb,
        fat: food.fat,
        diets: [],
        allergies: [],
        servingAmount: 0,
        unit: ''
    );
  }

  @override
  List<InternationalMealLocal> toInternationalMealsLocal(List<Food> foods) {
    return foods.map((food) =>
        InternationalMealLocal(
            id: 0,
            name: food.name,
            barcode: food.barcode,
            brandName: food.brandName,
            description: food.description,
            nationality: food.nationality,
            image: food.image,
            servingAmounts: food.servingAmounts,
            ingredients: food.ingredients,
            servingIngredientsCount: food.servingIngredientsCount,
            units: food.units,
            recipe: food.recipe,
            calorie: food.calorie,
            protein: food.protein,
            carb: food.carb,
            fat: food.fat,
            diets: food.diets,
            allergies: food.allergies,
            servingAmount: food.servingAmount,
            unit: food.unit,
        )
    ).toList();
  }

  @override
  FoodRemote toMealRemote(Food food) {
    return FoodRemote(
        id: food.id,
        foodTypeRemote: FoodTypeRemote.meal,
        name: food.name,
        barcode: food.barcode,
        brandName: food.brandName,
        description: food.description,
        nationality: food.nationality,
        image: food.image,
        servingAmounts: food.servingAmounts,
        servingIngredientsCount: food.servingIngredientsCount,
        ingredients: food.ingredients,
        units: food.units,
        recipe: food.recipe,
        calorie: food.calorie,
        protein: food.protein,
        carb: food.carb,
        fat: food.fat,
        diets: food.diets,
        allergies: food.allergies,
        servingAmount: food.servingAmount,
        unit: food.unit
    );
  }

  @override
  FoodLocal toGroceryLocal(Food food) {
    return FoodLocal(
        foodId: food.id,
        foodTypeLocal: FoodTypeLocal.groceryProduct,
        name: food.name,
        barcode: food.barcode,
        brandName: food.brandName,
        description: food.description,
        nationality: food.nationality,
        image: food.image,
        servingAmounts: food.servingAmounts,
        servingIngredientsCount: food.servingIngredientsCount,
        ingredients: food.ingredients,
        units: food.units,
        recipe: food.recipe,
        calorie: food.calorie,
        protein: food.protein,
        carb: food.carb,
        fat: food.fat,
        diets: food.diets,
        allergies: food.allergies,
        servingAmount: food.servingAmount,
        unit: food.unit,
    );
  }

  @override
  List<SuggestedFoodsPortion> fromSuggestedFoodsPortionRemote(List<SuggestedFoodsPortionRemote> suggestedFoodsPortionRemote) {
    return suggestedFoodsPortionRemote.map((suggestedFoods) =>
        SuggestedFoodsPortion(
            foods: fromFoodsRemote(suggestedFoods.foods),
          accuracy: suggestedFoods.accuracy,
          totalMacro: suggestedFoods.totalMacro
        )
    ).toList();
  }

  @override
  List<Food> fromFoodsRemote(List<FoodRemote> foods) {
    return foods.map((food) =>
        Food(
            id: food.id,
            foodType: food.foodTypeRemote == FoodTypeRemote.groceryProduct ? FoodType.groceryProduct : FoodType.meal,
            name: food.name,
            barcode: food.barcode,
            brandName: food.brandName,
            description: food.description,
            nationality: food.nationality,
            image: food.image,
            servingAmounts: food.servingAmounts,
            ingredients: food.ingredients,
            servingIngredientsCount: food.servingIngredientsCount,
            units: food.units,
            recipe: food.recipe,
            calorie: food.calorie,
            protein: food.protein,
            carb: food.carb,
            fat: food.fat,
            diets: food.diets,
            allergies: food.allergies,
            servingAmount: food.servingAmount,
            unit: food.unit,
            count: food.count
        )
    ).toList();
  }

  @override
  List<FoodRemote> toFoodsRemote(List<Food> foods) {
    return foods.map((food) =>
        FoodRemote(
          foodTypeRemote: food.foodType == FoodType.groceryProduct ? FoodTypeRemote.groceryProduct : FoodTypeRemote.meal,
          name: food.name,
          barcode: food.barcode,
          brandName: food.brandName,
          description: food.description,
          nationality: food.nationality,
          image: food.image,
          servingAmounts: food.servingAmounts,
          ingredients: food.ingredients,
          servingIngredientsCount: food.servingIngredientsCount,
          units: food.units,
          recipe: food.recipe,
          calorie: food.calorie,
          protein: food.protein,
          carb: food.carb,
          fat: food.fat,
          diets: food.diets,
          allergies: food.allergies,
          servingAmount: food.servingAmount,
          unit: food.unit,
          count: food.count
        )
    ).toList();
  }

  @override
  List<Food> fromLoggedFoodsLocal(List<LoggedFoodsLocal> foods) {
    return foods.map((food) =>
        Food(
            id: food.id,
            foodType: food.foodTypeLocal == FoodTypeLocal.groceryProduct ? FoodType.groceryProduct : FoodType.meal,
            name: food.name,
            barcode: food.barcode,
            brandName: food.brandName,
            description: food.description,
            nationality: food.nationality,
            image: food.image,
            servingAmounts: food.servingAmounts,
            ingredients: food.ingredients,
            servingIngredientsCount: food.servingIngredientsCount,
            units: food.units,
            recipe: food.recipe,
            calorie: food.calorie,
            protein: food.protein,
            carb: food.carb,
            fat: food.fat,
            diets: food.diets,
            allergies: food.allergies,
            servingAmount: food.servingAmount,
            unit: food.unit,
            count: double.parse(food.count),
        )
    ).toList();
  }

  @override
  List<LoggedFoodsLocal> toLoggedFoodsLocal(List<Food> foods, String date, String myId) {
    return foods.map((food) =>
        LoggedFoodsLocal(
          id: food.id,
          date: date,
          myId: myId,
          foodTypeLocal: food.foodType == FoodType.groceryProduct ? FoodTypeLocal.groceryProduct : FoodTypeLocal.meal,
          name: food.name,
          barcode: food.barcode,
          brandName: food.brandName,
          description: food.description,
          nationality: food.nationality,
          image: food.image,
          servingAmounts: food.servingAmounts,
          ingredients: food.ingredients,
          servingIngredientsCount: food.servingIngredientsCount,
          units: food.units,
          recipe: food.recipe,
          calorie: food.calorie,
          protein: food.protein,
          carb: food.carb,
          fat: food.fat,
          diets: food.diets,
          allergies: food.allergies,
          servingAmount: food.servingAmount,
          unit: food.unit,
          count: food.count.toString(),
        )
    ).toList();
  }

  @override
  MyFoodLocal toMyFoodLocal(Food food, String userId) {
    if(food.foodType == FoodType.groceryProduct){
      return toMyGroceryLocal(food, userId);
    }else{
      return toMyMealLocal(food, userId);
    }
  }

  @override
  Food fromGenericFoodToFood(GenericFood genericFood) {
    // TODO: implement fromGenericFoodToFood
    throw UnimplementedError();
  }




}