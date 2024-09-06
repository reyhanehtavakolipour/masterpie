


import 'package:masterpie/feature/foods/data/local/model/meal_plan_local_model.dart';
import 'package:masterpie/feature/foods/data/remote/model/fat_secret_foods_info_remote_model.dart';
import 'package:masterpie/feature/foods/data/remote/model/generic_food_remote_model.dart';
import 'package:masterpie/feature/foods/data/remote/model/meal_plan_remote_model.dart';
import 'package:masterpie/feature/foods/data/remote/model/wizard_response_remote_model.dart';
import 'package:masterpie/feature/foods/domain/model/fat_secret_foods_info_model.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/domain/model/meal_plan_model.dart';
import 'package:masterpie/feature/foods/domain/model/wizard_response_model.dart';
import 'package:masterpie/util/core/helper/request_api.dart';

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
            prepTime: '',
            servingAmount: 0,
          unit: '',
          createdFromFatSecretRecipes: 0
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
          ingredients: mealRemote.ingredients,
          servingIngredientsCount: mealRemote.servingIngredientsCount,
          units: mealRemote.units,
          recipe: mealRemote.recipe,
          calorie: mealRemote.calorie,
          protein: mealRemote.protein,
          carb: mealRemote.carb,
          fat: mealRemote.fat,
          diets: mealRemote.diets,
          prepTime: mealRemote.prepTime,
          allergies: mealRemote.allergies,
          servingAmount: mealRemote.servingAmount,
            unit: mealRemote.unit,
            servingAmounts: mealRemote.servingAmounts,
            createdFromFatSecretRecipes: mealRemote.createdFromFatSecretRecipes
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
            prepTime: '',
            unit: [],
            createdFromFatSecretRecipes: 0
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
            ingredients: [],
            servingIngredientsCount: [],
            units: food.units,
            recipe: '',
            calorie: food.calorie,
            protein: food.protein,
            carb: food.carb,
            fat: food.fat,
            diets: [],
            count: food.count,
            allergies: [],
            servingAmount: 0,
          unit: '', servingAmounts: [],
            createdFromFatSecretRecipes: 0
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
        unit: mealRemote.unit,
        prepTime: mealRemote.prepTime,
        servingAmounts: mealRemote.servingAmounts,
        createdFromFatSecretRecipes: mealRemote.createdFromFatSecretRecipes
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
        servingIngredientsCount: food.servingIngredientsCount,
        ingredients: food.ingredients,
        units: food.units,
        recipe: food.recipe,
        calorie: food.calorie,
        protein: food.protein,
        carb: food.carb,
        fat: food.fat,
        count: food.count,
        diets: food.diets,
        allergies: food.allergies,
        servingAmount: food.servingAmount,
      unit: food.unit,
        servingAmounts: food.servingAmounts,
        createdFromFatSecretRecipes: food.createdFromFatSecretRecipes
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
        unit: foodLocal.unit,
        servingAmounts: foodLocal.servingAmounts,
        createdFromFatSecretRecipes: foodLocal.createdFromFatSecretRecipes
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
        servingAmounts: food.servingAmounts,
        createdFromFatSecretRecipes: food.createdFromFatSecretRecipes
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
        unit: food.unit, servingAmounts: [],
        createdFromFatSecretRecipes: 0
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
            servingAmounts: food.servingAmounts,
            unit: food.unit,
            createdFromFatSecretRecipes: food.createdFromFatSecretRecipes
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
            createdFromFatSecretRecipes: 0
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
            unit: '', servingAmounts: [],
            createdFromFatSecretRecipes: 0
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
            servingAmounts: food.servingAmounts,
            servingAmount: food.servingAmount,
          unit: food.unit,
            createdFromFatSecretRecipes: food.createdFromFatSecretRecipes
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
        createdFromFatSecretRecipes: 0
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
        servingAmounts: food.servingAmounts,
        createdFromFatSecretRecipes: food.createdFromFatSecretRecipes
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
        prepTime: '',
        unit: '',
        createdFromFatSecretRecipes: 0
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
          servingAmounts: food.servingAmounts,
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
        servingAmounts: food.servingAmounts,
        prepTime: food.prepTime,
        createdFromFatSecretRecipes: food.createdFromFatSecretRecipes
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
        servingIngredientsCount: food.servingIngredientsCount,
        ingredients: food.ingredients,
        units: food.units,
        recipe: food.recipe,
        calorie: food.calorie,
        protein: food.protein,
        carb: food.carb,
        fat: food.fat,
        count: food.count,
        diets: food.diets,
        allergies: food.allergies,
        servingAmount: food.servingAmount,
      unit: food.unit,
        servingAmounts: food.servingAmounts,
        createdFromFatSecretRecipes: 0
    );
  }

  @override
  WizardResponseModel fromWizardResponseRemote(WizardResponseRemoteModel wizardResponseRemoteModel) {
    return WizardResponseModel(
      foodsPortions: wizardResponseRemoteModel.foodsPortions.map((suggestedFoods) =>
          SuggestedFoodsPortion(
              foods: fromFoodsRemote(suggestedFoods.foods),
              accuracy: suggestedFoods.accuracy,
              totalMacro: suggestedFoods.totalMacro,
            foodsIndexesNotAddedByUser: suggestedFoods.foodsIndexesNotAddedByUser
          )
      ).toList(),
      messages: wizardResponseRemoteModel.messages,
    );
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
            ingredients: food.ingredients,
            servingIngredientsCount: food.servingIngredientsCount,
            units: food.units,
            recipe: food.recipe,
            calorie: food.calorie,
            protein: food.protein,
            carb: food.carb,
            fat: food.fat,
            diets: food.diets,
            dishType: food.dishType,
            allergies: food.allergies,
            servingAmount: food.servingAmount,
            unit: food.unit,
            count: food.count,
            isAddedByUser: food.isAddedByUser,
            prepTime: food.prepTime,
            servingAmounts: food.servingAmounts,
            createdFromFatSecretRecipes: food.createdFromFatSecretRecipes
        )
    ).toList();
  }

  @override
  List<FoodRemote> toFoodsRemote(List<Food> foods) {
    return foods.map((food) =>
        FoodRemote(
          foodTypeRemote: food.foodType == FoodType.groceryProduct ? FoodTypeRemote.groceryProduct : FoodTypeRemote.meal,
          name: food.name,
          id: food.id,
          barcode: food.barcode,
          brandName: food.brandName,
          description: food.description,
          nationality: food.nationality,
          image: food.image,
          ingredients: food.ingredients,
          servingIngredientsCount: food.servingIngredientsCount,
          units: food.units,
          recipe: food.recipe,
          calorie: food.calorie,
          protein: food.protein,
          carb: food.carb,
          fat: food.fat,
          diets: food.diets,
          dishType: food.dishType,
          allergies: food.allergies,
          servingAmount: food.servingAmount,
          unit: food.unit,
            count: food.count,
            isAddedByUser: food.isAddedByUser,
            prepTime: food.prepTime,
            servingAmounts: food.servingAmounts,
            createdFromFatSecretRecipes: food.createdFromFatSecretRecipes
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
            servingAmounts: food.servingAmounts,
            count: double.parse(food.count),
            createdFromFatSecretRecipes: food.createdFromFatSecretRecipes
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
          servingAmounts: food.servingAmounts,
          createdFromFatSecretRecipes: food.createdFromFatSecretRecipes
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
    throw UnimplementedError();
  }

  @override
  List<GenericFood> fromRecipesRemote(List<GenericFoodRemote> productsRemote) {
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
            ingredients: productRemote.ingredients,
            servingIngredientsCount: productRemote.servingIngredientsCount,
            units: productRemote.units,
            recipe: productRemote.recipe,
            calorie: productRemote.calorie,
            protein: productRemote.protein,
            carb: productRemote.carb,
            fat: productRemote.fat,
            diets: [],
            allergies: [],
            prepTime: productRemote.prepTime,
            servingAmount: productRemote.servingAmount,
            unit: productRemote.unit,
            createdFromFatSecretRecipes: productRemote.createdFromFatSecretRecipes
        )
    ).toList();
  }

  @override
  GenericFood fromGenericFoodRemote(GenericFoodRemote productRemote) {
    return GenericFood(
        id: productRemote.id,
        foodType: FoodType.groceryProduct,
        name: productRemote.name,
        barcode: productRemote.barcode,
        brandName: productRemote.brandName,
        description: productRemote.description,
        nationality: '',
        image: productRemote.image,
        ingredients: productRemote.ingredients,
        servingIngredientsCount: productRemote.servingIngredientsCount,
        units: productRemote.units,
        recipe: productRemote.recipe,
        calorie: productRemote.calorie,
        protein: productRemote.protein,
        carb: productRemote.carb,
        fat: productRemote.fat,
        diets: [],
        allergies: [],
        prepTime: productRemote.prepTime,
        servingAmount: productRemote.servingAmount,
        unit: productRemote.unit,
        createdFromFatSecretRecipes: productRemote.createdFromFatSecretRecipes
    );
  }

  @override
  FatSecretFoodsInfo fromFatSecretFoodsInfoRemote(FatSecretFoodsInfoRemote fatSecretFoodsInfoRemote) {
    return FatSecretFoodsInfo(
      recipeTypes: fatSecretFoodsInfoRemote.recipeTypes,
      categories: fatSecretFoodsInfoRemote.categories,
      allergens: fatSecretFoodsInfoRemote.allergens
    );
  }

  @override
  List<GenericFood> fromGenericFoodsRemote(List<GenericFoodRemote> foods) {
    return foods.map((genericRemote) =>
    GenericFood(
      id: genericRemote.id,
      foodType: FoodType.groceryProduct,
      name: genericRemote.name,
      barcode: genericRemote.barcode,
      brandName: genericRemote.brandName,
      description: genericRemote.description,
      nationality: '',
      image: genericRemote.image,
      ingredients: genericRemote.ingredients,
      servingIngredientsCount: genericRemote.servingIngredientsCount,
      units: genericRemote.units,
      recipe: genericRemote.recipe,
      calorie: genericRemote.calorie,
      protein: genericRemote.protein,
      carb: genericRemote.carb,
      fat: genericRemote.fat,
      diets: [],
      allergies: [],
        prepTime: genericRemote.prepTime,
        servingAmount: genericRemote.servingAmount,
      unit: genericRemote.unit,
        createdFromFatSecretRecipes: genericRemote.createdFromFatSecretRecipes
    )
    ).toList();
  }

  @override
  List<MealPlan> fromMealPlansLocal(List<MealPlanLocal> mealPlansLocal) {
    // TODO: implement fromMealPlansLocal
    throw UnimplementedError();
  }

  @override
  List<MealPlan> fromMealPlansRemote(List<MealPlanRemote> mealPlansRemote) {
    return mealPlansRemote.map((mealPlan) =>
        MealPlan(
            mealPlanId: mealPlan.mealPlanId,
            foods: fromFoodsRemote(mealPlan.foods),
            name: mealPlan.name,
            totalMacro: mealPlan.totalMacro,
        )
    ).toList();
  }

  @override
  MealPlanLocal toMealPlanLocal(MealPlan mealPlan) {
    return MealPlanLocal(
      mealPlanId: mealPlan.mealPlanId,
      foods: toFoodsLocal(mealPlan.foods),
      name: mealPlan.name,
      totalMacro: mealPlan.totalMacro,
    );
  }

  @override
  MealPlanRemote toMealPlanRemote(MealPlan mealPlan) {
    return MealPlanRemote(
      mealPlanId: mealPlan.mealPlanId,
      foods: toFoodsRemote(mealPlan.foods),
      name: mealPlan.name,
      totalMacro: mealPlan.totalMacro,
    );
  }

  @override
  List<MealPlanLocal> toMealPlansLocal(List<MealPlan> mealPlans) {
    return mealPlans.map((mealPlan) =>
        MealPlanLocal(
          mealPlanId: mealPlan.mealPlanId,
          foods: toFoodsLocal(mealPlan.foods),
          name: mealPlan.name,
          totalMacro: mealPlan.totalMacro,
        )
    ).toList();
  }

  @override
  List<MealPlanRemote> toMealPlansRemote(List<MealPlan> mealPlans) {
    return mealPlans.map((mealPlan) =>
        MealPlanRemote(
          mealPlanId: mealPlan.mealPlanId,
          foods: toFoodsRemote(mealPlan.foods),
          name: mealPlan.name,
          totalMacro: mealPlan.totalMacro,
        )
    ).toList();
  }

  @override
  List<FoodLocal> toFoodsLocal(List<Food> foods) {
    return foods.map((food) =>
        FoodLocal(
            foodTypeLocal: food.foodType == FoodType.groceryProduct ? FoodTypeLocal.groceryProduct : FoodTypeLocal.meal,
            name: food.name,
            barcode: food.barcode,
            brandName: food.brandName,
            description: food.description,
            nationality: food.nationality,
            image: food.image,
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
            count: food.count,
            servingAmounts: food.servingAmounts,
            createdFromFatSecretRecipes: food.createdFromFatSecretRecipes,
            foodId: food.id
        )
    ).toList();
  }




}