import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '4890b12c717841c8b44183309242003';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$city');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      print('The response is : $response');
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error , try later';
      print('This is error : $errorMessage');
      throw Exception(errorMessage);
    } catch (e) {
      log('This is error : ${e.toString()}');
      throw Exception('oops there was an error , try later');
    }
  }
}
