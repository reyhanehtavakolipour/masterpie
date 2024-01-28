// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_signin_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleSignInResponse {
  String get email => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  bool get updateProfileShown => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoogleSignInResponseCopyWith<GoogleSignInResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleSignInResponseCopyWith<$Res> {
  factory $GoogleSignInResponseCopyWith(GoogleSignInResponse value,
          $Res Function(GoogleSignInResponse) then) =
      _$GoogleSignInResponseCopyWithImpl<$Res, GoogleSignInResponse>;
  @useResult
  $Res call({String email, String id, bool updateProfileShown});
}

/// @nodoc
class _$GoogleSignInResponseCopyWithImpl<$Res,
        $Val extends GoogleSignInResponse>
    implements $GoogleSignInResponseCopyWith<$Res> {
  _$GoogleSignInResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? id = null,
    Object? updateProfileShown = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      updateProfileShown: null == updateProfileShown
          ? _value.updateProfileShown
          : updateProfileShown // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoogleSignInResponseImplCopyWith<$Res>
    implements $GoogleSignInResponseCopyWith<$Res> {
  factory _$$GoogleSignInResponseImplCopyWith(_$GoogleSignInResponseImpl value,
          $Res Function(_$GoogleSignInResponseImpl) then) =
      __$$GoogleSignInResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String id, bool updateProfileShown});
}

/// @nodoc
class __$$GoogleSignInResponseImplCopyWithImpl<$Res>
    extends _$GoogleSignInResponseCopyWithImpl<$Res, _$GoogleSignInResponseImpl>
    implements _$$GoogleSignInResponseImplCopyWith<$Res> {
  __$$GoogleSignInResponseImplCopyWithImpl(_$GoogleSignInResponseImpl _value,
      $Res Function(_$GoogleSignInResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? id = null,
    Object? updateProfileShown = null,
  }) {
    return _then(_$GoogleSignInResponseImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      updateProfileShown: null == updateProfileShown
          ? _value.updateProfileShown
          : updateProfileShown // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GoogleSignInResponseImpl implements _GoogleSignInResponse {
  _$GoogleSignInResponseImpl(
      {this.email = '', this.id = '', this.updateProfileShown = false});

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final bool updateProfileShown;

  @override
  String toString() {
    return 'GoogleSignInResponse(email: $email, id: $id, updateProfileShown: $updateProfileShown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleSignInResponseImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updateProfileShown, updateProfileShown) ||
                other.updateProfileShown == updateProfileShown));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, id, updateProfileShown);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleSignInResponseImplCopyWith<_$GoogleSignInResponseImpl>
      get copyWith =>
          __$$GoogleSignInResponseImplCopyWithImpl<_$GoogleSignInResponseImpl>(
              this, _$identity);
}

abstract class _GoogleSignInResponse implements GoogleSignInResponse {
  factory _GoogleSignInResponse(
      {final String email,
      final String id,
      final bool updateProfileShown}) = _$GoogleSignInResponseImpl;

  @override
  String get email;
  @override
  String get id;
  @override
  bool get updateProfileShown;
  @override
  @JsonKey(ignore: true)
  _$$GoogleSignInResponseImplCopyWith<_$GoogleSignInResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
