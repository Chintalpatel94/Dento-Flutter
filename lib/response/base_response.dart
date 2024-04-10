import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "dento")
  ResponseStructure? responseStructure;

  BaseResponse({
    this.responseStructure,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

@JsonSerializable()
class ResponseStructure {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "timestamp")
  int? timestamp;
  @JsonKey(name: "data")
  UserResponse? userResponse;

  ResponseStructure({
    this.status,
    this.message,
    this.token,
    this.timestamp,
    this.userResponse,
  });

  factory ResponseStructure.fromJson(Map<String, dynamic> json) =>
      _$ResponseStructureFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseStructureToJson(this);
}

// @JsonSerializable()
// class LoginResponse extends ResponseStructure {
//   @JsonKey(name: "data")
//   UserResponse? userResponse;
//
//   LoginResponse({this.userResponse});
//
//   factory LoginResponse.fromJson(Map<String, dynamic> json) =>
//       _$LoginResponseFromJson(json);
//
//   Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
// }

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "email")
  String? email;

  UserResponse({
    this.id,
    this.email,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

}