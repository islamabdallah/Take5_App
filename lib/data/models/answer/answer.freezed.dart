// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionAnswerModel _$QuestionAnswerModelFromJson(Map<String, dynamic> json) {
  return _QuestionAnswerModel.fromJson(json);
}

/// @nodoc
mixin _$QuestionAnswerModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get question => throw _privateConstructorUsedError;
  @HiveField(2)
  bool? get answer => throw _privateConstructorUsedError;
  @HiveField(2)
  set answer(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionAnswerModelCopyWith<QuestionAnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionAnswerModelCopyWith<$Res> {
  factory $QuestionAnswerModelCopyWith(
          QuestionAnswerModel value, $Res Function(QuestionAnswerModel) then) =
      _$QuestionAnswerModelCopyWithImpl<$Res, QuestionAnswerModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String question,
      @HiveField(2) bool? answer});
}

/// @nodoc
class _$QuestionAnswerModelCopyWithImpl<$Res, $Val extends QuestionAnswerModel>
    implements $QuestionAnswerModelCopyWith<$Res> {
  _$QuestionAnswerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionAnswerModelCopyWith<$Res>
    implements $QuestionAnswerModelCopyWith<$Res> {
  factory _$$_QuestionAnswerModelCopyWith(_$_QuestionAnswerModel value,
          $Res Function(_$_QuestionAnswerModel) then) =
      __$$_QuestionAnswerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String question,
      @HiveField(2) bool? answer});
}

/// @nodoc
class __$$_QuestionAnswerModelCopyWithImpl<$Res>
    extends _$QuestionAnswerModelCopyWithImpl<$Res, _$_QuestionAnswerModel>
    implements _$$_QuestionAnswerModelCopyWith<$Res> {
  __$$_QuestionAnswerModelCopyWithImpl(_$_QuestionAnswerModel _value,
      $Res Function(_$_QuestionAnswerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answer = freezed,
  }) {
    return _then(_$_QuestionAnswerModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionAnswerModel implements _QuestionAnswerModel {
  _$_QuestionAnswerModel(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.question,
      @HiveField(2) this.answer});

  factory _$_QuestionAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionAnswerModelFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String question;
  @override
  @HiveField(2)
  bool? answer;

  @override
  String toString() {
    return 'QuestionAnswerModel(id: $id, question: $question, answer: $answer)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionAnswerModelCopyWith<_$_QuestionAnswerModel> get copyWith =>
      __$$_QuestionAnswerModelCopyWithImpl<_$_QuestionAnswerModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionAnswerModelToJson(
      this,
    );
  }
}

abstract class _QuestionAnswerModel implements QuestionAnswerModel {
  factory _QuestionAnswerModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String question,
      @HiveField(2) bool? answer}) = _$_QuestionAnswerModel;

  factory _QuestionAnswerModel.fromJson(Map<String, dynamic> json) =
      _$_QuestionAnswerModel.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get question;
  @override
  @HiveField(2)
  bool? get answer;
  @HiveField(2)
  set answer(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$_QuestionAnswerModelCopyWith<_$_QuestionAnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
