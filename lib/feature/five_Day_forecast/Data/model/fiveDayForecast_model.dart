import 'package:weather/feature/five_Day_forecast/Domain/entities/five_day_forecast.dart';

class FiveDaysForecastModel extends FiveDayForecastEntity {
  FiveDaysForecastModel(
      {String? cityName,
      double? temperature,
      String? weatherCondition,
      String? weatherDesc,
      double? minTemp,
      double? maxTemp,
      double? feelsLikeTemp,
      double? windSpeed,
      int? cloudsPerc,
      int? humidity,
      String? weatherDate,
      String? weathericon,
      double? probabilityOfPrecipitation})
      : super(
            cityName: cityName,
            temperature: temperature,
            weatherCondition: weatherCondition,
            weatherDesc: weatherDesc,
            minTemp: minTemp,
            maxTemp: maxTemp,
            feelsLikeTemp: feelsLikeTemp,
            windSpeed: windSpeed,
            cloudsPerc: cloudsPerc,
            humidity: humidity,
            weatherDate: weatherDate,
            weathericon: weathericon,
            probabilityOfPrecipitation: probabilityOfPrecipitation);

  factory FiveDaysForecastModel.fromJson(Map<String, dynamic> json, i) {
    return FiveDaysForecastModel(
        cityName: json['city']['name'],
        temperature: json['list'][i]['main']['temp'].toDouble(),
        weatherCondition: json['list'][i]['weather'][0]['main'],
        weatherDesc: json['list'][i]['weather'][0]['description"'],
        minTemp: json['list'][i]['main']['temp_min'].toDouble(),
        maxTemp: json['list'][i]['main']['temp_max'].toDouble(),
        feelsLikeTemp: json['list'][i]['main']['feels_like'].toDouble(),
        windSpeed: json['list'][i]['wind']['speed'].toDouble(),
        cloudsPerc: json['list'][i]['clouds']['all'],
        humidity: json['list'][i]['main']['humidity'],
        weatherDate: json['list'][i]['dt_txt'],
        weathericon: json['list'][i]['weather'][0]['icon'],
        probabilityOfPrecipitation: json['list'][i]['pop'].toDouble());
  }
}
