import 'package:weather/feature/five_Day_forecast/Domain/usecases/get_fiveDaysForecast.dart';
import 'package:weather/feature/five_Day_forecast/Presentation/bloc/remote/remote_fiveDaysForecast_state.dart';
import 'package:weather/feature/five_Day_forecast/Presentation/bloc/remote/remote_fiveDaysForecats_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteFiveDaysForecastBloc
    extends Bloc<RemoteFiveDaysForecastEvent, RemoteFiveDaysForecastState> {
  final GetFiveDaysForecastUseCase _getFiveDaysForecastUseCase;
  RemoteFiveDaysForecastBloc(this._getFiveDaysForecastUseCase)
      : super(const RemoteFiveDayForecastLoading()) {
    on<GetFiveDaysForecast>(onGetFiveDaysForecast);
  }

  void onGetFiveDaysForecast(GetFiveDaysForecast event,
      Emitter<RemoteFiveDaysForecastState> emit) async {
    final dataState = await _getFiveDaysForecastUseCase();
    if (dataState.isNotEmpty) {
      emit(RemoteFiveDayForecastDone(dataState));
    }
  }
}
