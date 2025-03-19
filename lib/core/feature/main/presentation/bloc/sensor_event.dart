part of 'sensor_bloc.dart';

@immutable
sealed class SensorEvent {}


class SensorGetSensors extends SensorEvent{}