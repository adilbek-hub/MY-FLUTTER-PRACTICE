import 'package:flutter/material.dart';
import 'package:weather_app_with_bloc/constants/api_const.dart';
import 'package:weather_app_with_bloc/model/weather_response.dart';
import 'package:weather_app_with_bloc/theme/app_colors.dart';
import 'package:weather_app_with_bloc/theme/text_style.dart';

class WeatherSuccessWidget extends StatelessWidget {
  const WeatherSuccessWidget(
    this.weatherResponse, {
    Key? key,
  }) : super(key: key);
  final WeatherResponse weatherResponse;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(weatherResponse.name, style: AppTextStyle.cityNameTextStyle),
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(right: 10)),
              Text(
                "${weatherResponse.main.temp}",
                style: AppTextStyle.tempTextStyle,
              ),
              Image.network(ApiConst.getIcon('11n', 2)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You'll need and".replaceAll(' ', '\n'),
                  style: AppTextStyle.textCloudsTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(right: 5, left: 5)),
              Column(
                children: [
                  const Icon(
                    Icons.cloud_circle,
                    size: 40,
                    color: AppColors.cloudColor,
                  ),
                  Text(
                    weatherResponse.weather[0].description,
                    style: AppTextStyle.fewCloudsTextStyle,
                  ),
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.favorite_outline,
                    size: 40,
                    color: AppColors.cloudColor,
                  ),
                  Text("${weatherResponse.main.feelsLike},")
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.cloudy_snowing,
                    size: 40,
                    color: AppColors.cloudColor,
                  ),
                  Text(
                    weatherResponse.weather[0].main,
                    style: AppTextStyle.cityCloudsTextStyle,
                  ),
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.add_box,
                    size: 40,
                    color: AppColors.cloudColor,
                  ),
                  Text("${weatherResponse.main.tempMax}"),
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.add_business,
                    size: 40,
                    color: AppColors.cloudColor,
                  ),
                  Text("${weatherResponse.main.tempMin}"),
                ],
              )
            ],
          ),
          // Text(weatherResponse.weather[0].icon),
        ],
      ),
    );
  }
}
