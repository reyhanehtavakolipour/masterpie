

import 'package:masterpie/feature/foods/data/remote/model/fat_secret_foods_info_remote_model.dart';
import 'package:masterpie/feature/foods/data/remote/model/wizard_response_remote_model.dart';
import 'package:masterpie/feature/foods/domain/model/fat_secret_foods_info_model.dart';
import 'package:masterpie/feature/foods/domain/model/wizard_response_model.dart';

import '../../domain/model/food_model.dart';
import '../../domain/model/generic_food_model.dart';
import '../../domain/model/meal_plan_model.dart';
import '../../domain/model/suggested_foods_portion_model.dart';
import '../local/model/food_local_model.dart';
import '../local/model/international_meal_local_model.dart';
import '../local/model/logged_foods_local_model.dart';
import '../local/model/meal_plan_local_model.dart';
import '../local/model/my_food_local_model.dart';
import '../remote/model/food_remote_model.dart';
import '../remote/model/generic_food_remote_model.dart';
import '../remote/model/meal_plan_remote_model.dart';
import '../remote/model/suggested_foods_portion_remote_model.dart';

abstract class FoodsMapper{

  List<Food> fromMealsLocal(foodsLocal);

  List<Food> fromMyMealsLocal(List<MyFoodLocal> foodsLocal);

  List<Food> fromGroceryProductsLocal(List<FoodLocal> foodsLocal);

  List<Food> fromMyGroceryProductsLocal(List<MyFoodLocal> foodsLocal);


  List<Food> fromMealsRemote(List<FoodRemote> mealsRemote);

  Food fromMealRemote(FoodRemote mealRemote);

  Food fromMealLocal(FoodLocal foodLocal);

  Food fromGenericFoodToFood(GenericFood genericFood);

  List<GenericFood> fromGroceryProductsRemote(List<GenericFoodRemote> productsRemote);

  GenericFood fromGenericFoodRemote(GenericFoodRemote productRemote);

  List<GenericFood> fromGenericFoodsRemote(List<GenericFoodRemote> foods);

  List<GenericFood> fromRecipesRemote(List<GenericFoodRemote> productsRemote);

  List<FoodLocal> toGroceryProductsLocal(List<Food> foods);

  List<MyFoodLocal> toMyGroceryProductsLocal(List<Food> foods, String userId);

  List<MyFoodLocal> toMyFoodsLocal(List<Food> foods, String userId);

  MyFoodLocal toMyFoodLocal(Food food, String userId);

  List<MyFoodLocal> toMyMealsLocal(List<Food> foods, String userId);

  FoodLocal toMealLocal(Food food);

  List<InternationalMealLocal> toInternationalMealsLocal(List<Food> foods);

  FoodRemote toMealRemote(Food food);

  FoodRemote toGroceryRemote(Food food);

  MyFoodLocal toMyMealLocal(Food food, String userId);

  MyFoodLocal toMyGroceryLocal(Food food, String userId);

  Food fromMyGroceryLocal(MyFoodLocal foodLocal);

  Food fromMyMealLocal(MyFoodLocal foodLocal);

  List<Food> fromMyFoodsLocal(List<MyFoodLocal> foodsLocal);

  List<Food> fromInternationalMealsLocal(List<InternationalMealLocal> foodsLocal);

  FoodLocal toGroceryLocal(Food food);

  WizardResponseModel fromWizardResponseRemote(WizardResponseRemoteModel wizardResponseRemoteModel);

  List<Food> fromFoodsRemote(List<FoodRemote> foods);

  List<FoodRemote> toFoodsRemote(List<Food> foods);

  List<Food> fromLoggedFoodsLocal(List<LoggedFoodsLocal> foods);

  List<LoggedFoodsLocal> toLoggedFoodsLocal(List<Food> foods, String date, String myId);

  FatSecretFoodsInfo fromFatSecretFoodsInfoRemote(FatSecretFoodsInfoRemote fatSecretFoodsInfoRemote);



  List<FoodLocal> toFoodsLocal(List<Food> foods);

  List<MealPlan> fromMealPlansLocal(List<MealPlanLocal> mealPlansLocal);

  List<MealPlan> fromMealPlansRemote(List<MealPlanRemote> mealPlansRemote);

  List<MealPlanRemote> toMealPlansRemote(List<MealPlan> mealPlans);

  List<MealPlanLocal> toMealPlansLocal(List<MealPlan> mealPlans);

  MealPlanLocal toMealPlanLocal(MealPlan mealPlan);

  MealPlanRemote toMealPlanRemote(MealPlan mealPlan);


}