// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'status_start_step_two_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatusStartStepTwoResponse _$StatusStartStepTwoResponseFromJson(
    Map<String, dynamic> json) {
  return _StatusStartStepTwoResponse.fromJson(json);
}

/// @nodoc
mixin _$StatusStartStepTwoResponse {
  String get message => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusStartStepTwoResponseCopyWith<StatusStartStepTwoResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusStartStepTwoResponseCopyWith<$Res> {
  factory $StatusStartStepTwoResponseCopyWith(StatusStartStepTwoResponse value,
          $Res Function(StatusStartStepTwoResponse) then) =
      _$StatusStartStepTwoResponseCopyWithImpl<$Res,
          StatusStartStepTwoResponse>;
  @useResult
  $Res call({String message, String data});
}

/// @nodoc
class _$StatusStartStepTwoResponseCopyWithImpl<$Res,
        $Val extends StatusStartStepTwoResponse>
    implements $StatusStartStepTwoResponseCopyWith<$Res> {
  _$StatusStartStepTwoResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$_StatusStartStepTwoResponseCopyWith<$Res>
    implements $StatusStartStepTwoResponseCopyWith<$Res> {
  factory _$$_StatusStartStepTwoResponseCopyWith(
          _$_StatusStartStepTwoResponse value,
          $Res Function(_$_StatusStartStepTwoResponse) then) =
      __$$_StatusStartStepTwoResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String data});
}

/// @nodoc
class __$$_StatusStartStepTwoResponseCopyWithImpl<$Res>
    extends _$StatusStartStepTwoResponseCopyWithImpl<$Res,
        _$_StatusStartStepTwoResponse>
    implements _$$_StatusStartStepTwoResponseCopyWith<$Res> {
  __$$_StatusStartStepTwoResponseCopyWithImpl(
      _$_StatusStartStepTwoResponse _value,
      $Res Function(_$_StatusStartStepTwoResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$_StatusStartStepTwoResponse(
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
class _$_StatusStartStepTwoResponse implements _StatusStartStepTwoResponse {
  const _$_StatusStartStepTwoResponse(
      {required this.message, required this.data});

  factory _$_StatusStartStepTwoResponse.fromJson(Map<String, dynamic> json) =>
      _$$_StatusStartStepTwoResponseFromJson(json);

  @override
  final String message;
  @override
  final String data;

  @override
  String toString() {
    return 'StatusStartStepTwoResponse(message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatusStartStepTwoResponse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatusStartStepTwoResponseCopyWith<_$_StatusStartStepTwoResponse>
      get copyWith => __$$_StatusStartStepTwoResponseCopyWithImpl<
          _$_StatusStartStepTwoResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatusStartStepTwoResponseToJson(
      this,
    );
  }
}

abstract class _StatusStartStepTwoResponse
    implements StatusStartStepTwoResponse {
  const factory _StatusStartStepTwoResponse(
      {required final String message,
      required final String data}) = _$_StatusStartStepTwoResponse;

  factory _StatusStartStepTwoResponse.fromJson(Map<String, dynamic> json) =
      _$_StatusStartStepTwoResponse.fromJson;

  @override
  String get message;
  @override
  String get data;
  @override
  @JsonKey(ignore: true)
  _$$_StatusStartStepTwoResponseCopyWith<_$_StatusStartStepTwoResponse>
      get copyWith => throw _privateConstructorUsedError;
}
