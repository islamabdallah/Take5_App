// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionAnswerModelAdapter extends TypeAdapter<QuestionAnswerModel> {
  @override
  final int typeId = 1;

  @override
  QuestionAnswerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionAnswerModel(
      id: fields[0] as int,
      question: fields[1] as String,
      step: fields[2] as int,
      answer: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, QuestionAnswerModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.step)
      ..writeByte(3)
      ..write(obj.answer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionAnswerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionAnswerModel _$$_QuestionAnswerModelFromJson(Map json) =>
    _$_QuestionAnswerModel(
      id: json['id'] as int,
      question: json['question'] as String,
      step: json['step'] as int,
      answer: json['answer'] as bool?,
    );

Map<String, dynamic> _$$_QuestionAnswerModelToJson(
        _$_QuestionAnswerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'step': instance.step,
      'answer': instance.answer,
    };
