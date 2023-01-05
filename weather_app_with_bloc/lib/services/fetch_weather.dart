import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_app_with_bloc/constants/api_const.dart';
import 'package:weather_app_with_bloc/model/weather_response.dart';

class WeatherService {
  final client = http.Client();

  ///[cityName] alyp oshol shaardyn aba yrayin beret
  Future<WeatherResponse?> getWeatherCityName(String cityName) async {
    //Bul funksia emne kylat??????
    //1. Koldonuuchudan shaardyn atyn alat
    //2. Uri tuzuu
    final uri = Uri.parse(ApiConst.weatherByCityName(cityName));
    //3. Uri request jiberet
    try {
      final response = await client.get(uri);
      //4. status kod 200 je 201 bolso model kaytarat
      if (response.statusCode == 200) {
        final weather = WeatherResponse.fromJson(response.body);
        return weather;
      } else {
        log('response = statusCode ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('getWeatherCityName metodunda kata bar $e');
      return null;
    }

    //5. bir kata bolso null kaytarat
  }
}

final weatherService = WeatherService();
