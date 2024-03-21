import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_%20weather_cubit/get_weather_cubit.dart';

class SaerchView extends StatelessWidget {
  const SaerchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(122, 162, 230, 251),
        title: const Text(
          'Search City',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            onSubmitted: (value) async {
              var getweather = BlocProvider.of<GetWeatherCubit>(context);
              getweather.getWeather(city: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 26, horizontal: 8),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              label: Text(
                'Search',
                style: TextStyle(),
              ),
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter city name',
              hintStyle: TextStyle(
                color: Color.fromARGB(157, 158, 158, 158),
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
