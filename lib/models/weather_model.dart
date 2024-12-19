class WeatherModel {
  final String cityName;
  final DateTime lastUpdated;
  final String? image;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;
  final String weatherStatus;

  WeatherModel(
      {this.image,
      required this.lastUpdated,
      required this.cityName,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStatus});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cityName: json["location"]["name"],
        avgTemp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        weatherStatus: json["current"]["condition"]["text"],
        lastUpdated: DateTime.parse(json["current"]["last_updated"]),
        image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"]);
  }
}
