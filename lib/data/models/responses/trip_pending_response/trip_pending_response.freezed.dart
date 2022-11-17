// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trip_pending_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TripPendingResponse _$TripPendingResponseFromJson(Map<String, dynamic> json) {
  return _TripPendingResponse.fromJson(json);
}

/// @nodoc
mixin _$TripPendingResponse {
  String get message => throw _privateConstructorUsedError;
  Trip get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripPendingResponseCopyWith<TripPendingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripPendingResponseCopyWith<$Res> {
  factory $TripPendingResponseCopyWith(
          TripPendingResponse value, $Res Function(TripPendingResponse) then) =
      _$TripPendingResponseCopyWithImpl<$Res, TripPendingResponse>;
  @useResult
  $Res call({String message, Trip data});

  $TripCopyWith<$Res> get data;
}

/// @nodoc
class _$TripPendingResponseCopyWithImpl<$Res, $Val extends TripPendingResponse>
    implements $TripPendingResponseCopyWith<$Res> {
  _$TripPendingResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$_TripPendingResponseCopyWith<$Res>
    implements $TripPendingResponseCopyWith<$Res> {
  factory _$$_TripPendingResponseCopyWith(_$_TripPendingResponse value,
          $Res Function(_$_TripPendingResponse) then) =
      __$$_TripPendingResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Trip data});

  @override
  $TripCopyWith<$Res> get data;
}

/// @nodoc
class __$$_TripPendingResponseCopyWithImpl<$Res>
    extends _$TripPendingResponseCopyWithImpl<$Res, _$_TripPendingResponse>
    implements _$$_TripPendingResponseCopyWith<$Res> {
  __$$_TripPendingResponseCopyWithImpl(_$_TripPendingResponse _value,
      $Res Function(_$_TripPendingResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$_TripPendingResponse(
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
class _$_TripPendingResponse implements _TripPendingResponse {
  const _$_TripPendingResponse({required this.message, required this.data});

  factory _$_TripPendingResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TripPendingResponseFromJson(json);

  @override
  final String message;
  @override
  final Trip data;

  @override
  String toString() {
    return 'TripPendingResponse(message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripPendingResponse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TripPendingResponseCopyWith<_$_TripPendingResponse> get copyWith =>
      __$$_TripPendingResponseCopyWithImpl<_$_TripPendingResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TripPendingResponseToJson(
      this,
    );
  }
}

abstract class _TripPendingResponse implements TripPendingResponse {
  const factory _TripPendingResponse(
      {required final String message,
      required final Trip data}) = _$_TripPendingResponse;

  factory _TripPendingResponse.fromJson(Map<String, dynamic> json) =
      _$_TripPendingResponse.fromJson;

  @override
  String get message;
  @override
  Trip get data;
  @override
  @JsonKey(ignore: true)
  _$$_TripPendingResponseCopyWith<_$_TripPendingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
