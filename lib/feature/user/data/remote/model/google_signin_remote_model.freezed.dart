// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_signin_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleSignInRemote {
  String get email => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoogleSignInRemoteCopyWith<GoogleSignInRemote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleSignInRemoteCopyWith<$Res> {
  factory $GoogleSignInRemoteCopyWith(
          GoogleSignInRemote value, $Res Function(GoogleSignInRemote) then) =
      _$GoogleSignInRemoteCopyWithImpl<$Res, GoogleSignInRemote>;
  @useResult
  $Res call({String email, String id});
}

/// @nodoc
class _$GoogleSignInRemoteCopyWithImpl<$Res, $Val extends GoogleSignInRemote>
    implements $GoogleSignInRemoteCopyWith<$Res> {
  _$GoogleSignInRemoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? id = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoogleSignInRemoteImplCopyWith<$Res>
    implements $GoogleSignInRemoteCopyWith<$Res> {
  factory _$$GoogleSignInRemoteImplCopyWith(_$GoogleSignInRemoteImpl value,
          $Res Function(_$GoogleSignInRemoteImpl) then) =
      __$$GoogleSignInRemoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String id});
}

/// @nodoc
class __$$GoogleSignInRemoteImplCopyWithImpl<$Res>
    extends _$GoogleSignInRemoteCopyWithImpl<$Res, _$GoogleSignInRemoteImpl>
    implements _$$GoogleSignInRemoteImplCopyWith<$Res> {
  __$$GoogleSignInRemoteImplCopyWithImpl(_$GoogleSignInRemoteImpl _value,
      $Res Function(_$GoogleSignInRemoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? id = null,
  }) {
    return _then(_$GoogleSignInRemoteImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GoogleSignInRemoteImpl implements _GoogleSignInRemote {
  _$GoogleSignInRemoteImpl({this.email = '', this.id = ''});

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String id;

  @override
  String toString() {
    return 'GoogleSignInRemote(email: $email, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleSignInRemoteImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleSignInRemoteImplCopyWith<_$GoogleSignInRemoteImpl> get copyWith =>
      __$$GoogleSignInRemoteImplCopyWithImpl<_$GoogleSignInRemoteImpl>(
          this, _$identity);
}

abstract class _GoogleSignInRemote implements GoogleSignInRemote {
  factory _GoogleSignInRemote({final String email, final String id}) =
      _$GoogleSignInRemoteImpl;

  @override
  String get email;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$GoogleSignInRemoteImplCopyWith<_$GoogleSignInRemoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
