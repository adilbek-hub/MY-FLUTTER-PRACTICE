import 'dart:convert';
import 'package:weather_app_with_bloc/model/main_model.dart';
import 'package:weather_app_with_bloc/model/weather_model.dart';

class WeatherResponse {
  WeatherResponse(
      {required this.weather, required this.main, required this.name});
  final List<Weather> weather;
  final Main main;
  final String name;

  factory WeatherResponse.fromMap(Map<String, dynamic> map) {
    return WeatherResponse(
        weather: List<Weather>.from(
          (map['weather'] as List).map<Weather>(
            (e) => Weather.fromJson(e as Map<String, dynamic>),
          ),
        ),
        main: Main.fromJson(map['main'] as Map<String, dynamic>),
        name: map['name'] as String);
  }

  factory WeatherResponse.fromJson(String source) =>
      WeatherResponse.fromMap((json.decode)(source) as Map<String, dynamic>);
}
