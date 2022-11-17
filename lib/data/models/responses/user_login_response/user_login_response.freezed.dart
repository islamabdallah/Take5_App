// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserLoginResponse _$UserLoginResponseFromJson(Map<String, dynamic> json) {
  return _UserLoginResponse.fromJson(json);
}

/// @nodoc
mixin _$UserLoginResponse {
  String get message => throw _privateConstructorUsedError;
  User get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLoginResponseCopyWith<UserLoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLoginResponseCopyWith<$Res> {
  factory $UserLoginResponseCopyWith(
          UserLoginResponse value, $Res Function(UserLoginResponse) then) =
      _$UserLoginResponseCopyWithImpl<$Res, UserLoginResponse>;
  @useResult
  $Res call({String message, User data});

  $UserCopyWith<$Res> get data;
}

/// @nodoc
class _$UserLoginResponseCopyWithImpl<$Res, $Val extends UserLoginResponse>
    implements $UserLoginResponseCopyWith<$Res> {
  _$UserLoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get data {
    return $UserCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserLoginResponseCopyWith<$Res>
    implements $UserLoginResponseCopyWith<$Res> {
  factory _$$_UserLoginResponseCopyWith(_$_UserLoginResponse value,
          $Res Function(_$_UserLoginResponse) then) =
      __$$_UserLoginResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, User data});

  @override
  $UserCopyWith<$Res> get data;
}

/// @nodoc
class __$$_UserLoginResponseCopyWithImpl<$Res>
    extends _$UserLoginResponseCopyWithImpl<$Res, _$_UserLoginResponse>
    implements _$$_UserLoginResponseCopyWith<$Res> {
  __$$_UserLoginResponseCopyWithImpl(
      _$_UserLoginResponse _value, $Res Function(_$_UserLoginResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$_UserLoginResponse(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserLoginResponse implements _UserLoginResponse {
  const _$_UserLoginResponse({required this.message, required this.data});

  factory _$_UserLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UserLoginResponseFromJson(json);

  @override
  final String message;
  @override
  final User data;

  @override
  String toString() {
    return 'UserLoginResponse(message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserLoginResponse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserLoginResponseCopyWith<_$_UserLoginResponse> get copyWith =>
      __$$_UserLoginResponseCopyWithImpl<_$_UserLoginResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserLoginResponseToJson(
      this,
    );
  }
}

abstract class _UserLoginResponse implements UserLoginResponse {
  const factory _UserLoginResponse(
      {required final String message,
      required final User data}) = _$_UserLoginResponse;

  factory _UserLoginResponse.fromJson(Map<String, dynamic> json) =
      _$_UserLoginResponse.fromJson;

  @override
  String get message;
  @override
  User get data;
  @override
  @JsonKey(ignore: true)
  _$$_UserLoginResponseCopyWith<_$_UserLoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
