class WeatherModel {
  final String city;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  final double hour9;
  final double hour14;
  final double hour19;
  final double hour1;
  final double hour4;

  WeatherModel({
    required this.city,
    required this.date,
    this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
    required this.hour9,
    required this.hour14,
    required this.hour19,
    required this.hour1,
    required this.hour4,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      city: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      hour9: json['forecast']['forecastday'][0]['hour'][9]['temp_c'],
      hour14: json['forecast']['forecastday'][0]['hour'][14]['temp_c'],
      hour19: json['forecast']['forecastday'][0]['hour'][19]['temp_c'],
      hour1: json['forecast']['forecastday'][0]['hour'][1]['temp_c'],
      hour4: json['forecast']['forecastday'][0]['hour'][4]['temp_c'],
    );
  }
}
