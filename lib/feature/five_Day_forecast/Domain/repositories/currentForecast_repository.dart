import 'package:weather/feature/five_Day_forecast/Domain/entities/current_forecast.dart';

abstract class CurrentForecastRepository {
  Future<List<CurrentForecastEntity>> getCurrentForecast();
}
