// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_trip_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserTripResponse _$UserTripResponseFromJson(Map<String, dynamic> json) {
  return _UserTripResponse.fromJson(json);
}

/// @nodoc
mixin _$UserTripResponse {
  String get message => throw _privateConstructorUsedError;
  Trip get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserTripResponseCopyWith<UserTripResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTripResponseCopyWith<$Res> {
  factory $UserTripResponseCopyWith(
          UserTripResponse value, $Res Function(UserTripResponse) then) =
      _$UserTripResponseCopyWithImpl<$Res, UserTripResponse>;
  @useResult
  $Res call({String message, Trip data});

  $TripCopyWith<$Res> get data;
}

/// @nodoc
class _$UserTripResponseCopyWithImpl<$Res, $Val extends UserTripResponse>
    implements $UserTripResponseCopyWith<$Res> {
  _$UserTripResponseCopyWithImpl(this._value, this._then);

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
              as Trip,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TripCopyWith<$Res> get data {
    return $TripCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserTripResponseCopyWith<$Res>
    implements $UserTripResponseCopyWith<$Res> {
  factory _$$_UserTripResponseCopyWith(
          _$_UserTripResponse value, $Res Function(_$_UserTripResponse) then) =
      __$$_UserTripResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Trip data});

  @override
  $TripCopyWith<$Res> get data;
}

/// @nodoc
class __$$_UserTripResponseCopyWithImpl<$Res>
    extends _$UserTripResponseCopyWithImpl<$Res, _$_UserTripResponse>
    implements _$$_UserTripResponseCopyWith<$Res> {
  __$$_UserTripResponseCopyWithImpl(
      _$_UserTripResponse _value, $Res Function(_$_UserTripResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$_UserTripResponse(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Trip,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserTripResponse implements _UserTripResponse {
  const _$_UserTripResponse({required this.message, required this.data});

  factory _$_UserTripResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UserTripResponseFromJson(json);

  @override
  final String message;
  @override
  final Trip data;

  @override
  String toString() {
    return 'UserTripResponse(message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserTripResponse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserTripResponseCopyWith<_$_UserTripResponse> get copyWith =>
      __$$_UserTripResponseCopyWithImpl<_$_UserTripResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserTripResponseToJson(
      this,
    );
  }
}

abstract class _UserTripResponse implements UserTripResponse {
  const factory _UserTripResponse(
      {required final String message,
      required final Trip data}) = _$_UserTripResponse;

  factory _UserTripResponse.fromJson(Map<String, dynamic> json) =
      _$_UserTripResponse.fromJson;

  @override
  String get message;
  @override
  Trip get data;
  @override
  @JsonKey(ignore: true)
  _$$_UserTripResponseCopyWith<_$_UserTripResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
