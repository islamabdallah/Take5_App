// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  int? get jobsiteId => throw _privateConstructorUsedError;
  String? get truckNumber => throw _privateConstructorUsedError;
  TripDestinationArrivedModel? get tripDestinationArrivedModel =>
      throw _privateConstructorUsedError;
  SurveyStepOneAnswersAPIModel? get surveyStepOneAnswersAPIModel =>
      throw _privateConstructorUsedError;
  Take5StepTwoRequestAPIModel? get take5StepTwoRequestAPIModel =>
      throw _privateConstructorUsedError;
  SurveyStepTwoAnswersAPIModel? get surveyStepTwoAnswersAPIModel =>
      throw _privateConstructorUsedError;
  List<Take5TogetherModel>? get take5TogetherAPIModels =>
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
      String? truckNumber,
      TripDestinationArrivedModel? tripDestinationArrivedModel,
      SurveyStepOneAnswersAPIModel? surveyStepOneAnswersAPIModel,
      Take5StepTwoRequestAPIModel? take5StepTwoRequestAPIModel,
      SurveyStepTwoAnswersAPIModel? surveyStepTwoAnswersAPIModel,
      List<Take5TogetherModel>? take5TogetherAPIModels,
      String? endStatus});

  $TripDestinationArrivedModelCopyWith<$Res>? get tripDestinationArrivedModel;
  $SurveyStepOneAnswersAPIModelCopyWith<$Res>? get surveyStepOneAnswersAPIModel;
  $Take5StepTwoRequestAPIModelCopyWith<$Res>? get take5StepTwoRequestAPIModel;
  $SurveyStepTwoAnswersAPIModelCopyWith<$Res>? get surveyStepTwoAnswersAPIModel;
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
    Object? truckNumber = freezed,
    Object? tripDestinationArrivedModel = freezed,
    Object? surveyStepOneAnswersAPIModel = freezed,
    Object? take5StepTwoRequestAPIModel = freezed,
    Object? surveyStepTwoAnswersAPIModel = freezed,
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
      truckNumber: freezed == truckNumber
          ? _value.truckNumber
          : truckNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      tripDestinationArrivedModel: freezed == tripDestinationArrivedModel
          ? _value.tripDestinationArrivedModel
          : tripDestinationArrivedModel // ignore: cast_nullable_to_non_nullable
              as TripDestinationArrivedModel?,
      surveyStepOneAnswersAPIModel: freezed == surveyStepOneAnswersAPIModel
          ? _value.surveyStepOneAnswersAPIModel
          : surveyStepOneAnswersAPIModel // ignore: cast_nullable_to_non_nullable
              as SurveyStepOneAnswersAPIModel?,
      take5StepTwoRequestAPIModel: freezed == take5StepTwoRequestAPIModel
          ? _value.take5StepTwoRequestAPIModel
          : take5StepTwoRequestAPIModel // ignore: cast_nullable_to_non_nullable
              as Take5StepTwoRequestAPIModel?,
      surveyStepTwoAnswersAPIModel: freezed == surveyStepTwoAnswersAPIModel
          ? _value.surveyStepTwoAnswersAPIModel
          : surveyStepTwoAnswersAPIModel // ignore: cast_nullable_to_non_nullable
              as SurveyStepTwoAnswersAPIModel?,
      take5TogetherAPIModels: freezed == take5TogetherAPIModels
          ? _value.take5TogetherAPIModels
          : take5TogetherAPIModels // ignore: cast_nullable_to_non_nullable
              as List<Take5TogetherModel>?,
      endStatus: freezed == endStatus
          ? _value.endStatus
          : endStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TripDestinationArrivedModelCopyWith<$Res>? get tripDestinationArrivedModel {
    if (_value.tripDestinationArrivedModel == null) {
      return null;
    }

    return $TripDestinationArrivedModelCopyWith<$Res>(
        _value.tripDestinationArrivedModel!, (value) {
      return _then(_value.copyWith(tripDestinationArrivedModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SurveyStepOneAnswersAPIModelCopyWith<$Res>?
      get surveyStepOneAnswersAPIModel {
    if (_value.surveyStepOneAnswersAPIModel == null) {
      return null;
    }

    return $SurveyStepOneAnswersAPIModelCopyWith<$Res>(
        _value.surveyStepOneAnswersAPIModel!, (value) {
      return _then(
          _value.copyWith(surveyStepOneAnswersAPIModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $Take5StepTwoRequestAPIModelCopyWith<$Res>? get take5StepTwoRequestAPIModel {
    if (_value.take5StepTwoRequestAPIModel == null) {
      return null;
    }

    return $Take5StepTwoRequestAPIModelCopyWith<$Res>(
        _value.take5StepTwoRequestAPIModel!, (value) {
      return _then(_value.copyWith(take5StepTwoRequestAPIModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SurveyStepTwoAnswersAPIModelCopyWith<$Res>?
      get surveyStepTwoAnswersAPIModel {
    if (_value.surveyStepTwoAnswersAPIModel == null) {
      return null;
    }

    return $SurveyStepTwoAnswersAPIModelCopyWith<$Res>(
        _value.surveyStepTwoAnswersAPIModel!, (value) {
      return _then(
          _value.copyWith(surveyStepTwoAnswersAPIModel: value) as $Val);
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
      String? truckNumber,
      TripDestinationArrivedModel? tripDestinationArrivedModel,
      SurveyStepOneAnswersAPIModel? surveyStepOneAnswersAPIModel,
      Take5StepTwoRequestAPIModel? take5StepTwoRequestAPIModel,
      SurveyStepTwoAnswersAPIModel? surveyStepTwoAnswersAPIModel,
      List<Take5TogetherModel>? take5TogetherAPIModels,
      String? endStatus});

  @override
  $TripDestinationArrivedModelCopyWith<$Res>? get tripDestinationArrivedModel;
  @override
  $SurveyStepOneAnswersAPIModelCopyWith<$Res>? get surveyStepOneAnswersAPIModel;
  @override
  $Take5StepTwoRequestAPIModelCopyWith<$Res>? get take5StepTwoRequestAPIModel;
  @override
  $SurveyStepTwoAnswersAPIModelCopyWith<$Res>? get surveyStepTwoAnswersAPIModel;
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
    Object? truckNumber = freezed,
    Object? tripDestinationArrivedModel = freezed,
    Object? surveyStepOneAnswersAPIModel = freezed,
    Object? take5StepTwoRequestAPIModel = freezed,
    Object? surveyStepTwoAnswersAPIModel = freezed,
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
      truckNumber: freezed == truckNumber
          ? _value.truckNumber
          : truckNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      tripDestinationArrivedModel: freezed == tripDestinationArrivedModel
          ? _value.tripDestinationArrivedModel
          : tripDestinationArrivedModel // ignore: cast_nullable_to_non_nullable
              as TripDestinationArrivedModel?,
      surveyStepOneAnswersAPIModel: freezed == surveyStepOneAnswersAPIModel
          ? _value.surveyStepOneAnswersAPIModel
          : surveyStepOneAnswersAPIModel // ignore: cast_nullable_to_non_nullable
              as SurveyStepOneAnswersAPIModel?,
      take5StepTwoRequestAPIModel: freezed == take5StepTwoRequestAPIModel
          ? _value.take5StepTwoRequestAPIModel
          : take5StepTwoRequestAPIModel // ignore: cast_nullable_to_non_nullable
              as Take5StepTwoRequestAPIModel?,
      surveyStepTwoAnswersAPIModel: freezed == surveyStepTwoAnswersAPIModel
          ? _value.surveyStepTwoAnswersAPIModel
          : surveyStepTwoAnswersAPIModel // ignore: cast_nullable_to_non_nullable
              as SurveyStepTwoAnswersAPIModel?,
      take5TogetherAPIModels: freezed == take5TogetherAPIModels
          ? _value._take5TogetherAPIModels
          : take5TogetherAPIModels // ignore: cast_nullable_to_non_nullable
              as List<Take5TogetherModel>?,
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
      this.truckNumber,
      this.tripDestinationArrivedModel,
      this.surveyStepOneAnswersAPIModel,
      this.take5StepTwoRequestAPIModel,
      this.surveyStepTwoAnswersAPIModel,
      final List<Take5TogetherModel>? take5TogetherAPIModels,
      this.endStatus})
      : _take5TogetherAPIModels = take5TogetherAPIModels;

  factory _$_AllTripStepsModel.fromJson(Map<String, dynamic> json) =>
      _$$_AllTripStepsModelFromJson(json);

  @override
  final String? userId;
  @override
  final int? tripId;
  @override
  final int? jobsiteId;
  @override
  final String? truckNumber;
  @override
  final TripDestinationArrivedModel? tripDestinationArrivedModel;
  @override
  final SurveyStepOneAnswersAPIModel? surveyStepOneAnswersAPIModel;
  @override
  final Take5StepTwoRequestAPIModel? take5StepTwoRequestAPIModel;
  @override
  final SurveyStepTwoAnswersAPIModel? surveyStepTwoAnswersAPIModel;
  final List<Take5TogetherModel>? _take5TogetherAPIModels;
  @override
  List<Take5TogetherModel>? get take5TogetherAPIModels {
    final value = _take5TogetherAPIModels;
    if (value == null) return null;
    if (_take5TogetherAPIModels is EqualUnmodifiableListView)
      return _take5TogetherAPIModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? endStatus;

  @override
  String toString() {
    return 'AllTripStepsModel(userId: $userId, tripId: $tripId, jobsiteId: $jobsiteId, truckNumber: $truckNumber, tripDestinationArrivedModel: $tripDestinationArrivedModel, surveyStepOneAnswersAPIModel: $surveyStepOneAnswersAPIModel, take5StepTwoRequestAPIModel: $take5StepTwoRequestAPIModel, surveyStepTwoAnswersAPIModel: $surveyStepTwoAnswersAPIModel, take5TogetherAPIModels: $take5TogetherAPIModels, endStatus: $endStatus)';
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
            (identical(other.truckNumber, truckNumber) ||
                other.truckNumber == truckNumber) &&
            (identical(other.tripDestinationArrivedModel,
                    tripDestinationArrivedModel) ||
                other.tripDestinationArrivedModel ==
                    tripDestinationArrivedModel) &&
            (identical(other.surveyStepOneAnswersAPIModel,
                    surveyStepOneAnswersAPIModel) ||
                other.surveyStepOneAnswersAPIModel ==
                    surveyStepOneAnswersAPIModel) &&
            (identical(other.take5StepTwoRequestAPIModel,
                    take5StepTwoRequestAPIModel) ||
                other.take5StepTwoRequestAPIModel ==
                    take5StepTwoRequestAPIModel) &&
            (identical(other.surveyStepTwoAnswersAPIModel,
                    surveyStepTwoAnswersAPIModel) ||
                other.surveyStepTwoAnswersAPIModel ==
                    surveyStepTwoAnswersAPIModel) &&
            const DeepCollectionEquality().equals(
                other._take5TogetherAPIModels, _take5TogetherAPIModels) &&
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
      truckNumber,
      tripDestinationArrivedModel,
      surveyStepOneAnswersAPIModel,
      take5StepTwoRequestAPIModel,
      surveyStepTwoAnswersAPIModel,
      const DeepCollectionEquality().hash(_take5TogetherAPIModels),
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
      final String? truckNumber,
      final TripDestinationArrivedModel? tripDestinationArrivedModel,
      final SurveyStepOneAnswersAPIModel? surveyStepOneAnswersAPIModel,
      final Take5StepTwoRequestAPIModel? take5StepTwoRequestAPIModel,
      final SurveyStepTwoAnswersAPIModel? surveyStepTwoAnswersAPIModel,
      final List<Take5TogetherModel>? take5TogetherAPIModels,
      final String? endStatus}) = _$_AllTripStepsModel;

  factory _AllTripStepsModel.fromJson(Map<String, dynamic> json) =
      _$_AllTripStepsModel.fromJson;

  @override
  String? get userId;
  @override
  int? get tripId;
  @override
  int? get jobsiteId;
  @override
  String? get truckNumber;
  @override
  TripDestinationArrivedModel? get tripDestinationArrivedModel;
  @override
  SurveyStepOneAnswersAPIModel? get surveyStepOneAnswersAPIModel;
  @override
  Take5StepTwoRequestAPIModel? get take5StepTwoRequestAPIModel;
  @override
  SurveyStepTwoAnswersAPIModel? get surveyStepTwoAnswersAPIModel;
  @override
  List<Take5TogetherModel>? get take5TogetherAPIModels;
  @override
  String? get endStatus;
  @override
  @JsonKey(ignore: true)
  _$$_AllTripStepsModelCopyWith<_$_AllTripStepsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
