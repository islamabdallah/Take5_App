// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserLoginResponse _$$_UserLoginResponseFromJson(Map json) =>
    _$_UserLoginResponse(
      message: json['message'] as String,
      data: Data.fromJson(Map<String, dynamic>.from(json['data'] as Map)),
    );

Map<String, dynamic> _$$_UserLoginResponseToJson(
        _$_UserLoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.toJson(),
    };

_$_Data _$$_DataFromJson(Map json) => _$_Data(
      userAPIModel:
          User.fromJson(Map<String, dynamic>.from(json['userAPIModel'] as Map)),
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'userAPIModel': instance.userAPIModel.toJson(),
    };
