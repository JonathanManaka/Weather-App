import 'package:weather/core/constants/constants.dart';
import 'package:weather/core/resources/location.dart';
import 'package:weather/feature/five_Day_forecast/Data/datasource/remote/currectForecast_service.dart';
import 'package:weather/feature/five_Day_forecast/Data/model/currentForecast_model.dart';
import 'package:weather/feature/five_Day_forecast/Domain/repositories/currentForecast_repository.dart';

class CurrentForecastRepositoryImpl implements CurrentForecastRepository {
  @override
  Future<List<CurrentForecastModel>> getCurrentForecast() async {
    Location deviceLocation = Location();
    String testLat = '-24.1833';
    String testLong = '29.0167';
    String latitude = await deviceLocation.getLatitude();
    String longitude = await deviceLocation.getLongitude();
    List<CurrentForecastModel> currentForecastModel = [];
    final currentForecastService = CurrentForecastService(
        apikey: apiKey,
        latitude: latitude,
        longitude: longitude,
        baseUrl: currentForecastBaseUrl);
    final response = await currentForecastService.getCurrentForecast();

    currentForecastModel.add(CurrentForecastModel.fromJson(response));

    return currentForecastModel;
  }
}
