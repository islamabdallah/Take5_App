// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'checkRequestStatusModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheckRequestStatusModel _$CheckRequestStatusModelFromJson(
    Map<String, dynamic> json) {
  return _CheckRequestStatusModel.fromJson(json);
}

/// @nodoc
mixin _$CheckRequestStatusModel {
  String get userId => throw _privateConstructorUsedError;
  int get TripId => throw _privateConstructorUsedError;
  int get JobsiteId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckRequestStatusModelCopyWith<CheckRequestStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckRequestStatusModelCopyWith<$Res> {
  factory $CheckRequestStatusModelCopyWith(CheckRequestStatusModel value,
          $Res Function(CheckRequestStatusModel) then) =
      _$CheckRequestStatusModelCopyWithImpl<$Res, CheckRequestStatusModel>;
  @useResult
  $Res call({String userId, int TripId, int JobsiteId});
}

/// @nodoc
class _$CheckRequestStatusModelCopyWithImpl<$Res,
        $Val extends CheckRequestStatusModel>
    implements $CheckRequestStatusModelCopyWith<$Res> {
  _$CheckRequestStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? TripId = null,
    Object? JobsiteId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      TripId: null == TripId
          ? _value.TripId
          : TripId // ignore: cast_nullable_to_non_nullable
              as int,
      JobsiteId: null == JobsiteId
          ? _value.JobsiteId
          : JobsiteId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CheckRequestStatusModelCopyWith<$Res>
    implements $CheckRequestStatusModelCopyWith<$Res> {
  factory _$$_CheckRequestStatusModelCopyWith(_$_CheckRequestStatusModel value,
          $Res Function(_$_CheckRequestStatusModel) then) =
      __$$_CheckRequestStatusModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, int TripId, int JobsiteId});
}

/// @nodoc
class __$$_CheckRequestStatusModelCopyWithImpl<$Res>
    extends _$CheckRequestStatusModelCopyWithImpl<$Res,
        _$_CheckRequestStatusModel>
    implements _$$_CheckRequestStatusModelCopyWith<$Res> {
  __$$_CheckRequestStatusModelCopyWithImpl(_$_CheckRequestStatusModel _value,
      $Res Function(_$_CheckRequestStatusModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? TripId = null,
    Object? JobsiteId = null,
  }) {
    return _then(_$_CheckRequestStatusModel(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      TripId: null == TripId
          ? _value.TripId
          : TripId // ignore: cast_nullable_to_non_nullable
              as int,
      JobsiteId: null == JobsiteId
          ? _value.JobsiteId
          : JobsiteId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CheckRequestStatusModel implements _CheckRequestStatusModel {
  const _$_CheckRequestStatusModel(
      {required this.userId, required this.TripId, required this.JobsiteId});

  factory _$_CheckRequestStatusModel.fromJson(Map<String, dynamic> json) =>
      _$$_CheckRequestStatusModelFromJson(json);

  @override
  final String userId;
  @override
  final int TripId;
  @override
  final int JobsiteId;

  @override
  String toString() {
    return 'CheckRequestStatusModel(userId: $userId, TripId: $TripId, JobsiteId: $JobsiteId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckRequestStatusModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.TripId, TripId) || other.TripId == TripId) &&
            (identical(other.JobsiteId, JobsiteId) ||
                other.JobsiteId == JobsiteId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, TripId, JobsiteId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckRequestStatusModelCopyWith<_$_CheckRequestStatusModel>
      get copyWith =>
          __$$_CheckRequestStatusModelCopyWithImpl<_$_CheckRequestStatusModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckRequestStatusModelToJson(
      this,
    );
  }
}

abstract class _CheckRequestStatusModel implements CheckRequestStatusModel {
  const factory _CheckRequestStatusModel(
      {required final String userId,
      required final int TripId,
      required final int JobsiteId}) = _$_CheckRequestStatusModel;

  factory _CheckRequestStatusModel.fromJson(Map<String, dynamic> json) =
      _$_CheckRequestStatusModel.fromJson;

  @override
  String get userId;
  @override
  int get TripId;
  @override
  int get JobsiteId;
  @override
  @JsonKey(ignore: true)
  _$$_CheckRequestStatusModelCopyWith<_$_CheckRequestStatusModel>
      get copyWith => throw _privateConstructorUsedError;
}
