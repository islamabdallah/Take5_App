// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  List<QuestionAnswerModel> get questionAnswerModels =>
      throw _privateConstructorUsedError;
  List<DangerModel> get dangerAPIs => throw _privateConstructorUsedError;
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
      {List<QuestionAnswerModel> questionAnswerModels,
      List<DangerModel> dangerAPIs,
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
    Object? questionAnswerModels = null,
    Object? dangerAPIs = null,
    Object? createdDate = null,
  }) {
    return _then(_value.copyWith(
      questionAnswerModels: null == questionAnswerModels
          ? _value.questionAnswerModels
          : questionAnswerModels // ignore: cast_nullable_to_non_nullable
              as List<QuestionAnswerModel>,
      dangerAPIs: null == dangerAPIs
          ? _value.dangerAPIs
          : dangerAPIs // ignore: cast_nullable_to_non_nullable
              as List<DangerModel>,
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
      {List<QuestionAnswerModel> questionAnswerModels,
      List<DangerModel> dangerAPIs,
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
    Object? questionAnswerModels = null,
    Object? dangerAPIs = null,
    Object? createdDate = null,
  }) {
    return _then(_$_SurveyStepTwoAnswersAPIModel(
      questionAnswerModels: null == questionAnswerModels
          ? _value._questionAnswerModels
          : questionAnswerModels // ignore: cast_nullable_to_non_nullable
              as List<QuestionAnswerModel>,
      dangerAPIs: null == dangerAPIs
          ? _value._dangerAPIs
          : dangerAPIs // ignore: cast_nullable_to_non_nullable
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
class _$_SurveyStepTwoAnswersAPIModel implements _SurveyStepTwoAnswersAPIModel {
  const _$_SurveyStepTwoAnswersAPIModel(
      {required final List<QuestionAnswerModel> questionAnswerModels,
      final List<DangerModel> dangerAPIs = const [],
      required this.createdDate})
      : _questionAnswerModels = questionAnswerModels,
        _dangerAPIs = dangerAPIs;

  factory _$_SurveyStepTwoAnswersAPIModel.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyStepTwoAnswersAPIModelFromJson(json);

  final List<QuestionAnswerModel> _questionAnswerModels;
  @override
  List<QuestionAnswerModel> get questionAnswerModels {
    if (_questionAnswerModels is EqualUnmodifiableListView)
      return _questionAnswerModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionAnswerModels);
  }

  final List<DangerModel> _dangerAPIs;
  @override
  @JsonKey()
  List<DangerModel> get dangerAPIs {
    if (_dangerAPIs is EqualUnmodifiableListView) return _dangerAPIs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dangerAPIs);
  }

  @override
  final DateTime createdDate;

  @override
  String toString() {
    return 'SurveyStepTwoAnswersAPIModel(questionAnswerModels: $questionAnswerModels, dangerAPIs: $dangerAPIs, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurveyStepTwoAnswersAPIModel &&
            const DeepCollectionEquality()
                .equals(other._questionAnswerModels, _questionAnswerModels) &&
            const DeepCollectionEquality()
                .equals(other._dangerAPIs, _dangerAPIs) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_questionAnswerModels),
      const DeepCollectionEquality().hash(_dangerAPIs),
      createdDate);

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
      {required final List<QuestionAnswerModel> questionAnswerModels,
      final List<DangerModel> dangerAPIs,
      required final DateTime createdDate}) = _$_SurveyStepTwoAnswersAPIModel;

  factory _SurveyStepTwoAnswersAPIModel.fromJson(Map<String, dynamic> json) =
      _$_SurveyStepTwoAnswersAPIModel.fromJson;

  @override
  List<QuestionAnswerModel> get questionAnswerModels;
  @override
  List<DangerModel> get dangerAPIs;
  @override
  DateTime get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyStepTwoAnswersAPIModelCopyWith<_$_SurveyStepTwoAnswersAPIModel>
      get copyWith => throw _privateConstructorUsedError;
}
