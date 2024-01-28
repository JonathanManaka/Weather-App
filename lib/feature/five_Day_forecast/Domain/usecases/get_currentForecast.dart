import 'package:weather/core/usecases/use_case.dart';
import 'package:weather/feature/five_Day_forecast/Domain/entities/current_forecast.dart';
import 'package:weather/feature/five_Day_forecast/Domain/repositories/currentForecast_repository.dart';

class GetCurrentForecastUsecase
    implements UseCase<List<CurrentForecastEntity>, void> {
  final CurrentForecastRepository _currentForecastRepository;
  GetCurrentForecastUsecase(this._currentForecastRepository);
  @override
  Future<List<CurrentForecastEntity>> call({void params}) {
    return _currentForecastRepository.getCurrentForecast();
  }
}
