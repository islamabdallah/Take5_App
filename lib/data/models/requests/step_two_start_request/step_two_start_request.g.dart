// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_two_start_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Take5StepTwoRequestAPIModel _$$_Take5StepTwoRequestAPIModelFromJson(
        Map json) =>
    _$_Take5StepTwoRequestAPIModel(
      requestDate: json['requestDate'] == null
          ? null
          : DateTime.parse(json['requestDate'] as String),
      responseDate: json['responseDate'] == null
          ? null
          : DateTime.parse(json['responseDate'] as String),
    );

Map<String, dynamic> _$$_Take5StepTwoRequestAPIModelToJson(
    _$_Take5StepTwoRequestAPIModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('requestDate', instance.requestDate?.toIso8601String());
  writeNotNull('responseDate', instance.responseDate?.toIso8601String());
  return val;
}
