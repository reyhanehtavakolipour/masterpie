import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_signin_remote_model.freezed.dart';


@freezed
class GoogleSignInRemote with _$GoogleSignInRemote{

  factory GoogleSignInRemote({
    @Default('') String email,
    @Default('') String id,
    @Default(false) bool updateProfileShown
  })= _GoogleSignInRemote;

}