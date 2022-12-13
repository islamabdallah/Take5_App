// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_trip_steps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllTripStepsModel _$$_AllTripStepsModelFromJson(Map json) =>
    _$_AllTripStepsModel(
      userId: json['userId'] as String?,
      tripId: json['tripId'] as int?,
      jobsiteId: json['jobsiteId'] as int?,
      truckNumber: json['truckNumber'] as String?,
      tripDestinationArrivedModel: json['tripDestinationArrivedModel'] == null
          ? null
          : TripDestinationArrivedModel.fromJson(Map<String, dynamic>.from(
              json['tripDestinationArrivedModel'] as Map)),
      surveyStepOneAnswersAPIModel: json['surveyStepOneAnswersAPIModel'] == null
          ? null
          : SurveyStepOneAnswersAPIModel.fromJson(Map<String, dynamic>.from(
              json['surveyStepOneAnswersAPIModel'] as Map)),
      take5StepTwoRequestAPIModel: json['take5StepTwoRequestAPIModel'] == null
          ? null
          : Take5StepTwoRequestAPIModel.fromJson(Map<String, dynamic>.from(
              json['take5StepTwoRequestAPIModel'] as Map)),
      surveyStepTwoAnswersAPIModel: json['surveyStepTwoAnswersAPIModel'] == null
          ? null
          : SurveyStepTwoAnswersAPIModel.fromJson(Map<String, dynamic>.from(
              json['surveyStepTwoAnswersAPIModel'] as Map)),
      take5TogetherAPIModels: (json['take5TogetherAPIModels'] as List<dynamic>?)
          ?.map((e) =>
              Take5TogetherModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      endStatus: json['endStatus'] as String?,
    );

Map<String, dynamic> _$$_AllTripStepsModelToJson(
        _$_AllTripStepsModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'tripId': instance.tripId,
      'jobsiteId': instance.jobsiteId,
      'truckNumber': instance.truckNumber,
      'tripDestinationArrivedModel':
          instance.tripDestinationArrivedModel?.toJson(),
      'surveyStepOneAnswersAPIModel':
          instance.surveyStepOneAnswersAPIModel?.toJson(),
      'take5StepTwoRequestAPIModel':
          instance.take5StepTwoRequestAPIModel?.toJson(),
      'surveyStepTwoAnswersAPIModel':
          instance.surveyStepTwoAnswersAPIModel?.toJson(),
      'take5TogetherAPIModels':
          instance.take5TogetherAPIModels?.map((e) => e.toJson()).toList(),
      'endStatus': instance.endStatus,
    };
