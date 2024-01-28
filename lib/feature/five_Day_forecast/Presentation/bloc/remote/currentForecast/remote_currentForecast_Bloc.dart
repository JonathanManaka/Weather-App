import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/feature/five_Day_forecast/Domain/usecases/get_currentForecast.dart';
import 'package:weather/feature/five_Day_forecast/Presentation/bloc/remote/currentForecast/remote_currentForecast_event.dart';
import 'package:weather/feature/five_Day_forecast/Presentation/bloc/remote/currentForecast/remote_currentForecast_state.dart';

class RemoteCurrentForecastBloc
    extends Bloc<RemoteCurrentForecastEvent, RemoteCurrentForecastState> {
  final GetCurrentForecastUsecase _getCurrentForecastUsecase;
  RemoteCurrentForecastBloc(this._getCurrentForecastUsecase)
      : super(const RemoteCurrentForecastLoading()) {
    on<GetCurrentForecast>(onGetCurrentForecat);
  }
  void onGetCurrentForecat(GetCurrentForecast event,
      Emitter<RemoteCurrentForecastState> emit) async {
    final dataState = await _getCurrentForecastUsecase();
    if (dataState.isNotEmpty) {
      emit(RemoteCurrentForecastDone(dataState));
    }
  }
}
