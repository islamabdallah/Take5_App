// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'step_two_complete_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SurveyStepTwoAnswersAPIModel _$SurveyStepTwoAnswersAPIModelFromJson(
    Map<String, dynamic> json) {
  return _SurveyStepTwoAnswersAPIModel.fromJson(json);
}

/// @nodoc
mixin _$SurveyStepTwoAnswersAPIModel {
  String get userId => throw _privateConstructorUsedError;
  int get tripId => throw _privateConstructorUsedError;
  int get jobSiteId => throw _privateConstructorUsedError;
  List<Answer> get answers => throw _privateConstructorUsedError;
  DateTime get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyStepTwoAnswersAPIModelCopyWith<SurveyStepTwoAnswersAPIModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyStepTwoAnswersAPIModelCopyWith<$Res> {
  factory $SurveyStepTwoAnswersAPIModelCopyWith(
          SurveyStepTwoAnswersAPIModel value,
          $Res Function(SurveyStepTwoAnswersAPIModel) then) =
      _$SurveyStepTwoAnswersAPIModelCopyWithImpl<$Res,
          SurveyStepTwoAnswersAPIModel>;
  @useResult
  $Res call(
      {String userId,
      int tripId,
      int jobSiteId,
      List<Answer> answers,
      DateTime createdDate});
}

/// @nodoc
class _$SurveyStepTwoAnswersAPIModelCopyWithImpl<$Res,
        $Val extends SurveyStepTwoAnswersAPIModel>
    implements $SurveyStepTwoAnswersAPIModelCopyWith<$Res> {
  _$SurveyStepTwoAnswersAPIModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? tripId = null,
    Object? jobSiteId = null,
    Object? answers = null,
    Object? createdDate = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
      jobSiteId: null == jobSiteId
          ? _value.jobSiteId
          : jobSiteId // ignore: cast_nullable_to_non_nullable
              as int,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SurveyStepTwoAnswersAPIModelCopyWith<$Res>
    implements $SurveyStepTwoAnswersAPIModelCopyWith<$Res> {
  factory _$$_SurveyStepTwoAnswersAPIModelCopyWith(
          _$_SurveyStepTwoAnswersAPIModel value,
          $Res Function(_$_SurveyStepTwoAnswersAPIModel) then) =
      __$$_SurveyStepTwoAnswersAPIModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      int tripId,
      int jobSiteId,
      List<Answer> answers,
      DateTime createdDate});
}

/// @nodoc
class __$$_SurveyStepTwoAnswersAPIModelCopyWithImpl<$Res>
    extends _$SurveyStepTwoAnswersAPIModelCopyWithImpl<$Res,
        _$_SurveyStepTwoAnswersAPIModel>
    implements _$$_SurveyStepTwoAnswersAPIModelCopyWith<$Res> {
  __$$_SurveyStepTwoAnswersAPIModelCopyWithImpl(
      _$_SurveyStepTwoAnswersAPIModel _value,
      $Res Function(_$_SurveyStepTwoAnswersAPIModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? tripId = null,
    Object? jobSiteId = null,
    Object? answers = null,
    Object? createdDate = null,
  }) {
    return _then(_$_SurveyStepTwoAnswersAPIModel(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
      jobSiteId: null == jobSiteId
          ? _value.jobSiteId
          : jobSiteId // ignore: cast_nullable_to_non_nullable
              as int,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SurveyStepTwoAnswersAPIModel implements _SurveyStepTwoAnswersAPIModel {
  const _$_SurveyStepTwoAnswersAPIModel(
      {required this.userId,
      required this.tripId,
      required this.jobSiteId,
      required final List<Answer> answers,
      required this.createdDate})
      : _answers = answers;

  factory _$_SurveyStepTwoAnswersAPIModel.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyStepTwoAnswersAPIModelFromJson(json);

  @override
  final String userId;
  @override
  final int tripId;
  @override
  final int jobSiteId;
  final List<Answer> _answers;
  @override
  List<Answer> get answers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final DateTime createdDate;

  @override
  String toString() {
    return 'SurveyStepTwoAnswersAPIModel(userId: $userId, tripId: $tripId, jobSiteId: $jobSiteId, answers: $answers, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurveyStepTwoAnswersAPIModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.jobSiteId, jobSiteId) ||
                other.jobSiteId == jobSiteId) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, tripId, jobSiteId,
      const DeepCollectionEquality().hash(_answers), createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SurveyStepTwoAnswersAPIModelCopyWith<_$_SurveyStepTwoAnswersAPIModel>
      get copyWith => __$$_SurveyStepTwoAnswersAPIModelCopyWithImpl<
          _$_SurveyStepTwoAnswersAPIModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyStepTwoAnswersAPIModelToJson(
      this,
    );
  }
}

abstract class _SurveyStepTwoAnswersAPIModel
    implements SurveyStepTwoAnswersAPIModel {
  const factory _SurveyStepTwoAnswersAPIModel(
      {required final String userId,
      required final int tripId,
      required final int jobSiteId,
      required final List<Answer> answers,
      required final DateTime createdDate}) = _$_SurveyStepTwoAnswersAPIModel;

  factory _SurveyStepTwoAnswersAPIModel.fromJson(Map<String, dynamic> json) =
      _$_SurveyStepTwoAnswersAPIModel.fromJson;

  @override
  String get userId;
  @override
  int get tripId;
  @override
  int get jobSiteId;
  @override
  List<Answer> get answers;
  @override
  DateTime get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyStepTwoAnswersAPIModelCopyWith<_$_SurveyStepTwoAnswersAPIModel>
      get copyWith => throw _privateConstructorUsedError;
}
