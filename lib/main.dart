import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/helper/constant.dart';
import 'package:weather_app/features/logic/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/features/logic/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/features/pages/home_page.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition),
                  appBarTheme: AppBarTheme(
                    backgroundColor: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition,
                    ),
                  )),
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
            );
          },
        );
      }),
    );
  }
}
