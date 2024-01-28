import 'package:equatable/equatable.dart';
import 'package:weather/feature/five_Day_forecast/Domain/entities/current_forecast.dart';

abstract class RemoteCurrentForecastState extends Equatable {
  final List<CurrentForecastEntity>? currentForecast;
  const RemoteCurrentForecastState({this.currentForecast});

  @override
  List<Object> get props => [currentForecast!];
}

class RemoteCurrentForecastLoading extends RemoteCurrentForecastState {
  const RemoteCurrentForecastLoading();
}

class RemoteCurrentForecastDone extends RemoteCurrentForecastState {
  const RemoteCurrentForecastDone(List<CurrentForecastEntity> currentForecast)
      : super(currentForecast: currentForecast);
}
