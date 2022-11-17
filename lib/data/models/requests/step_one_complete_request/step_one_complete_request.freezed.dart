// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'step_one_complete_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StepOneCompleteRequest _$StepOneCompleteRequestFromJson(
    Map<String, dynamic> json) {
  return _StepOneCompleteRequest.fromJson(json);
}

/// @nodoc
mixin _$StepOneCompleteRequest {
  String get userId => throw _privateConstructorUsedError;
  int get jobSiteId => throw _privateConstructorUsedError;
  int get tripId => throw _privateConstructorUsedError;
  List<Answer> get answers => throw _privateConstructorUsedError;
  List<DangerModel> get dangers => throw _privateConstructorUsedError;
  DateTime get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepOneCompleteRequestCopyWith<StepOneCompleteRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepOneCompleteRequestCopyWith<$Res> {
  factory $StepOneCompleteRequestCopyWith(StepOneCompleteRequest value,
          $Res Function(StepOneCompleteRequest) then) =
      _$StepOneCompleteRequestCopyWithImpl<$Res, StepOneCompleteRequest>;
  @useResult
  $Res call(
      {String userId,
      int jobSiteId,
      int tripId,
      List<Answer> answers,
      List<DangerModel> dangers,
      DateTime createdDate});
}

/// @nodoc
class _$StepOneCompleteRequestCopyWithImpl<$Res,
        $Val extends StepOneCompleteRequest>
    implements $StepOneCompleteRequestCopyWith<$Res> {
  _$StepOneCompleteRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? jobSiteId = null,
    Object? tripId = null,
    Object? answers = null,
    Object? dangers = null,
    Object? createdDate = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      jobSiteId: null == jobSiteId
          ? _value.jobSiteId
          : jobSiteId // ignore: cast_nullable_to_non_nullable
              as int,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      dangers: null == dangers
          ? _value.dangers
          : dangers // ignore: cast_nullable_to_non_nullable
              as List<DangerModel>,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StepOneCompleteRequestCopyWith<$Res>
    implements $StepOneCompleteRequestCopyWith<$Res> {
  factory _$$_StepOneCompleteRequestCopyWith(_$_StepOneCompleteRequest value,
          $Res Function(_$_StepOneCompleteRequest) then) =
      __$$_StepOneCompleteRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      int jobSiteId,
      int tripId,
      List<Answer> answers,
      List<DangerModel> dangers,
      DateTime createdDate});
}

/// @nodoc
class __$$_StepOneCompleteRequestCopyWithImpl<$Res>
    extends _$StepOneCompleteRequestCopyWithImpl<$Res,
        _$_StepOneCompleteRequest>
    implements _$$_StepOneCompleteRequestCopyWith<$Res> {
  __$$_StepOneCompleteRequestCopyWithImpl(_$_StepOneCompleteRequest _value,
      $Res Function(_$_StepOneCompleteRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? jobSiteId = null,
    Object? tripId = null,
    Object? answers = null,
    Object? dangers = null,
    Object? createdDate = null,
  }) {
    return _then(_$_StepOneCompleteRequest(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      jobSiteId: null == jobSiteId
          ? _value.jobSiteId
          : jobSiteId // ignore: cast_nullable_to_non_nullable
              as int,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      dangers: null == dangers
          ? _value._dangers
          : dangers // ignore: cast_nullable_to_non_nullable
              as List<DangerModel>,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StepOneCompleteRequest implements _StepOneCompleteRequest {
  const _$_StepOneCompleteRequest(
      {required this.userId,
      required this.jobSiteId,
      required this.tripId,
      required final List<Answer> answers,
      required final List<DangerModel> dangers,
      required this.createdDate})
      : _answers = answers,
        _dangers = dangers;

  factory _$_StepOneCompleteRequest.fromJson(Map<String, dynamic> json) =>
      _$$_StepOneCompleteRequestFromJson(json);

  @override
  final String userId;
  @override
  final int jobSiteId;
  @override
  final int tripId;
  final List<Answer> _answers;
  @override
  List<Answer> get answers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  final List<DangerModel> _dangers;
  @override
  List<DangerModel> get dangers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dangers);
  }

  @override
  final DateTime createdDate;

  @override
  String toString() {
    return 'StepOneCompleteRequest(userId: $userId, jobSiteId: $jobSiteId, tripId: $tripId, answers: $answers, dangers: $dangers, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StepOneCompleteRequest &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.jobSiteId, jobSiteId) ||
                other.jobSiteId == jobSiteId) &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            const DeepCollectionEquality().equals(other._dangers, _dangers) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      jobSiteId,
      tripId,
      const DeepCollectionEquality().hash(_answers),
      const DeepCollectionEquality().hash(_dangers),
      createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StepOneCompleteRequestCopyWith<_$_StepOneCompleteRequest> get copyWith =>
      __$$_StepOneCompleteRequestCopyWithImpl<_$_StepOneCompleteRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StepOneCompleteRequestToJson(
      this,
    );
  }
}

abstract class _StepOneCompleteRequest implements StepOneCompleteRequest {
  const factory _StepOneCompleteRequest(
      {required final String userId,
      required final int jobSiteId,
      required final int tripId,
      required final List<Answer> answers,
      required final List<DangerModel> dangers,
      required final DateTime createdDate}) = _$_StepOneCompleteRequest;

  factory _StepOneCompleteRequest.fromJson(Map<String, dynamic> json) =
      _$_StepOneCompleteRequest.fromJson;

  @override
  String get userId;
  @override
  int get jobSiteId;
  @override
  int get tripId;
  @override
  List<Answer> get answers;
  @override
  List<DangerModel> get dangers;
  @override
  DateTime get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$_StepOneCompleteRequestCopyWith<_$_StepOneCompleteRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
