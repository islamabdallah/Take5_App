// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'all_trip_steps.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllTripStepsModel _$AllTripStepsModelFromJson(Map<String, dynamic> json) {
  return _AllTripStepsModel.fromJson(json);
}

/// @nodoc
mixin _$AllTripStepsModel {
  String? get userId => throw _privateConstructorUsedError;
  int? get tripId => throw _privateConstructorUsedError;
  int? get jobsiteId => throw _privateConstructorUsedError; //todo end
  DestinationArrivedRequest? get destinationArrivedRequest =>
      throw _privateConstructorUsedError;
  StepOneCompleteRequest? get stepOneCompleteRequest =>
      throw _privateConstructorUsedError;
  StepTwoStartRequest? get stepTwoStartRequest =>
      throw _privateConstructorUsedError;
  StepTwoCompleteRequest? get stepTwoCompleteRequest =>
      throw _privateConstructorUsedError;
  Take5TogetherModel? get take5TogetherAPIModels =>
      throw _privateConstructorUsedError;
  String? get endStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllTripStepsModelCopyWith<AllTripStepsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllTripStepsModelCopyWith<$Res> {
  factory $AllTripStepsModelCopyWith(
          AllTripStepsModel value, $Res Function(AllTripStepsModel) then) =
      _$AllTripStepsModelCopyWithImpl<$Res, AllTripStepsModel>;
  @useResult
  $Res call(
      {String? userId,
      int? tripId,
      int? jobsiteId,
      DestinationArrivedRequest? destinationArrivedRequest,
      StepOneCompleteRequest? stepOneCompleteRequest,
      StepTwoStartRequest? stepTwoStartRequest,
      StepTwoCompleteRequest? stepTwoCompleteRequest,
      Take5TogetherModel? take5TogetherAPIModels,
      String? endStatus});

  $DestinationArrivedRequestCopyWith<$Res>? get destinationArrivedRequest;
  $StepOneCompleteRequestCopyWith<$Res>? get stepOneCompleteRequest;
  $StepTwoStartRequestCopyWith<$Res>? get stepTwoStartRequest;
  $StepTwoCompleteRequestCopyWith<$Res>? get stepTwoCompleteRequest;
  $Take5TogetherModelCopyWith<$Res>? get take5TogetherAPIModels;
}

/// @nodoc
class _$AllTripStepsModelCopyWithImpl<$Res, $Val extends AllTripStepsModel>
    implements $AllTripStepsModelCopyWith<$Res> {
  _$AllTripStepsModelCopyWithImpl(this._value, this._then);

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
    Object? take5TogetherAPIModels = freezed,
    Object? endStatus = freezed,
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
      take5TogetherAPIModels: freezed == take5TogetherAPIModels
          ? _value.take5TogetherAPIModels
          : take5TogetherAPIModels // ignore: cast_nullable_to_non_nullable
              as Take5TogetherModel?,
      endStatus: freezed == endStatus
          ? _value.endStatus
          : endStatus // ignore: cast_nullable_to_non_nullable
              as String?,
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

  @override
  @pragma('vm:prefer-inline')
  $Take5TogetherModelCopyWith<$Res>? get take5TogetherAPIModels {
    if (_value.take5TogetherAPIModels == null) {
      return null;
    }

    return $Take5TogetherModelCopyWith<$Res>(_value.take5TogetherAPIModels!,
        (value) {
      return _then(_value.copyWith(take5TogetherAPIModels: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AllTripStepsModelCopyWith<$Res>
    implements $AllTripStepsModelCopyWith<$Res> {
  factory _$$_AllTripStepsModelCopyWith(_$_AllTripStepsModel value,
          $Res Function(_$_AllTripStepsModel) then) =
      __$$_AllTripStepsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      int? tripId,
      int? jobsiteId,
      DestinationArrivedRequest? destinationArrivedRequest,
      StepOneCompleteRequest? stepOneCompleteRequest,
      StepTwoStartRequest? stepTwoStartRequest,
      StepTwoCompleteRequest? stepTwoCompleteRequest,
      Take5TogetherModel? take5TogetherAPIModels,
      String? endStatus});

  @override
  $DestinationArrivedRequestCopyWith<$Res>? get destinationArrivedRequest;
  @override
  $StepOneCompleteRequestCopyWith<$Res>? get stepOneCompleteRequest;
  @override
  $StepTwoStartRequestCopyWith<$Res>? get stepTwoStartRequest;
  @override
  $StepTwoCompleteRequestCopyWith<$Res>? get stepTwoCompleteRequest;
  @override
  $Take5TogetherModelCopyWith<$Res>? get take5TogetherAPIModels;
}

/// @nodoc
class __$$_AllTripStepsModelCopyWithImpl<$Res>
    extends _$AllTripStepsModelCopyWithImpl<$Res, _$_AllTripStepsModel>
    implements _$$_AllTripStepsModelCopyWith<$Res> {
  __$$_AllTripStepsModelCopyWithImpl(
      _$_AllTripStepsModel _value, $Res Function(_$_AllTripStepsModel) _then)
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
    Object? take5TogetherAPIModels = freezed,
    Object? endStatus = freezed,
  }) {
    return _then(_$_AllTripStepsModel(
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
      take5TogetherAPIModels: freezed == take5TogetherAPIModels
          ? _value.take5TogetherAPIModels
          : take5TogetherAPIModels // ignore: cast_nullable_to_non_nullable
              as Take5TogetherModel?,
      endStatus: freezed == endStatus
          ? _value.endStatus
          : endStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AllTripStepsModel implements _AllTripStepsModel {
  const _$_AllTripStepsModel(
      {this.userId,
      this.tripId,
      this.jobsiteId,
      this.destinationArrivedRequest,
      this.stepOneCompleteRequest,
      this.stepTwoStartRequest,
      this.stepTwoCompleteRequest,
      this.take5TogetherAPIModels,
      this.endStatus});

  factory _$_AllTripStepsModel.fromJson(Map<String, dynamic> json) =>
      _$$_AllTripStepsModelFromJson(json);

  @override
  final String? userId;
  @override
  final int? tripId;
  @override
  final int? jobsiteId;
//todo end
  @override
  final DestinationArrivedRequest? destinationArrivedRequest;
  @override
  final StepOneCompleteRequest? stepOneCompleteRequest;
  @override
  final StepTwoStartRequest? stepTwoStartRequest;
  @override
  final StepTwoCompleteRequest? stepTwoCompleteRequest;
  @override
  final Take5TogetherModel? take5TogetherAPIModels;
  @override
  final String? endStatus;

  @override
  String toString() {
    return 'AllTripStepsModel(userId: $userId, tripId: $tripId, jobsiteId: $jobsiteId, destinationArrivedRequest: $destinationArrivedRequest, stepOneCompleteRequest: $stepOneCompleteRequest, stepTwoStartRequest: $stepTwoStartRequest, stepTwoCompleteRequest: $stepTwoCompleteRequest, take5TogetherAPIModels: $take5TogetherAPIModels, endStatus: $endStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllTripStepsModel &&
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
                other.stepTwoCompleteRequest == stepTwoCompleteRequest) &&
            (identical(other.take5TogetherAPIModels, take5TogetherAPIModels) ||
                other.take5TogetherAPIModels == take5TogetherAPIModels) &&
            (identical(other.endStatus, endStatus) ||
                other.endStatus == endStatus));
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
      stepTwoCompleteRequest,
      take5TogetherAPIModels,
      endStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllTripStepsModelCopyWith<_$_AllTripStepsModel> get copyWith =>
      __$$_AllTripStepsModelCopyWithImpl<_$_AllTripStepsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AllTripStepsModelToJson(
      this,
    );
  }
}

abstract class _AllTripStepsModel implements AllTripStepsModel {
  const factory _AllTripStepsModel(
      {final String? userId,
      final int? tripId,
      final int? jobsiteId,
      final DestinationArrivedRequest? destinationArrivedRequest,
      final StepOneCompleteRequest? stepOneCompleteRequest,
      final StepTwoStartRequest? stepTwoStartRequest,
      final StepTwoCompleteRequest? stepTwoCompleteRequest,
      final Take5TogetherModel? take5TogetherAPIModels,
      final String? endStatus}) = _$_AllTripStepsModel;

  factory _AllTripStepsModel.fromJson(Map<String, dynamic> json) =
      _$_AllTripStepsModel.fromJson;

  @override
  String? get userId;
  @override
  int? get tripId;
  @override
  int? get jobsiteId;
  @override //todo end
  DestinationArrivedRequest? get destinationArrivedRequest;
  @override
  StepOneCompleteRequest? get stepOneCompleteRequest;
  @override
  StepTwoStartRequest? get stepTwoStartRequest;
  @override
  StepTwoCompleteRequest? get stepTwoCompleteRequest;
  @override
  Take5TogetherModel? get take5TogetherAPIModels;
  @override
  String? get endStatus;
  @override
  @JsonKey(ignore: true)
  _$$_AllTripStepsModelCopyWith<_$_AllTripStepsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
