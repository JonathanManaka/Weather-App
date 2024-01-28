import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:weather/feature/five_Day_forecast/Domain/entities/five_day_forecast.dart';

abstract class RemoteFiveDaysForecastState extends Equatable {
  final List<FiveDayForecastEntity>? fiveDayForecast;
  final DioException? error;
  const RemoteFiveDaysForecastState({this.fiveDayForecast, this.error});

  @override
  List<Object> get props => [fiveDayForecast!, error!];
}

class RemoteFiveDayForecastLoading extends RemoteFiveDaysForecastState {
  const RemoteFiveDayForecastLoading();
}

class RemoteFiveDayForecastDone extends RemoteFiveDaysForecastState {
  const RemoteFiveDayForecastDone(List<FiveDayForecastEntity> fiveDayForecast)
      : super(fiveDayForecast: fiveDayForecast);
}

class RemoteFiveDayForecastError extends RemoteFiveDaysForecastState {
  const RemoteFiveDayForecastError(DioException error) : super(error: error);
}
