import 'dart:io';

import 'package:weather_app_zag_sys/helpers/api.dart';

import 'package:weather_app_zag_sys/models/weather_model.dart';

class WeatherService {
  WeatherService();

  final String baseURL = 'http://api.weatherapi.com/v1';
  final String apiKey = 'a9ae0cdd07634d3abf9213137243011';
  Future<WeatherModel> getWeatherCondition({required String cityName}) async {
    try {
      var data = await Api()
          .get(url: "$baseURL/forecast.json?key=$apiKey&q=$cityName&days=1");
      WeatherModel weatherModel = WeatherModel.fromJson(data);
      return weatherModel;
    }   catch (e) {
      throw Exception(e.toString());
    }
  }
}
