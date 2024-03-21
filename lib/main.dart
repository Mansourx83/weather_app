import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_%20weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.amber;
    case 'Partly cloudy':
      return Colors.blueGrey;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
      return Colors.blueGrey;
    case 'Patchy rain possible':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Patchy light drizzle':
    case 'Patchy light rain':
    case 'Patchy light snow':
    case 'Patchy moderate snow':
    case 'Patchy heavy snow':
    case 'Patchy light rain with thunder':
    case 'Patchy light snow with thunder':
      return Colors.lightBlue;
    case 'Blowing snow':
    case 'Blizzard':
    case 'Thundery outbreaks possible':
    case 'Fog':
    case 'Freezing fog':
    case 'Light drizzle':
    case 'Light freezing drizzle':
    case 'Light rain':
    case 'Light rain shower':
    case 'Light sleet':
    case 'Light sleet showers':
    case 'Light snow':
    case 'Light snow showers':
    case 'Light showers of ice pellets':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Moderate snow':
    case 'Moderate sleet':
    case 'Moderate or heavy freezing rain':
    case 'Moderate or heavy sleet':
    case 'Moderate or heavy rain shower':
    case 'Moderate or heavy snow showers':
    case 'Moderate or heavy showers of ice pellets':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Heavy snow':
    case 'Heavy sleet':
    case 'Torrential rain shower':
    case 'Moderate or heavy rain with thunder':
    case 'Moderate or heavy snow with thunder':
    case 'Ice pellets':
      return Colors.blueGrey;
    default:
      return Colors.cyan;
  }
}
