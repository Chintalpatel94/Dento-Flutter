// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      responseStructure: json['dento'] == null
          ? null
          : ResponseStructure.fromJson(json['dento'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'dento': instance.responseStructure,
    };

ResponseStructure _$ResponseStructureFromJson(Map<String, dynamic> json) =>
    ResponseStructure(
      status: json['status'] as int?,
      message: json['message'] as String?,
      token: json['token'] as String?,
      timestamp: json['timestamp'] as int?,
      userResponse: json['data'] == null
          ? null
          : UserResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseStructureToJson(ResponseStructure instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'timestamp': instance.timestamp,
      'data': instance.userResponse,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: json['id'] as int?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
    };
