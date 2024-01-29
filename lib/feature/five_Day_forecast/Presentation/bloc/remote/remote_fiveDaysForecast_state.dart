import 'package:equatable/equatable.dart';
import 'package:weather/feature/five_Day_forecast/Domain/entities/five_day_forecast.dart';

abstract class RemoteFiveDaysForecastState extends Equatable {
  final List<FiveDayForecastEntity>? fiveDayForecast;

  const RemoteFiveDaysForecastState({this.fiveDayForecast});

  @override
  List<Object> get props => [fiveDayForecast!];
}

class RemoteFiveDayForecastLoading extends RemoteFiveDaysForecastState {
  const RemoteFiveDayForecastLoading();
}

class RemoteFiveDayForecastDone extends RemoteFiveDaysForecastState {
  const RemoteFiveDayForecastDone(List<FiveDayForecastEntity> fiveDayForecast)
      : super(fiveDayForecast: fiveDayForecast);
}
