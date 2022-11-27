// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_trip_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserTripResponse _$UserTripResponseFromJson(Map<String, dynamic> json) {
  return _UserTripResponse.fromJson(json);
}

/// @nodoc
mixin _$UserTripResponse {
  String get message => throw _privateConstructorUsedError;
  TripWithSurveyMode get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserTripResponseCopyWith<UserTripResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTripResponseCopyWith<$Res> {
  factory $UserTripResponseCopyWith(
          UserTripResponse value, $Res Function(UserTripResponse) then) =
      _$UserTripResponseCopyWithImpl<$Res, UserTripResponse>;
  @useResult
  $Res call({String message, TripWithSurveyMode data});

  $TripWithSurveyModeCopyWith<$Res> get data;
}

/// @nodoc
class _$UserTripResponseCopyWithImpl<$Res, $Val extends UserTripResponse>
    implements $UserTripResponseCopyWith<$Res> {
  _$UserTripResponseCopyWithImpl(this._value, this._then);

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
              as TripWithSurveyMode,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TripWithSurveyModeCopyWith<$Res> get data {
    return $TripWithSurveyModeCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserTripResponseCopyWith<$Res>
    implements $UserTripResponseCopyWith<$Res> {
  factory _$$_UserTripResponseCopyWith(
          _$_UserTripResponse value, $Res Function(_$_UserTripResponse) then) =
      __$$_UserTripResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, TripWithSurveyMode data});

  @override
  $TripWithSurveyModeCopyWith<$Res> get data;
}

/// @nodoc
class __$$_UserTripResponseCopyWithImpl<$Res>
    extends _$UserTripResponseCopyWithImpl<$Res, _$_UserTripResponse>
    implements _$$_UserTripResponseCopyWith<$Res> {
  __$$_UserTripResponseCopyWithImpl(
      _$_UserTripResponse _value, $Res Function(_$_UserTripResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$_UserTripResponse(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TripWithSurveyMode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserTripResponse implements _UserTripResponse {
  const _$_UserTripResponse({required this.message, required this.data});

  factory _$_UserTripResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UserTripResponseFromJson(json);

  @override
  final String message;
  @override
  final TripWithSurveyMode data;

  @override
  String toString() {
    return 'UserTripResponse(message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserTripResponse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserTripResponseCopyWith<_$_UserTripResponse> get copyWith =>
      __$$_UserTripResponseCopyWithImpl<_$_UserTripResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserTripResponseToJson(
      this,
    );
  }
}

abstract class _UserTripResponse implements UserTripResponse {
  const factory _UserTripResponse(
      {required final String message,
      required final TripWithSurveyMode data}) = _$_UserTripResponse;

  factory _UserTripResponse.fromJson(Map<String, dynamic> json) =
      _$_UserTripResponse.fromJson;

  @override
  String get message;
  @override
  TripWithSurveyMode get data;
  @override
  @JsonKey(ignore: true)
  _$$_UserTripResponseCopyWith<_$_UserTripResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

TripWithSurveyMode _$TripWithSurveyModeFromJson(Map<String, dynamic> json) {
  return _TripWithSurveyMode.fromJson(json);
}

/// @nodoc
mixin _$TripWithSurveyMode {
  TakeFiveSurvey get allSurveyModel => throw _privateConstructorUsedError;
  Trip get tripAPIModel => throw _privateConstructorUsedError;
  List<Driver> get drivers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripWithSurveyModeCopyWith<TripWithSurveyMode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripWithSurveyModeCopyWith<$Res> {
  factory $TripWithSurveyModeCopyWith(
          TripWithSurveyMode value, $Res Function(TripWithSurveyMode) then) =
      _$TripWithSurveyModeCopyWithImpl<$Res, TripWithSurveyMode>;
  @useResult
  $Res call(
      {TakeFiveSurvey allSurveyModel, Trip tripAPIModel, List<Driver> drivers});

  $TakeFiveSurveyCopyWith<$Res> get allSurveyModel;
  $TripCopyWith<$Res> get tripAPIModel;
}

/// @nodoc
class _$TripWithSurveyModeCopyWithImpl<$Res, $Val extends TripWithSurveyMode>
    implements $TripWithSurveyModeCopyWith<$Res> {
  _$TripWithSurveyModeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allSurveyModel = null,
    Object? tripAPIModel = null,
    Object? drivers = null,
  }) {
    return _then(_value.copyWith(
      allSurveyModel: null == allSurveyModel
          ? _value.allSurveyModel
          : allSurveyModel // ignore: cast_nullable_to_non_nullable
              as TakeFiveSurvey,
      tripAPIModel: null == tripAPIModel
          ? _value.tripAPIModel
          : tripAPIModel // ignore: cast_nullable_to_non_nullable
              as Trip,
      drivers: null == drivers
          ? _value.drivers
          : drivers // ignore: cast_nullable_to_non_nullable
              as List<Driver>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TakeFiveSurveyCopyWith<$Res> get allSurveyModel {
    return $TakeFiveSurveyCopyWith<$Res>(_value.allSurveyModel, (value) {
      return _then(_value.copyWith(allSurveyModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TripCopyWith<$Res> get tripAPIModel {
    return $TripCopyWith<$Res>(_value.tripAPIModel, (value) {
      return _then(_value.copyWith(tripAPIModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TripWithSurveyModeCopyWith<$Res>
    implements $TripWithSurveyModeCopyWith<$Res> {
  factory _$$_TripWithSurveyModeCopyWith(_$_TripWithSurveyMode value,
          $Res Function(_$_TripWithSurveyMode) then) =
      __$$_TripWithSurveyModeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TakeFiveSurvey allSurveyModel, Trip tripAPIModel, List<Driver> drivers});

  @override
  $TakeFiveSurveyCopyWith<$Res> get allSurveyModel;
  @override
  $TripCopyWith<$Res> get tripAPIModel;
}

/// @nodoc
class __$$_TripWithSurveyModeCopyWithImpl<$Res>
    extends _$TripWithSurveyModeCopyWithImpl<$Res, _$_TripWithSurveyMode>
    implements _$$_TripWithSurveyModeCopyWith<$Res> {
  __$$_TripWithSurveyModeCopyWithImpl(
      _$_TripWithSurveyMode _value, $Res Function(_$_TripWithSurveyMode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allSurveyModel = null,
    Object? tripAPIModel = null,
    Object? drivers = null,
  }) {
    return _then(_$_TripWithSurveyMode(
      allSurveyModel: null == allSurveyModel
          ? _value.allSurveyModel
          : allSurveyModel // ignore: cast_nullable_to_non_nullable
              as TakeFiveSurvey,
      tripAPIModel: null == tripAPIModel
          ? _value.tripAPIModel
          : tripAPIModel // ignore: cast_nullable_to_non_nullable
              as Trip,
      drivers: null == drivers
          ? _value._drivers
          : drivers // ignore: cast_nullable_to_non_nullable
              as List<Driver>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TripWithSurveyMode implements _TripWithSurveyMode {
  const _$_TripWithSurveyMode(
      {required this.allSurveyModel,
      required this.tripAPIModel,
      required final List<Driver> drivers})
      : _drivers = drivers;

  factory _$_TripWithSurveyMode.fromJson(Map<String, dynamic> json) =>
      _$$_TripWithSurveyModeFromJson(json);

  @override
  final TakeFiveSurvey allSurveyModel;
  @override
  final Trip tripAPIModel;
  final List<Driver> _drivers;
  @override
  List<Driver> get drivers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drivers);
  }

  @override
  String toString() {
    return 'TripWithSurveyMode(allSurveyModel: $allSurveyModel, tripAPIModel: $tripAPIModel, drivers: $drivers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripWithSurveyMode &&
            (identical(other.allSurveyModel, allSurveyModel) ||
                other.allSurveyModel == allSurveyModel) &&
            (identical(other.tripAPIModel, tripAPIModel) ||
                other.tripAPIModel == tripAPIModel) &&
            const DeepCollectionEquality().equals(other._drivers, _drivers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, allSurveyModel, tripAPIModel,
      const DeepCollectionEquality().hash(_drivers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TripWithSurveyModeCopyWith<_$_TripWithSurveyMode> get copyWith =>
      __$$_TripWithSurveyModeCopyWithImpl<_$_TripWithSurveyMode>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TripWithSurveyModeToJson(
      this,
    );
  }
}

abstract class _TripWithSurveyMode implements TripWithSurveyMode {
  const factory _TripWithSurveyMode(
      {required final TakeFiveSurvey allSurveyModel,
      required final Trip tripAPIModel,
      required final List<Driver> drivers}) = _$_TripWithSurveyMode;

  factory _TripWithSurveyMode.fromJson(Map<String, dynamic> json) =
      _$_TripWithSurveyMode.fromJson;

  @override
  TakeFiveSurvey get allSurveyModel;
  @override
  Trip get tripAPIModel;
  @override
  List<Driver> get drivers;
  @override
  @JsonKey(ignore: true)
  _$$_TripWithSurveyModeCopyWith<_$_TripWithSurveyMode> get copyWith =>
      throw _privateConstructorUsedError;
}

TakeFiveSurvey _$TakeFiveSurveyFromJson(Map<String, dynamic> json) {
  return _TakeFiveSurvey.fromJson(json);
}

/// @nodoc
mixin _$TakeFiveSurvey {
  List<QuestionAnswerModel> get stepOneQuestions =>
      throw _privateConstructorUsedError;
  List<QuestionAnswerModel> get stepTwoQuestions =>
      throw _privateConstructorUsedError;
  List<DangerWithCategoryAPIModels> get dangerWithCategoryAPIModels =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TakeFiveSurveyCopyWith<TakeFiveSurvey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TakeFiveSurveyCopyWith<$Res> {
  factory $TakeFiveSurveyCopyWith(
          TakeFiveSurvey value, $Res Function(TakeFiveSurvey) then) =
      _$TakeFiveSurveyCopyWithImpl<$Res, TakeFiveSurvey>;
  @useResult
  $Res call(
      {List<QuestionAnswerModel> stepOneQuestions,
      List<QuestionAnswerModel> stepTwoQuestions,
      List<DangerWithCategoryAPIModels> dangerWithCategoryAPIModels});
}

/// @nodoc
class _$TakeFiveSurveyCopyWithImpl<$Res, $Val extends TakeFiveSurvey>
    implements $TakeFiveSurveyCopyWith<$Res> {
  _$TakeFiveSurveyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepOneQuestions = null,
    Object? stepTwoQuestions = null,
    Object? dangerWithCategoryAPIModels = null,
  }) {
    return _then(_value.copyWith(
      stepOneQuestions: null == stepOneQuestions
          ? _value.stepOneQuestions
          : stepOneQuestions // ignore: cast_nullable_to_non_nullable
              as List<QuestionAnswerModel>,
      stepTwoQuestions: null == stepTwoQuestions
          ? _value.stepTwoQuestions
          : stepTwoQuestions // ignore: cast_nullable_to_non_nullable
              as List<QuestionAnswerModel>,
      dangerWithCategoryAPIModels: null == dangerWithCategoryAPIModels
          ? _value.dangerWithCategoryAPIModels
          : dangerWithCategoryAPIModels // ignore: cast_nullable_to_non_nullable
              as List<DangerWithCategoryAPIModels>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TakeFiveSurveyCopyWith<$Res>
    implements $TakeFiveSurveyCopyWith<$Res> {
  factory _$$_TakeFiveSurveyCopyWith(
          _$_TakeFiveSurvey value, $Res Function(_$_TakeFiveSurvey) then) =
      __$$_TakeFiveSurveyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<QuestionAnswerModel> stepOneQuestions,
      List<QuestionAnswerModel> stepTwoQuestions,
      List<DangerWithCategoryAPIModels> dangerWithCategoryAPIModels});
}

/// @nodoc
class __$$_TakeFiveSurveyCopyWithImpl<$Res>
    extends _$TakeFiveSurveyCopyWithImpl<$Res, _$_TakeFiveSurvey>
    implements _$$_TakeFiveSurveyCopyWith<$Res> {
  __$$_TakeFiveSurveyCopyWithImpl(
      _$_TakeFiveSurvey _value, $Res Function(_$_TakeFiveSurvey) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepOneQuestions = null,
    Object? stepTwoQuestions = null,
    Object? dangerWithCategoryAPIModels = null,
  }) {
    return _then(_$_TakeFiveSurvey(
      stepOneQuestions: null == stepOneQuestions
          ? _value._stepOneQuestions
          : stepOneQuestions // ignore: cast_nullable_to_non_nullable
              as List<QuestionAnswerModel>,
      stepTwoQuestions: null == stepTwoQuestions
          ? _value._stepTwoQuestions
          : stepTwoQuestions // ignore: cast_nullable_to_non_nullable
              as List<QuestionAnswerModel>,
      dangerWithCategoryAPIModels: null == dangerWithCategoryAPIModels
          ? _value._dangerWithCategoryAPIModels
          : dangerWithCategoryAPIModels // ignore: cast_nullable_to_non_nullable
              as List<DangerWithCategoryAPIModels>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TakeFiveSurvey implements _TakeFiveSurvey {
  const _$_TakeFiveSurvey(
      {required final List<QuestionAnswerModel> stepOneQuestions,
      required final List<QuestionAnswerModel> stepTwoQuestions,
      required final List<DangerWithCategoryAPIModels>
          dangerWithCategoryAPIModels})
      : _stepOneQuestions = stepOneQuestions,
        _stepTwoQuestions = stepTwoQuestions,
        _dangerWithCategoryAPIModels = dangerWithCategoryAPIModels;

  factory _$_TakeFiveSurvey.fromJson(Map<String, dynamic> json) =>
      _$$_TakeFiveSurveyFromJson(json);

  final List<QuestionAnswerModel> _stepOneQuestions;
  @override
  List<QuestionAnswerModel> get stepOneQuestions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stepOneQuestions);
  }

  final List<QuestionAnswerModel> _stepTwoQuestions;
  @override
  List<QuestionAnswerModel> get stepTwoQuestions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stepTwoQuestions);
  }

  final List<DangerWithCategoryAPIModels> _dangerWithCategoryAPIModels;
  @override
  List<DangerWithCategoryAPIModels> get dangerWithCategoryAPIModels {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dangerWithCategoryAPIModels);
  }

  @override
  String toString() {
    return 'TakeFiveSurvey(stepOneQuestions: $stepOneQuestions, stepTwoQuestions: $stepTwoQuestions, dangerWithCategoryAPIModels: $dangerWithCategoryAPIModels)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TakeFiveSurvey &&
            const DeepCollectionEquality()
                .equals(other._stepOneQuestions, _stepOneQuestions) &&
            const DeepCollectionEquality()
                .equals(other._stepTwoQuestions, _stepTwoQuestions) &&
            const DeepCollectionEquality().equals(
                other._dangerWithCategoryAPIModels,
                _dangerWithCategoryAPIModels));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_stepOneQuestions),
      const DeepCollectionEquality().hash(_stepTwoQuestions),
      const DeepCollectionEquality().hash(_dangerWithCategoryAPIModels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TakeFiveSurveyCopyWith<_$_TakeFiveSurvey> get copyWith =>
      __$$_TakeFiveSurveyCopyWithImpl<_$_TakeFiveSurvey>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TakeFiveSurveyToJson(
      this,
    );
  }
}

abstract class _TakeFiveSurvey implements TakeFiveSurvey {
  const factory _TakeFiveSurvey(
      {required final List<QuestionAnswerModel> stepOneQuestions,
      required final List<QuestionAnswerModel> stepTwoQuestions,
      required final List<DangerWithCategoryAPIModels>
          dangerWithCategoryAPIModels}) = _$_TakeFiveSurvey;

  factory _TakeFiveSurvey.fromJson(Map<String, dynamic> json) =
      _$_TakeFiveSurvey.fromJson;

  @override
  List<QuestionAnswerModel> get stepOneQuestions;
  @override
  List<QuestionAnswerModel> get stepTwoQuestions;
  @override
  List<DangerWithCategoryAPIModels> get dangerWithCategoryAPIModels;
  @override
  @JsonKey(ignore: true)
  _$$_TakeFiveSurveyCopyWith<_$_TakeFiveSurvey> get copyWith =>
      throw _privateConstructorUsedError;
}

DangerWithCategoryAPIModels _$DangerWithCategoryAPIModelsFromJson(
    Map<String, dynamic> json) {
  return _DangerWithCategoryAPIModels.fromJson(json);
}

/// @nodoc
mixin _$DangerWithCategoryAPIModels {
  String get dangerCategory => throw _privateConstructorUsedError;
  int get dangerCategoryId => throw _privateConstructorUsedError;
  List<DangerModel> get dangerModels => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DangerWithCategoryAPIModelsCopyWith<DangerWithCategoryAPIModels>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DangerWithCategoryAPIModelsCopyWith<$Res> {
  factory $DangerWithCategoryAPIModelsCopyWith(
          DangerWithCategoryAPIModels value,
          $Res Function(DangerWithCategoryAPIModels) then) =
      _$DangerWithCategoryAPIModelsCopyWithImpl<$Res,
          DangerWithCategoryAPIModels>;
  @useResult
  $Res call(
      {String dangerCategory,
      int dangerCategoryId,
      List<DangerModel> dangerModels});
}

/// @nodoc
class _$DangerWithCategoryAPIModelsCopyWithImpl<$Res,
        $Val extends DangerWithCategoryAPIModels>
    implements $DangerWithCategoryAPIModelsCopyWith<$Res> {
  _$DangerWithCategoryAPIModelsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dangerCategory = null,
    Object? dangerCategoryId = null,
    Object? dangerModels = null,
  }) {
    return _then(_value.copyWith(
      dangerCategory: null == dangerCategory
          ? _value.dangerCategory
          : dangerCategory // ignore: cast_nullable_to_non_nullable
              as String,
      dangerCategoryId: null == dangerCategoryId
          ? _value.dangerCategoryId
          : dangerCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      dangerModels: null == dangerModels
          ? _value.dangerModels
          : dangerModels // ignore: cast_nullable_to_non_nullable
              as List<DangerModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DangerWithCategoryAPIModelsCopyWith<$Res>
    implements $DangerWithCategoryAPIModelsCopyWith<$Res> {
  factory _$$_DangerWithCategoryAPIModelsCopyWith(
          _$_DangerWithCategoryAPIModels value,
          $Res Function(_$_DangerWithCategoryAPIModels) then) =
      __$$_DangerWithCategoryAPIModelsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dangerCategory,
      int dangerCategoryId,
      List<DangerModel> dangerModels});
}

/// @nodoc
class __$$_DangerWithCategoryAPIModelsCopyWithImpl<$Res>
    extends _$DangerWithCategoryAPIModelsCopyWithImpl<$Res,
        _$_DangerWithCategoryAPIModels>
    implements _$$_DangerWithCategoryAPIModelsCopyWith<$Res> {
  __$$_DangerWithCategoryAPIModelsCopyWithImpl(
      _$_DangerWithCategoryAPIModels _value,
      $Res Function(_$_DangerWithCategoryAPIModels) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dangerCategory = null,
    Object? dangerCategoryId = null,
    Object? dangerModels = null,
  }) {
    return _then(_$_DangerWithCategoryAPIModels(
      dangerCategory: null == dangerCategory
          ? _value.dangerCategory
          : dangerCategory // ignore: cast_nullable_to_non_nullable
              as String,
      dangerCategoryId: null == dangerCategoryId
          ? _value.dangerCategoryId
          : dangerCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      dangerModels: null == dangerModels
          ? _value._dangerModels
          : dangerModels // ignore: cast_nullable_to_non_nullable
              as List<DangerModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DangerWithCategoryAPIModels implements _DangerWithCategoryAPIModels {
  const _$_DangerWithCategoryAPIModels(
      {required this.dangerCategory,
      required this.dangerCategoryId,
      required final List<DangerModel> dangerModels})
      : _dangerModels = dangerModels;

  factory _$_DangerWithCategoryAPIModels.fromJson(Map<String, dynamic> json) =>
      _$$_DangerWithCategoryAPIModelsFromJson(json);

  @override
  final String dangerCategory;
  @override
  final int dangerCategoryId;
  final List<DangerModel> _dangerModels;
  @override
  List<DangerModel> get dangerModels {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dangerModels);
  }

  @override
  String toString() {
    return 'DangerWithCategoryAPIModels(dangerCategory: $dangerCategory, dangerCategoryId: $dangerCategoryId, dangerModels: $dangerModels)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DangerWithCategoryAPIModels &&
            (identical(other.dangerCategory, dangerCategory) ||
                other.dangerCategory == dangerCategory) &&
            (identical(other.dangerCategoryId, dangerCategoryId) ||
                other.dangerCategoryId == dangerCategoryId) &&
            const DeepCollectionEquality()
                .equals(other._dangerModels, _dangerModels));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dangerCategory, dangerCategoryId,
      const DeepCollectionEquality().hash(_dangerModels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DangerWithCategoryAPIModelsCopyWith<_$_DangerWithCategoryAPIModels>
      get copyWith => __$$_DangerWithCategoryAPIModelsCopyWithImpl<
          _$_DangerWithCategoryAPIModels>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DangerWithCategoryAPIModelsToJson(
      this,
    );
  }
}

abstract class _DangerWithCategoryAPIModels
    implements DangerWithCategoryAPIModels {
  const factory _DangerWithCategoryAPIModels(
          {required final String dangerCategory,
          required final int dangerCategoryId,
          required final List<DangerModel> dangerModels}) =
      _$_DangerWithCategoryAPIModels;

  factory _DangerWithCategoryAPIModels.fromJson(Map<String, dynamic> json) =
      _$_DangerWithCategoryAPIModels.fromJson;

  @override
  String get dangerCategory;
  @override
  int get dangerCategoryId;
  @override
  List<DangerModel> get dangerModels;
  @override
  @JsonKey(ignore: true)
  _$$_DangerWithCategoryAPIModelsCopyWith<_$_DangerWithCategoryAPIModels>
      get copyWith => throw _privateConstructorUsedError;
}

DangerModel _$DangerModelFromJson(Map<String, dynamic> json) {
  return _DangerModel.fromJson(json);
}

/// @nodoc
mixin _$DangerModel {
  int get dangerId => throw _privateConstructorUsedError;
  String get dangerName =>
      throw _privateConstructorUsedError; //required String dangerImage,
  List<MeasureControlApi> get measureControlAPIs =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DangerModelCopyWith<DangerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DangerModelCopyWith<$Res> {
  factory $DangerModelCopyWith(
          DangerModel value, $Res Function(DangerModel) then) =
      _$DangerModelCopyWithImpl<$Res, DangerModel>;
  @useResult
  $Res call(
      {int dangerId,
      String dangerName,
      List<MeasureControlApi> measureControlAPIs});
}

/// @nodoc
class _$DangerModelCopyWithImpl<$Res, $Val extends DangerModel>
    implements $DangerModelCopyWith<$Res> {
  _$DangerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dangerId = null,
    Object? dangerName = null,
    Object? measureControlAPIs = null,
  }) {
    return _then(_value.copyWith(
      dangerId: null == dangerId
          ? _value.dangerId
          : dangerId // ignore: cast_nullable_to_non_nullable
              as int,
      dangerName: null == dangerName
          ? _value.dangerName
          : dangerName // ignore: cast_nullable_to_non_nullable
              as String,
      measureControlAPIs: null == measureControlAPIs
          ? _value.measureControlAPIs
          : measureControlAPIs // ignore: cast_nullable_to_non_nullable
              as List<MeasureControlApi>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DangerModelCopyWith<$Res>
    implements $DangerModelCopyWith<$Res> {
  factory _$$_DangerModelCopyWith(
          _$_DangerModel value, $Res Function(_$_DangerModel) then) =
      __$$_DangerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int dangerId,
      String dangerName,
      List<MeasureControlApi> measureControlAPIs});
}

/// @nodoc
class __$$_DangerModelCopyWithImpl<$Res>
    extends _$DangerModelCopyWithImpl<$Res, _$_DangerModel>
    implements _$$_DangerModelCopyWith<$Res> {
  __$$_DangerModelCopyWithImpl(
      _$_DangerModel _value, $Res Function(_$_DangerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dangerId = null,
    Object? dangerName = null,
    Object? measureControlAPIs = null,
  }) {
    return _then(_$_DangerModel(
      dangerId: null == dangerId
          ? _value.dangerId
          : dangerId // ignore: cast_nullable_to_non_nullable
              as int,
      dangerName: null == dangerName
          ? _value.dangerName
          : dangerName // ignore: cast_nullable_to_non_nullable
              as String,
      measureControlAPIs: null == measureControlAPIs
          ? _value._measureControlAPIs
          : measureControlAPIs // ignore: cast_nullable_to_non_nullable
              as List<MeasureControlApi>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DangerModel implements _DangerModel {
  const _$_DangerModel(
      {required this.dangerId,
      required this.dangerName,
      required final List<MeasureControlApi> measureControlAPIs})
      : _measureControlAPIs = measureControlAPIs;

  factory _$_DangerModel.fromJson(Map<String, dynamic> json) =>
      _$$_DangerModelFromJson(json);

  @override
  final int dangerId;
  @override
  final String dangerName;
//required String dangerImage,
  final List<MeasureControlApi> _measureControlAPIs;
//required String dangerImage,
  @override
  List<MeasureControlApi> get measureControlAPIs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_measureControlAPIs);
  }

  @override
  String toString() {
    return 'DangerModel(dangerId: $dangerId, dangerName: $dangerName, measureControlAPIs: $measureControlAPIs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DangerModel &&
            (identical(other.dangerId, dangerId) ||
                other.dangerId == dangerId) &&
            (identical(other.dangerName, dangerName) ||
                other.dangerName == dangerName) &&
            const DeepCollectionEquality()
                .equals(other._measureControlAPIs, _measureControlAPIs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dangerId, dangerName,
      const DeepCollectionEquality().hash(_measureControlAPIs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DangerModelCopyWith<_$_DangerModel> get copyWith =>
      __$$_DangerModelCopyWithImpl<_$_DangerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DangerModelToJson(
      this,
    );
  }
}

abstract class _DangerModel implements DangerModel {
  const factory _DangerModel(
          {required final int dangerId,
          required final String dangerName,
          required final List<MeasureControlApi> measureControlAPIs}) =
      _$_DangerModel;

  factory _DangerModel.fromJson(Map<String, dynamic> json) =
      _$_DangerModel.fromJson;

  @override
  int get dangerId;
  @override
  String get dangerName;
  @override //required String dangerImage,
  List<MeasureControlApi> get measureControlAPIs;
  @override
  @JsonKey(ignore: true)
  _$$_DangerModelCopyWith<_$_DangerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

MeasureControlApi _$MeasureControlApiFromJson(Map<String, dynamic> json) {
  return _MeasureControlApi.fromJson(json);
}

/// @nodoc
mixin _$MeasureControlApi {
  int get measureControlId => throw _privateConstructorUsedError;
  String get measureControlName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeasureControlApiCopyWith<MeasureControlApi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasureControlApiCopyWith<$Res> {
  factory $MeasureControlApiCopyWith(
          MeasureControlApi value, $Res Function(MeasureControlApi) then) =
      _$MeasureControlApiCopyWithImpl<$Res, MeasureControlApi>;
  @useResult
  $Res call({int measureControlId, String measureControlName});
}

/// @nodoc
class _$MeasureControlApiCopyWithImpl<$Res, $Val extends MeasureControlApi>
    implements $MeasureControlApiCopyWith<$Res> {
  _$MeasureControlApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? measureControlId = null,
    Object? measureControlName = null,
  }) {
    return _then(_value.copyWith(
      measureControlId: null == measureControlId
          ? _value.measureControlId
          : measureControlId // ignore: cast_nullable_to_non_nullable
              as int,
      measureControlName: null == measureControlName
          ? _value.measureControlName
          : measureControlName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MeasureControlApiCopyWith<$Res>
    implements $MeasureControlApiCopyWith<$Res> {
  factory _$$_MeasureControlApiCopyWith(_$_MeasureControlApi value,
          $Res Function(_$_MeasureControlApi) then) =
      __$$_MeasureControlApiCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int measureControlId, String measureControlName});
}

/// @nodoc
class __$$_MeasureControlApiCopyWithImpl<$Res>
    extends _$MeasureControlApiCopyWithImpl<$Res, _$_MeasureControlApi>
    implements _$$_MeasureControlApiCopyWith<$Res> {
  __$$_MeasureControlApiCopyWithImpl(
      _$_MeasureControlApi _value, $Res Function(_$_MeasureControlApi) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? measureControlId = null,
    Object? measureControlName = null,
  }) {
    return _then(_$_MeasureControlApi(
      measureControlId: null == measureControlId
          ? _value.measureControlId
          : measureControlId // ignore: cast_nullable_to_non_nullable
              as int,
      measureControlName: null == measureControlName
          ? _value.measureControlName
          : measureControlName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MeasureControlApi implements _MeasureControlApi {
  const _$_MeasureControlApi(
      {required this.measureControlId, required this.measureControlName});

  factory _$_MeasureControlApi.fromJson(Map<String, dynamic> json) =>
      _$$_MeasureControlApiFromJson(json);

  @override
  final int measureControlId;
  @override
  final String measureControlName;

  @override
  String toString() {
    return 'MeasureControlApi(measureControlId: $measureControlId, measureControlName: $measureControlName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MeasureControlApi &&
            (identical(other.measureControlId, measureControlId) ||
                other.measureControlId == measureControlId) &&
            (identical(other.measureControlName, measureControlName) ||
                other.measureControlName == measureControlName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, measureControlId, measureControlName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MeasureControlApiCopyWith<_$_MeasureControlApi> get copyWith =>
      __$$_MeasureControlApiCopyWithImpl<_$_MeasureControlApi>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MeasureControlApiToJson(
      this,
    );
  }
}

abstract class _MeasureControlApi implements MeasureControlApi {
  const factory _MeasureControlApi(
      {required final int measureControlId,
      required final String measureControlName}) = _$_MeasureControlApi;

  factory _MeasureControlApi.fromJson(Map<String, dynamic> json) =
      _$_MeasureControlApi.fromJson;

  @override
  int get measureControlId;
  @override
  String get measureControlName;
  @override
  @JsonKey(ignore: true)
  _$$_MeasureControlApiCopyWith<_$_MeasureControlApi> get copyWith =>
      throw _privateConstructorUsedError;
}
