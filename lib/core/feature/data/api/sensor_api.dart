import 'package:dio/dio.dart';
import 'package:hakathon_with_mts/core/feature/data/models/sensor_model.dart';
import 'package:retrofit/retrofit.dart';
part 'sensor_api.g.dart';

@RestApi(baseUrl: "http://localhost:8081")
abstract class ApiClientSensor {
  factory ApiClientSensor(Dio dio, {String? baseUrl}) = _ApiClientSensor;

  @GET('/sensors/')
  Future<List<SensorModel>> getAllSensors ();
}
