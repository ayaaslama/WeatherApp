import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/helper/constant.dart';
import 'package:weather_app/core/widgets/weather_list.dart';
import 'package:weather_app/features/logic/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/features/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          getThemeColor(
            BlocProvider.of<GetWeatherCubit>(context)
                .weatherModel
                ?.weatherCondition,
          ),
          getThemeColor(
            BlocProvider.of<GetWeatherCubit>(context)
                .weatherModel
                ?.weatherCondition,
          )[100]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(
            weatherModel.city,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Update at ${weatherModel.date.hour}:${weatherModel.date.minute}',
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(weatherModel.image!),
              Text(
                '${weatherModel.temp.toString()} °C',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text(
                    'MaxTemp: ${weatherModel.maxTemp.round()} °C',
                  ),
                  Text(
                    'MinTemp: ${weatherModel.minTemp.round()} °C',
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            weatherModel.weatherCondition,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          WeatherList(
            weather: weatherModel,
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
