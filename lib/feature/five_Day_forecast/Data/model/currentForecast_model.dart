import 'package:weather/feature/five_Day_forecast/Domain/entities/current_forecast.dart';

class CurrentForecastModel extends CurrentForecastEntity {
  CurrentForecastModel({
    String? cityName,
    double? temperature,
    String? weatherCondition,
    String? weatherDesc,
    double? minTemp,
    double? maxTemp,
    double? feelsLikeTemp,
    double? windSpeed,
    int? cloudsPerc,
    int? humidity,
  }) : super(
            cityName: cityName,
            temperature: temperature,
            weatherCondition: weatherCondition,
            weatherDesc: weatherDesc,
            minTemp: minTemp,
            maxTemp: maxTemp,
            feelsLikeTemp: feelsLikeTemp,
            windSpeed: windSpeed,
            cloudsPerc: cloudsPerc,
            humidity: humidity);

  factory CurrentForecastModel.fromJson(Map<String, dynamic> json) {
    return CurrentForecastModel(
        cityName: json['name'],
        temperature: json['main']['temp'].toDouble(),
        weatherCondition: json['weather'][0]['main'],
        weatherDesc: json['weather'][0]['description'],
        minTemp: json['main']['temp_min'],
        maxTemp: json['main']['temp_max'],
        feelsLikeTemp: json['main']['feels_like'],
        windSpeed: json['wind']['speed'].toDouble(),
        cloudsPerc: json['clouds']['all'],
        humidity: json['main']['humidity']);
  }
}
