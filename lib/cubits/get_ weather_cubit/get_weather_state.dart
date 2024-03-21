part of 'get_weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoaded({required this.weatherModel});
}

class WeatherFalied extends WeatherState {
  final String errorMessage;

  WeatherFalied({required this.errorMessage});
}
