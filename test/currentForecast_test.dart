import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather/core/constants/constants.dart';
import 'package:weather/feature/five_Day_forecast/Data/datasource/remote/currectForecast_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  test('Server request succeeded', () async {
    String testLat = '-24.1833';
    String testLong = '29.0167';
    int statusCode;
    CurrentForecastService currentForecastService = CurrentForecastService(
        apikey: apiKey,
        latitude: testLat,
        longitude: testLong,
        baseUrl: currentForecastBaseUrl);
    await currentForecastService.getCurrentForecast();
    statusCode = currentForecastService.statuCode;
    expect(statusCode, 200);
  });
}
