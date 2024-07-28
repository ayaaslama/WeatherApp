import 'package:flutter/material.dart';
import 'package:weather_app/widgets/button.dart';

class ErrorSearch extends StatelessWidget {
  const ErrorSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/cloud-error.png",
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Text(
                "Please enter a valid city",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[800],
                ),
              ),
              const SizedBox(height: 30),
              Button(
                color: Colors.red[700],
                text: "Search Again",
                icon: Icons.refresh,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
