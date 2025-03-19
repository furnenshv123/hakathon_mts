import 'package:dio/dio.dart';
import 'package:hakathon_with_mts/core/feature/data/api/sensor_api.dart';
import 'package:hakathon_with_mts/core/feature/data/models/sensor_model.dart';
import 'package:hakathon_with_mts/core/utils/logger.dart';

class UseCaseSensor {
  late Dio dio;
  late ApiClientSensor apiClient;
  UseCaseSensor() {
    dio = Dio();
    apiClient = ApiClientSensor(dio);
  }
  Future<List<SensorModel>?> getAllsensors() async {
    try {
      final List<SensorModel> response = await apiClient.getAllSensors();
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
