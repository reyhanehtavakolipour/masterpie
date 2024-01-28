import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_signin_response_model.freezed.dart';


@freezed
class GoogleSignInResponse with _$GoogleSignInResponse{

  factory GoogleSignInResponse({
    @Default('') String email,
    @Default('') String id,
    @Default(false) bool updateProfileShown
  })= _GoogleSignInResponse;

}