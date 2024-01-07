

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_credentials_model.freezed.dart';


@freezed
class UserCredentials with _$UserCredentials{

  factory UserCredentials({
    @Default('') String email,
    @Default('') String password,
  })= _UserCredentials;

}