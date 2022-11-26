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

SurveyStepOneAnswersAPIModel _$SurveyStepOneAnswersAPIModelFromJson(
    Map<String, dynamic> json) {
  return _SurveyStepOneAnswersAPIModel.fromJson(json);
}

/// @nodoc
mixin _$SurveyStepOneAnswersAPIModel {
  List<QuestionAnswerModel> get questionAnswerModels =>
      throw _privateConstructorUsedError;
  List<DangerModel> get dangerAPIs => throw _privateConstructorUsedError;
  DateTime get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyStepOneAnswersAPIModelCopyWith<SurveyStepOneAnswersAPIModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyStepOneAnswersAPIModelCopyWith<$Res> {
  factory $SurveyStepOneAnswersAPIModelCopyWith(
          SurveyStepOneAnswersAPIModel value,
          $Res Function(SurveyStepOneAnswersAPIModel) then) =
      _$SurveyStepOneAnswersAPIModelCopyWithImpl<$Res,
          SurveyStepOneAnswersAPIModel>;
  @useResult
  $Res call(
      {List<QuestionAnswerModel> questionAnswerModels,
      List<DangerModel> dangerAPIs,
      DateTime createdDate});
}

/// @nodoc
class _$SurveyStepOneAnswersAPIModelCopyWithImpl<$Res,
        $Val extends SurveyStepOneAnswersAPIModel>
    implements $SurveyStepOneAnswersAPIModelCopyWith<$Res> {
  _$SurveyStepOneAnswersAPIModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_SurveyStepOneAnswersAPIModelCopyWith<$Res>
    implements $SurveyStepOneAnswersAPIModelCopyWith<$Res> {
  factory _$$_SurveyStepOneAnswersAPIModelCopyWith(
          _$_SurveyStepOneAnswersAPIModel value,
          $Res Function(_$_SurveyStepOneAnswersAPIModel) then) =
      __$$_SurveyStepOneAnswersAPIModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<QuestionAnswerModel> questionAnswerModels,
      List<DangerModel> dangerAPIs,
      DateTime createdDate});
}

/// @nodoc
class __$$_SurveyStepOneAnswersAPIModelCopyWithImpl<$Res>
    extends _$SurveyStepOneAnswersAPIModelCopyWithImpl<$Res,
        _$_SurveyStepOneAnswersAPIModel>
    implements _$$_SurveyStepOneAnswersAPIModelCopyWith<$Res> {
  __$$_SurveyStepOneAnswersAPIModelCopyWithImpl(
      _$_SurveyStepOneAnswersAPIModel _value,
      $Res Function(_$_SurveyStepOneAnswersAPIModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionAnswerModels = null,
    Object? dangerAPIs = null,
    Object? createdDate = null,
  }) {
    return _then(_$_SurveyStepOneAnswersAPIModel(
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
class _$_SurveyStepOneAnswersAPIModel implements _SurveyStepOneAnswersAPIModel {
  const _$_SurveyStepOneAnswersAPIModel(
      {required final List<QuestionAnswerModel> questionAnswerModels,
      required final List<DangerModel> dangerAPIs,
      required this.createdDate})
      : _questionAnswerModels = questionAnswerModels,
        _dangerAPIs = dangerAPIs;

  factory _$_SurveyStepOneAnswersAPIModel.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyStepOneAnswersAPIModelFromJson(json);

  final List<QuestionAnswerModel> _questionAnswerModels;
  @override
  List<QuestionAnswerModel> get questionAnswerModels {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionAnswerModels);
  }

  final List<DangerModel> _dangerAPIs;
  @override
  List<DangerModel> get dangerAPIs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dangerAPIs);
  }

  @override
  final DateTime createdDate;

  @override
  String toString() {
    return 'SurveyStepOneAnswersAPIModel(questionAnswerModels: $questionAnswerModels, dangerAPIs: $dangerAPIs, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurveyStepOneAnswersAPIModel &&
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
  _$$_SurveyStepOneAnswersAPIModelCopyWith<_$_SurveyStepOneAnswersAPIModel>
      get copyWith => __$$_SurveyStepOneAnswersAPIModelCopyWithImpl<
          _$_SurveyStepOneAnswersAPIModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyStepOneAnswersAPIModelToJson(
      this,
    );
  }
}

abstract class _SurveyStepOneAnswersAPIModel
    implements SurveyStepOneAnswersAPIModel {
  const factory _SurveyStepOneAnswersAPIModel(
      {required final List<QuestionAnswerModel> questionAnswerModels,
      required final List<DangerModel> dangerAPIs,
      required final DateTime createdDate}) = _$_SurveyStepOneAnswersAPIModel;

  factory _SurveyStepOneAnswersAPIModel.fromJson(Map<String, dynamic> json) =
      _$_SurveyStepOneAnswersAPIModel.fromJson;

  @override
  List<QuestionAnswerModel> get questionAnswerModels;
  @override
  List<DangerModel> get dangerAPIs;
  @override
  DateTime get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyStepOneAnswersAPIModelCopyWith<_$_SurveyStepOneAnswersAPIModel>
      get copyWith => throw _privateConstructorUsedError;
}
