// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bid_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CollectionModel _$CollectionModelFromJson(Map<String, dynamic> json) {
  return _CollectionModel.fromJson(json);
}

/// @nodoc
mixin _$CollectionModel {
  String? get userId => throw _privateConstructorUsedError;
  int? get tripId => throw _privateConstructorUsedError;
  int? get jobsiteId => throw _privateConstructorUsedError;
  DestinationArrivedRequest? get destinationArrivedRequest =>
      throw _privateConstructorUsedError;
  StepOneCompleteRequest? get stepOneCompleteRequest =>
      throw _privateConstructorUsedError;
  StepTwoStartRequest? get stepTwoStartRequest =>
      throw _privateConstructorUsedError;
  StepTwoCompleteRequest? get stepTwoCompleteRequest =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollectionModelCopyWith<CollectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionModelCopyWith<$Res> {
  factory $CollectionModelCopyWith(
          CollectionModel value, $Res Function(CollectionModel) then) =
      _$CollectionModelCopyWithImpl<$Res, CollectionModel>;
  @useResult
  $Res call(
      {String? userId,
      int? tripId,
      int? jobsiteId,
      DestinationArrivedRequest? destinationArrivedRequest,
      StepOneCompleteRequest? stepOneCompleteRequest,
      StepTwoStartRequest? stepTwoStartRequest,
      StepTwoCompleteRequest? stepTwoCompleteRequest});

  $DestinationArrivedRequestCopyWith<$Res>? get destinationArrivedRequest;
  $StepOneCompleteRequestCopyWith<$Res>? get stepOneCompleteRequest;
  $StepTwoStartRequestCopyWith<$Res>? get stepTwoStartRequest;
  $StepTwoCompleteRequestCopyWith<$Res>? get stepTwoCompleteRequest;
}

/// @nodoc
class _$CollectionModelCopyWithImpl<$Res, $Val extends CollectionModel>
    implements $CollectionModelCopyWith<$Res> {
  _$CollectionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? tripId = freezed,
    Object? jobsiteId = freezed,
    Object? destinationArrivedRequest = freezed,
    Object? stepOneCompleteRequest = freezed,
    Object? stepTwoStartRequest = freezed,
    Object? stepTwoCompleteRequest = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      tripId: freezed == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int?,
      jobsiteId: freezed == jobsiteId
          ? _value.jobsiteId
          : jobsiteId // ignore: cast_nullable_to_non_nullable
              as int?,
      destinationArrivedRequest: freezed == destinationArrivedRequest
          ? _value.destinationArrivedRequest
          : destinationArrivedRequest // ignore: cast_nullable_to_non_nullable
              as DestinationArrivedRequest?,
      stepOneCompleteRequest: freezed == stepOneCompleteRequest
          ? _value.stepOneCompleteRequest
          : stepOneCompleteRequest // ignore: cast_nullable_to_non_nullable
              as StepOneCompleteRequest?,
      stepTwoStartRequest: freezed == stepTwoStartRequest
          ? _value.stepTwoStartRequest
          : stepTwoStartRequest // ignore: cast_nullable_to_non_nullable
              as StepTwoStartRequest?,
      stepTwoCompleteRequest: freezed == stepTwoCompleteRequest
          ? _value.stepTwoCompleteRequest
          : stepTwoCompleteRequest // ignore: cast_nullable_to_non_nullable
              as StepTwoCompleteRequest?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DestinationArrivedRequestCopyWith<$Res>? get destinationArrivedRequest {
    if (_value.destinationArrivedRequest == null) {
      return null;
    }

    return $DestinationArrivedRequestCopyWith<$Res>(
        _value.destinationArrivedRequest!, (value) {
      return _then(_value.copyWith(destinationArrivedRequest: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StepOneCompleteRequestCopyWith<$Res>? get stepOneCompleteRequest {
    if (_value.stepOneCompleteRequest == null) {
      return null;
    }

    return $StepOneCompleteRequestCopyWith<$Res>(_value.stepOneCompleteRequest!,
        (value) {
      return _then(_value.copyWith(stepOneCompleteRequest: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StepTwoStartRequestCopyWith<$Res>? get stepTwoStartRequest {
    if (_value.stepTwoStartRequest == null) {
      return null;
    }

    return $StepTwoStartRequestCopyWith<$Res>(_value.stepTwoStartRequest!,
        (value) {
      return _then(_value.copyWith(stepTwoStartRequest: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StepTwoCompleteRequestCopyWith<$Res>? get stepTwoCompleteRequest {
    if (_value.stepTwoCompleteRequest == null) {
      return null;
    }

    return $StepTwoCompleteRequestCopyWith<$Res>(_value.stepTwoCompleteRequest!,
        (value) {
      return _then(_value.copyWith(stepTwoCompleteRequest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CollectionModelCopyWith<$Res>
    implements $CollectionModelCopyWith<$Res> {
  factory _$$_CollectionModelCopyWith(
          _$_CollectionModel value, $Res Function(_$_CollectionModel) then) =
      __$$_CollectionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      int? tripId,
      int? jobsiteId,
      DestinationArrivedRequest? destinationArrivedRequest,
      StepOneCompleteRequest? stepOneCompleteRequest,
      StepTwoStartRequest? stepTwoStartRequest,
      StepTwoCompleteRequest? stepTwoCompleteRequest});

  @override
  $DestinationArrivedRequestCopyWith<$Res>? get destinationArrivedRequest;
  @override
  $StepOneCompleteRequestCopyWith<$Res>? get stepOneCompleteRequest;
  @override
  $StepTwoStartRequestCopyWith<$Res>? get stepTwoStartRequest;
  @override
  $StepTwoCompleteRequestCopyWith<$Res>? get stepTwoCompleteRequest;
}

/// @nodoc
class __$$_CollectionModelCopyWithImpl<$Res>
    extends _$CollectionModelCopyWithImpl<$Res, _$_CollectionModel>
    implements _$$_CollectionModelCopyWith<$Res> {
  __$$_CollectionModelCopyWithImpl(
      _$_CollectionModel _value, $Res Function(_$_CollectionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? tripId = freezed,
    Object? jobsiteId = freezed,
    Object? destinationArrivedRequest = freezed,
    Object? stepOneCompleteRequest = freezed,
    Object? stepTwoStartRequest = freezed,
    Object? stepTwoCompleteRequest = freezed,
  }) {
    return _then(_$_CollectionModel(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      tripId: freezed == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int?,
      jobsiteId: freezed == jobsiteId
          ? _value.jobsiteId
          : jobsiteId // ignore: cast_nullable_to_non_nullable
              as int?,
      destinationArrivedRequest: freezed == destinationArrivedRequest
          ? _value.destinationArrivedRequest
          : destinationArrivedRequest // ignore: cast_nullable_to_non_nullable
              as DestinationArrivedRequest?,
      stepOneCompleteRequest: freezed == stepOneCompleteRequest
          ? _value.stepOneCompleteRequest
          : stepOneCompleteRequest // ignore: cast_nullable_to_non_nullable
              as StepOneCompleteRequest?,
      stepTwoStartRequest: freezed == stepTwoStartRequest
          ? _value.stepTwoStartRequest
          : stepTwoStartRequest // ignore: cast_nullable_to_non_nullable
              as StepTwoStartRequest?,
      stepTwoCompleteRequest: freezed == stepTwoCompleteRequest
          ? _value.stepTwoCompleteRequest
          : stepTwoCompleteRequest // ignore: cast_nullable_to_non_nullable
              as StepTwoCompleteRequest?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CollectionModel implements _CollectionModel {
  const _$_CollectionModel(
      {this.userId,
      this.tripId,
      this.jobsiteId,
      this.destinationArrivedRequest,
      this.stepOneCompleteRequest,
      this.stepTwoStartRequest,
      this.stepTwoCompleteRequest});

  factory _$_CollectionModel.fromJson(Map<String, dynamic> json) =>
      _$$_CollectionModelFromJson(json);

  @override
  final String? userId;
  @override
  final int? tripId;
  @override
  final int? jobsiteId;
  @override
  final DestinationArrivedRequest? destinationArrivedRequest;
  @override
  final StepOneCompleteRequest? stepOneCompleteRequest;
  @override
  final StepTwoStartRequest? stepTwoStartRequest;
  @override
  final StepTwoCompleteRequest? stepTwoCompleteRequest;

  @override
  String toString() {
    return 'CollectionModel(userId: $userId, tripId: $tripId, jobsiteId: $jobsiteId, destinationArrivedRequest: $destinationArrivedRequest, stepOneCompleteRequest: $stepOneCompleteRequest, stepTwoStartRequest: $stepTwoStartRequest, stepTwoCompleteRequest: $stepTwoCompleteRequest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CollectionModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.jobsiteId, jobsiteId) ||
                other.jobsiteId == jobsiteId) &&
            (identical(other.destinationArrivedRequest,
                    destinationArrivedRequest) ||
                other.destinationArrivedRequest == destinationArrivedRequest) &&
            (identical(other.stepOneCompleteRequest, stepOneCompleteRequest) ||
                other.stepOneCompleteRequest == stepOneCompleteRequest) &&
            (identical(other.stepTwoStartRequest, stepTwoStartRequest) ||
                other.stepTwoStartRequest == stepTwoStartRequest) &&
            (identical(other.stepTwoCompleteRequest, stepTwoCompleteRequest) ||
                other.stepTwoCompleteRequest == stepTwoCompleteRequest));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      tripId,
      jobsiteId,
      destinationArrivedRequest,
      stepOneCompleteRequest,
      stepTwoStartRequest,
      stepTwoCompleteRequest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CollectionModelCopyWith<_$_CollectionModel> get copyWith =>
      __$$_CollectionModelCopyWithImpl<_$_CollectionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CollectionModelToJson(
      this,
    );
  }
}

abstract class _CollectionModel implements CollectionModel {
  const factory _CollectionModel(
          {final String? userId,
          final int? tripId,
          final int? jobsiteId,
          final DestinationArrivedRequest? destinationArrivedRequest,
          final StepOneCompleteRequest? stepOneCompleteRequest,
          final StepTwoStartRequest? stepTwoStartRequest,
          final StepTwoCompleteRequest? stepTwoCompleteRequest}) =
      _$_CollectionModel;

  factory _CollectionModel.fromJson(Map<String, dynamic> json) =
      _$_CollectionModel.fromJson;

  @override
  String? get userId;
  @override
  int? get tripId;
  @override
  int? get jobsiteId;
  @override
  DestinationArrivedRequest? get destinationArrivedRequest;
  @override
  StepOneCompleteRequest? get stepOneCompleteRequest;
  @override
  StepTwoStartRequest? get stepTwoStartRequest;
  @override
  StepTwoCompleteRequest? get stepTwoCompleteRequest;
  @override
  @JsonKey(ignore: true)
  _$$_CollectionModelCopyWith<_$_CollectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
