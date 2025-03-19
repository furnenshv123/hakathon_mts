import 'package:dio/dio.dart';
import 'package:hakathon_with_mts/core/feature/auth/data/api/auth_client.dart';
import 'package:hakathon_with_mts/core/feature/auth/data/models/auth_model.dart';
import 'package:hakathon_with_mts/core/feature/auth/data/models/token_model.dart';
import 'package:hakathon_with_mts/core/utils/logger.dart';

class UseCaseAuth {
  late Dio dio;
  late ApiClientAuth apiClient;
  UseCaseAuth() {
    dio = Dio();
    apiClient = ApiClientAuth(dio);
  }
  Future<TokenModel?> login({required AuthModel model}) async {
    try {
      final TokenModel response = await apiClient.login(model: model);

      return response;
    } on DioException catch (e) {
      logger.e(
        'DioException: ${e.response?.data} ${e.response?.statusCode} ${e.message}',
      );
    } catch (e) {
      logger.e('Error: $e');
    }
    return null;
  }

  Future<TokenModel?> register({required AuthModel model}) async {
    try {
      final TokenModel response = await apiClient.register(model: model);
      return response;
    } on DioException catch (e) {
      logger.e(
        'DioException: ${e.response?.data} ${e.response?.statusCode} ${e.message}',
      );
    } catch (e) {
      logger.e('Error: $e');
    }
    return null;
  }
}
