import 'package:bloc/bloc.dart';
import 'package:hakathon_with_mts/core/feature/data/models/sensor_model.dart';
import 'package:hakathon_with_mts/core/feature/domain/sensor_usecase.dart';
import 'package:meta/meta.dart';

part 'sensor_event.dart';
part 'sensor_state.dart';

class SensorBloc extends Bloc<SensorEvent, SensorState> {
  SensorBloc() : super(SensorInitial()) {
    on<SensorEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SensorGetSensors>((event, emit) async {
      emit(SensorLoading());

      final List<SensorModel>? response = await UseCaseSensor().getAllsensors();
      if (response == null) {
        emit(SensorError(message: 'Ошибка'));
      } else {
        emit(SensorLoaded(sensors: response));
      }
    });
  }
}
