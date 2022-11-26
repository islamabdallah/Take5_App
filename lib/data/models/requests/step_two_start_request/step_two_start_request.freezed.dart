// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'step_two_start_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Take5StepTwoRequestAPIModel _$Take5StepTwoRequestAPIModelFromJson(
    Map<String, dynamic> json) {
  return _Take5StepTwoRequestAPIModel.fromJson(json);
}

/// @nodoc
mixin _$Take5StepTwoRequestAPIModel {
  DateTime get requestDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Take5StepTwoRequestAPIModelCopyWith<Take5StepTwoRequestAPIModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Take5StepTwoRequestAPIModelCopyWith<$Res> {
  factory $Take5StepTwoRequestAPIModelCopyWith(
          Take5StepTwoRequestAPIModel value,
          $Res Function(Take5StepTwoRequestAPIModel) then) =
      _$Take5StepTwoRequestAPIModelCopyWithImpl<$Res,
          Take5StepTwoRequestAPIModel>;
  @useResult
  $Res call({DateTime requestDate});
}

/// @nodoc
class _$Take5StepTwoRequestAPIModelCopyWithImpl<$Res,
        $Val extends Take5StepTwoRequestAPIModel>
    implements $Take5StepTwoRequestAPIModelCopyWith<$Res> {
  _$Take5StepTwoRequestAPIModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestDate = null,
  }) {
    return _then(_value.copyWith(
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_Take5StepTwoRequestAPIModelCopyWith<$Res>
    implements $Take5StepTwoRequestAPIModelCopyWith<$Res> {
  factory _$$_Take5StepTwoRequestAPIModelCopyWith(
          _$_Take5StepTwoRequestAPIModel value,
          $Res Function(_$_Take5StepTwoRequestAPIModel) then) =
      __$$_Take5StepTwoRequestAPIModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime requestDate});
}

/// @nodoc
class __$$_Take5StepTwoRequestAPIModelCopyWithImpl<$Res>
    extends _$Take5StepTwoRequestAPIModelCopyWithImpl<$Res,
        _$_Take5StepTwoRequestAPIModel>
    implements _$$_Take5StepTwoRequestAPIModelCopyWith<$Res> {
  __$$_Take5StepTwoRequestAPIModelCopyWithImpl(
      _$_Take5StepTwoRequestAPIModel _value,
      $Res Function(_$_Take5StepTwoRequestAPIModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestDate = null,
  }) {
    return _then(_$_Take5StepTwoRequestAPIModel(
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Take5StepTwoRequestAPIModel implements _Take5StepTwoRequestAPIModel {
  const _$_Take5StepTwoRequestAPIModel({required this.requestDate});

  factory _$_Take5StepTwoRequestAPIModel.fromJson(Map<String, dynamic> json) =>
      _$$_Take5StepTwoRequestAPIModelFromJson(json);

  @override
  final DateTime requestDate;

  @override
  String toString() {
    return 'Take5StepTwoRequestAPIModel(requestDate: $requestDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Take5StepTwoRequestAPIModel &&
            (identical(other.requestDate, requestDate) ||
                other.requestDate == requestDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_Take5StepTwoRequestAPIModelCopyWith<_$_Take5StepTwoRequestAPIModel>
      get copyWith => __$$_Take5StepTwoRequestAPIModelCopyWithImpl<
          _$_Take5StepTwoRequestAPIModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Take5StepTwoRequestAPIModelToJson(
      this,
    );
  }
}

abstract class _Take5StepTwoRequestAPIModel
    implements Take5StepTwoRequestAPIModel {
  const factory _Take5StepTwoRequestAPIModel(
      {required final DateTime requestDate}) = _$_Take5StepTwoRequestAPIModel;

  factory _Take5StepTwoRequestAPIModel.fromJson(Map<String, dynamic> json) =
      _$_Take5StepTwoRequestAPIModel.fromJson;

  @override
  DateTime get requestDate;
  @override
  @JsonKey(ignore: true)
  _$$_Take5StepTwoRequestAPIModelCopyWith<_$_Take5StepTwoRequestAPIModel>
      get copyWith => throw _privateConstructorUsedError;
}
