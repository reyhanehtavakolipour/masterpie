




enum FoodTypeLocal{
  groceryProduct,
  meal
}


FoodTypeLocal getFoodType(String type){
  if(type == FoodTypeLocal.groceryProduct.name){
    return FoodTypeLocal.groceryProduct;
  }
  return FoodTypeLocal.meal;
}