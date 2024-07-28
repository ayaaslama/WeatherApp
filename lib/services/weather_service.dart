import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String abiKey = 'e7aa642bf0e44feead7182038241407';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$abiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMsg = e.response?.data['error']['message'] ??
          'oops there an error, try later';
      throw Exception(errorMsg);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there an error, try later');
    }
  }
}
