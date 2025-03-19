import 'package:dio/dio.dart';
import 'package:hakathon_with_mts/core/feature/auth/data/models/token_model.dart';
import 'package:hakathon_with_mts/core/feature/auth/data/models/auth_model.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_client.g.dart';

@RestApi(baseUrl: "http://localhost:8080")
abstract class ApiClientAuth {
  factory ApiClientAuth(Dio dio, {String? baseUrl}) = _ApiClientAuth;

  @POST('/auth/login')
  Future<TokenModel> login({@Body() required AuthModel model});
  @POST('/auth/signup')
  Future<TokenModel> register({@Body() required AuthModel model});
}
