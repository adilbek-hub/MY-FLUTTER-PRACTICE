import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_bloc/components/loading_widget.dart';
import 'package:weather_app_with_bloc/components/weather_success_widget.dart';
import 'package:weather_app_with_bloc/cubit/weather_cubit.dart';
import 'package:weather_app_with_bloc/services/fetch_weather.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            WeatherCubit(weatherService)..getWeatherByCityName('Bishkek'),
        child: Scaffold(
          // appBar: AppBar(
          //   centerTitle: true,
          //   title: const Text('HomePage'),
          // ),
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/ScreenImage.png'),
                    fit: BoxFit.cover)),
            child: BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state is WeatherInitial) {
                  return const Text('WeatherInitial');
                } else if (state is WeatherLoading) {
                  return const LoadingWidget();
                } else if (state is WeatherSuccess) {
                  return WeatherSuccessWidget(state.weatherResponse);
                } else if (state is WeatherError) {
                  return ErrorWidget(state.errorText);
                } else {
                  return const Text('Bilbeym men');
                }
              },
            ),
          ),
        ));
  }
}
