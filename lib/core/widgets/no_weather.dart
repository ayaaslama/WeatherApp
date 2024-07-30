import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/button.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/weather-app_3799996.png",
                width: 250,
                height: 250,
              ),
              const SizedBox(height: 30),
              const Text(
                "Weather Forecasts",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Button(
                color: Colors.amber,
                text: "Search Now",
                icon: Icons.search,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
