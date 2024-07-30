import 'package:flutter/material.dart';

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.amber;
  } else if (condition == 'Sunny') {
    return Colors.deepOrange;
  } else if (condition == 'clear') {
    return Colors.orange;
  } else if (condition == 'light rain') {
    return Colors.lightBlue;
  } else if (condition == 'fog' || condition == 'freezing fog') {
    return Colors.grey;
  } else if (condition == 'patchy light rain with thunder') {
    return Colors.deepPurple;
  } else if (condition == 'Heavy Snow' || condition == 'Moderate rain') {
    return Colors.blue;
  } else {
    return Colors.blueGrey;
  }
}
