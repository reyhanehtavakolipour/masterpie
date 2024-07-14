



import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/foods/domain/repository/foods_repository.dart';
import 'package:masterpie/feature/user/data/local/model/profile_local.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import 'package:masterpie/util/core/helper/request_api.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../../../foods/domain/model/food_model.dart';
import '../model/profile_model.dart';
import '../repository/user_repository.dart';

class RegisterUseCase{

  final userRepo = serviceLocator<UserRepository>();
  final repo = serviceLocator<FoodsRepository>();


  Future<Either<Failure, String>> registerWithCredentials(String email, String password) async{
    final registerResponseRemote = await userRepo.registerUserWithCredentialInRemote(email, password);
    if(registerResponseRemote.isRight()){
      final loginResponseRemote = await userRepo.loginUserWithCredentialInRemote(email, password);
      if(loginResponseRemote.isRight()){
        await userRepo.saveUserEmailInHive(email);
        await userRepo.saveUserPasswordInHive(password);
        await userRepo.saveUserIdInHive(loginResponseRemote.asRight());
        await userRepo.setUserSubscriptionPlanAfterRegisterInRemote();

        // profile
        final profileResponse= await userRepo.getProfileFromLocal();
        Profile profile= profileResponse.isRight() ? profileResponse.asRight() : Profile();
        profile= profile.copyWith(id: loginResponseRemote.asRight(), email: email);
        await userRepo.insertUserProfileInLocal(profile);
        await userRepo.upsertProfileInRemote(profile);

        //favorite foods
        final favoriteFoodsResponse= await repo.getMyFoodsFromLocalDb('');
        List<Food> foods= favoriteFoodsResponse.isRight() ? favoriteFoodsResponse.asRight() : [];
        List<Food> updatedFoods = foods.map((food) {
          return food.copyWith(id: generateRandomId());
        }).toList();
        await repo.saveMyFoodsToLocalDb(updatedFoods);
        await repo.saveMyFoodsToRemote(updatedFoods);


        //cookbook foods
        final cookBookFoodsResponse= await repo.getMyCookBookFoodsFromLocalDb('');
        List<Food> cookBookFoods= cookBookFoodsResponse.isRight() ? cookBookFoodsResponse.asRight() : [];
        List<Food> updatedCookBookFoods = cookBookFoods.map((food) {
          return food.copyWith(id: generateRandomId());
        }).toList();
        await repo.saveMyCookBookFoodsToLocalDb(updatedCookBookFoods);
        await repo.saveFoodsToMyCookBookRemote(updatedCookBookFoods);


        //logged foods
        final loggedFoodsResponse= await repo.getAllLoggedFoodsFromLocalDb();
        List<Food> loggedFoods= loggedFoodsResponse.isRight() ? loggedFoodsResponse.asRight() : [];
        List<Food> updatedLoggedFoods = loggedFoods.map((food) {
          return food.copyWith(id: generateRandomId());
        }).toList();
        await repo.saveLoggedFoodsToLocalDb(updatedLoggedFoods, DateFormat('yyyy-MM-dd').format(DateTime.now()));
        await repo.logFoodsInRemote(updatedLoggedFoods);


        return  Right(email);
      }
      return Left(getFailure(const FailureResponse('User already registered')));
    }
    if(registerResponseRemote.asLeft().message == 'User already registered'){
      return Left(getFailure(const FailureResponse('User already registered')));
    }
    return Left(getFailure(registerResponseRemote.asLeft()));
  }


  Future<Either<Failure, String>> registerWithGoogle() async{
    final registerResponseRemote = await userRepo.registerUserWithGoogleInRemote();
    if(registerResponseRemote.isRight()){
      await userRepo.saveUserIdInHive(registerResponseRemote.asRight().id);
      await userRepo.saveUserEmailInHive(registerResponseRemote.asRight().email);
      await userRepo.saveUserPasswordInHive('');
      await userRepo.setUserSubscriptionPlanAfterRegisterInRemote();
      await userRepo.updateProfileInLocal(Profile(id: registerResponseRemote.asRight().id, email: registerResponseRemote.asRight().email));
      return Right(registerResponseRemote.asRight().email);
    }
    return Left(getFailure(registerResponseRemote.asLeft()));
  }

}
