import 'package:equatable/equatable.dart';

class CurrentForecastEntity extends Equatable {
  final String? cityName;
  final double? temperature;
  final String? weatherCondition;
  final String? weatherDesc;
  final double? minTemp;
  final double? maxTemp;
  final double? feelsLikeTemp;
  final double? windSpeed;
  final int? cloudsPerc;
  final int? humidity;

  const CurrentForecastEntity(
      {this.cityName,
      this.temperature,
      this.weatherCondition,
      this.weatherDesc,
      this.minTemp,
      this.maxTemp,
      this.feelsLikeTemp,
      this.windSpeed,
      this.cloudsPerc,
      this.humidity});
  @override
  List<Object?> get props {
    return [
      cityName,
      temperature,
      weatherCondition,
      weatherDesc,
      minTemp,
      maxTemp,
      feelsLikeTemp,
      windSpeed,
      cloudsPerc,
      humidity
    ];
  }
}
