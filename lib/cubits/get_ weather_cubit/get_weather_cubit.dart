import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitial());
   WeatherModel? weatherModel;
  getWeather({required String city}) async {
    try {
      weatherModel = await WeatherService(Dio()).getCurrentWeather(city: city);
      emit(
        WeatherLoaded(weatherModel: weatherModel!),
      );
    } catch (e) {
      emit(
        WeatherFalied(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
