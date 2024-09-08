import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modern_weather_app/data_layer/data.dart';
import 'package:modern_weather_app/logic/bloc/gpt_bloc.dart';
import 'package:modern_weather_app/presentation_layer/screens/weather_page.dart';


void main() {
  runApp(
    BlocProvider(
      create: (context) => GptBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modern Weather App',
      home: FutureBuilder<dynamic>(
      future: fetchWeather(),
      builder: (context, snapshot) {
        // Check the state of the Future
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.hasData) {
          // Show the data when it's available
          final weatherObject = snapshot.data;
          return WeatherHome(weather: weatherObject!);
        } else {
          return Text("No data available");
        }
      },
      )
    );
  }
}
