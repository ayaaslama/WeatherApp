import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/widgets/error_search.dart';
import 'package:weather_app/core/widgets/no_weather.dart';
import 'package:weather_app/core/widgets/weather_info_body.dart';
import 'package:weather_app/features/logic/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/features/logic/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/features/pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Weather',
        )),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
            },
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          } else {
            return const ErrorSearch();
          }
        },
      ),
    );
  }
}
