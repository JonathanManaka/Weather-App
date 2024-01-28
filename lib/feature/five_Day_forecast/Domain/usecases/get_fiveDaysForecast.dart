import 'package:weather/core/usecases/use_case.dart';
import 'package:weather/feature/five_Day_forecast/Domain/entities/five_day_forecast.dart';
import 'package:weather/feature/five_Day_forecast/Domain/repositories/fiveDaysForecast_repository.dart';

class GetFiveDaysForecastUseCase
    implements UseCase<List<FiveDayForecastEntity>, void> {
  final FiveDaysForecastRepository _fiveDaysForecastRepository;
  GetFiveDaysForecastUseCase(this._fiveDaysForecastRepository);
  @override
  Future<List<FiveDayForecastEntity>> call({void params}) {
    return _fiveDaysForecastRepository.getFiveDaysForecast();
  }
}
