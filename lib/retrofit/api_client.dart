import 'package:dent_o_doctor/utils/appString.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../response/base_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST('auth/doctor/login') //login
  Future<BaseResponse> getLogin(
      @Field("email") String email,
      @Field("password") String password);
}
