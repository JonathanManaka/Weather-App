import 'package:weather/core/constants/constants.dart';
import 'package:weather/core/resources/location.dart';
import 'package:weather/feature/five_Day_forecast/Data/datasource/remote/fiveDaysForecast_service.dart';
import 'package:weather/feature/five_Day_forecast/Data/model/fiveDayForecast_model.dart';
import 'package:weather/feature/five_Day_forecast/Domain/repositories/fiveDaysForecast_repository.dart';

class FiveDaysForecastRepositoryImpl implements FiveDaysForecastRepository {
  @override
  Future<List<FiveDaysForecastModel>> getFiveDaysForecast() async {
    Location deviceLocation = Location();
    List<FiveDaysForecastModel> fivedaysForecastList = [];
    String latidute = await deviceLocation.getLatitude();
    String longitude = await deviceLocation.getLongitude();
    final fiveDaysForecastService = FiveDaysForecastService(
        apikey: apiKey,
        latitude: latidute,
        longitude: longitude,
        baseUrl: fiveDaysForecastBaseUrl);
    final response = await fiveDaysForecastService.getFiveDaysForecast();
    for (int i = 0; i < 40; i++) {
      fivedaysForecastList.add(FiveDaysForecastModel.fromJson(response, i));
    }
    return fivedaysForecastList;
  }
}
