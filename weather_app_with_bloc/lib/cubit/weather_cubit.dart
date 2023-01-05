// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_with_bloc/model/weather_response.dart';
import 'package:weather_app_with_bloc/services/fetch_weather.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.service) : super(WeatherInitial());

//WeatherService ti serviceke orop koydum
  final WeatherService service;
  // servictegi datany ushul future funksiaga tartyp keldim
  Future<void> getWeatherByCityName(String cityName) async {
    // Sen kutkongo chein WeatherLoading ge kotorup koy
    emit(WeatherLoading());
    final data = await service.getWeatherCityName(cityName);
    if (data != null) {
      emit(WeatherSuccess(data));
    } else {
      emit(const WeatherError('Kata bar'));
    }
  }
}
