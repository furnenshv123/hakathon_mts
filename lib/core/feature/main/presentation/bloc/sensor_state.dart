part of 'sensor_bloc.dart';

@immutable
sealed class SensorState {}

final class SensorInitial extends SensorState {}

class SensorLoading extends SensorState{}

class SensorLoaded extends SensorState{
  final List<SensorModel> sensors;

  SensorLoaded({required this.sensors});
}

class SensorError extends SensorState{
  final String message;

  SensorError({required this.message});
}