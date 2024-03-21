import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_%20weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(122, 162, 230, 251),
        // actions: [], //actions can have many widgets in end of app bar
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Weather App'),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const SaerchView();
                  },
                ));
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return const NoWeatherBody();
          } else if (state is WeatherLoaded) {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          } else {
            return const Text('Opps there was an error , try agian ');
          }
        },
      ),
    );
  }
}
