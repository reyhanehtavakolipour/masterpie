


import '../../../feature/foods/data/repository_impl/foods_repository_impl.dart';
import '../constant/messages_constants.dart';
import '../constant/sqflite_constants.dart';
import '../response/failure.dart';

Failure getFailure(Failure failure){
  final errorMsg = failure.message;
  final errorCode = failure.errorCode;
  return failureHandler(errorMsg, errorCode);
}

Failure failureHandler(String message, int? errorCode){
  print('ORIGINAL_ERROR_MESSAGE: $message');
  if(errorCode != null){
    switch(errorCode){
      case 400:
        return FailureResponse(getError400(message));
      case 401:
        return FailureResponse(getError401(message));
      case 403:
        return FailureResponse(getError403(message));
      case 404:
        return FailureResponse(getError404(message));
      case 422:
        return FailureResponse(getError422(message));
      case 500:
        return FailureResponse(getError500(message));
    }
  }
  if(message.contains('For security purposes, you can only request this once every 60 seconds')){
    return const FailureResponse(ERROR_RESET_PASS_REQUEST_EACH_60_SEC);
  }
  if(message.contains('User already registered')){
    return const FailureResponse(ERROR_USER_ALREADY_REGISTERED);
  }
  if(message.contains(ERROR_FREE_USER_FAVORITE_FOOD_NOT_ALLOWED)){
    return const FailureResponse(ERROR_FREE_USER_FAVORITE_FOOD_NOT_ALLOWED);
  }
  if(message.contains(ERROR_PAID_USER_FOODS_PORTION_OVER_LIMIT)){
    return const FailureResponse(ERROR_PAID_USER_FOODS_PORTION_OVER_LIMIT);
  }
  if(message.contains(ERROR_PAID_USER_SUGGEST_FOOD_OVER_LIMIT)){
    return const FailureResponse(ERROR_PAID_USER_SUGGEST_FOOD_OVER_LIMIT);
  }
  if(message.contains(ERROR_FREE_USER_FOODS_PORTION_NOT_ALLOWED)){
    return const FailureResponse(ERROR_FREE_USER_FOODS_PORTION_NOT_ALLOWED);
  }
  if(message.contains(ERROR_FREE_USER_SUGGEST_FOOD_NOT_ALLOWED)){
    return const FailureResponse(ERROR_FREE_USER_SUGGEST_FOOD_NOT_ALLOWED);
  }
  if(message.contains(ERROR_INTERNET_CONNECTION)){
    return const FailureResponse(ERROR_INTERNET_CONNECTION);
  }
  if(message.contains('Invalid login credentials')){
    return FailureResponse(getError403(message));
  }
  if(message.contains(NAME_SHOULD_BE_UNIQUE_ERROR)){
    return const FailureResponse(ERROR_FOOD_NAME_ALREADY_EXIST);
  }
  return const FailureResponse(ERROR_TRY_AGAIN);
}

String getError400(String message){
  if(message == 'Invalid request payload input'){
      return ERROR_INVALID_REQUEST;
  }
  return ERROR_400;
}

String getError401(String message){
  return ERROR_401;
}

String getError403(String message){
  switch(message){
    case 'clabel_auth_isinactive':
      return ERROR_LOCKED_ACCOUNT;
    case 'clabel_auth_doesnotexist':
      return ERROR_USER_NOT_EXIST;
  }
  return ERROR_403;
}

String getError404(String message){
  return ERROR_404;
}

String getError422(String message){
  return ERROR_422;
}

String getError500(String message){
  switch(message){
    case 'clabel_signup_useractive':
      return ERROR_USER_ALREADY_EXIST;
    case 'clabel_invalid_captcha_token':
      return ERROR_INVALID_RECAPTCHA;
    case 'clabel_signup_user_not_found':
      return ERROR_WRONG_OTP;
  }
  return ERROR_500;
}