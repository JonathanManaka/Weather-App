import 'package:weather/feature/five_Day_forecast/Domain/entities/five_day_forecast.dart';

abstract class FiveDaysForecastRepository {
  Future<List<FiveDayForecastEntity>> getFiveDaysForecast();
}
