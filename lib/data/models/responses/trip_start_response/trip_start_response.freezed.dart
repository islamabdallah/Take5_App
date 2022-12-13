// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_start_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TripStartResponse _$TripStartResponseFromJson(Map<String, dynamic> json) {
  return _TripStartResponse.fromJson(json);
}

/// @nodoc
mixin _$TripStartResponse {
  String get message => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripStartResponseCopyWith<TripStartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripStartResponseCopyWith<$Res> {
  factory $TripStartResponseCopyWith(
          TripStartResponse value, $Res Function(TripStartResponse) then) =
      _$TripStartResponseCopyWithImpl<$Res, TripStartResponse>;
  @useResult
  $Res call({String message, String data});
}

/// @nodoc
class _$TripStartResponseCopyWithImpl<$Res, $Val extends TripStartResponse>
    implements $TripStartResponseCopyWith<$Res> {
  _$TripStartResponseCopyWithImpl(this._value, this._then);

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
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TripStartResponseCopyWith<$Res>
    implements $TripStartResponseCopyWith<$Res> {
  factory _$$_TripStartResponseCopyWith(_$_TripStartResponse value,
          $Res Function(_$_TripStartResponse) then) =
      __$$_TripStartResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String data});
}

/// @nodoc
class __$$_TripStartResponseCopyWithImpl<$Res>
    extends _$TripStartResponseCopyWithImpl<$Res, _$_TripStartResponse>
    implements _$$_TripStartResponseCopyWith<$Res> {
  __$$_TripStartResponseCopyWithImpl(
      _$_TripStartResponse _value, $Res Function(_$_TripStartResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$_TripStartResponse(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TripStartResponse implements _TripStartResponse {
  const _$_TripStartResponse({required this.message, required this.data});

  factory _$_TripStartResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TripStartResponseFromJson(json);

  @override
  final String message;
  @override
  final String data;

  @override
  String toString() {
    return 'TripStartResponse(message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripStartResponse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TripStartResponseCopyWith<_$_TripStartResponse> get copyWith =>
      __$$_TripStartResponseCopyWithImpl<_$_TripStartResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TripStartResponseToJson(
      this,
    );
  }
}

abstract class _TripStartResponse implements TripStartResponse {
  const factory _TripStartResponse(
      {required final String message,
      required final String data}) = _$_TripStartResponse;

  factory _TripStartResponse.fromJson(Map<String, dynamic> json) =
      _$_TripStartResponse.fromJson;

  @override
  String get message;
  @override
  String get data;
  @override
  @JsonKey(ignore: true)
  _$$_TripStartResponseCopyWith<_$_TripStartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
