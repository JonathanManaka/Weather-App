import 'package:get_it/get_it.dart';
import 'package:weather/feature/five_Day_forecast/Data/repositories/currentForecast_Repository_impl.dart';
import 'package:weather/feature/five_Day_forecast/Data/repositories/fiveDaysForecast_Repository_impl.dart';
import 'package:weather/feature/five_Day_forecast/Domain/repositories/currentForecast_repository.dart';
import 'package:weather/feature/five_Day_forecast/Domain/repositories/fiveDaysForecast_repository.dart';
import 'package:weather/feature/five_Day_forecast/Domain/usecases/get_currentForecast.dart';
import 'package:weather/feature/five_Day_forecast/Domain/usecases/get_fiveDaysForecast.dart';
import 'package:weather/feature/five_Day_forecast/Presentation/bloc/remote/currentForecast/remote_currentForecast_Bloc.dart';
import 'package:weather/feature/five_Day_forecast/Presentation/bloc/remote/remote_fiveDaysForecast_Bloc.dart';

GetIt sl = GetIt.instance;
GetIt sls = GetIt.instance;
Future<void> initializeDependencies() async {
  sls.registerSingleton<FiveDaysForecastRepository>(
      FiveDaysForecastRepositoryImpl());
  sls.registerSingleton<GetFiveDaysForecastUseCase>(
      GetFiveDaysForecastUseCase(sl()));
  sls.registerFactory(() => RemoteFiveDaysForecastBloc(sl()));

  sl.registerSingleton<CurrentForecastRepository>(
      CurrentForecastRepositoryImpl());
  sl.registerSingleton<GetCurrentForecastUsecase>(
      GetCurrentForecastUsecase(sl()));
  sl.registerFactory(() => RemoteCurrentForecastBloc(sl()));
}
