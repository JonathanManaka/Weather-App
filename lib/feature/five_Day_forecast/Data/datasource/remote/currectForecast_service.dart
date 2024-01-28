import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrentForecastService {
  final String apikey;
  final String latitude;
  final String longitude;
  final String baseUrl;

  int statuCode = 0;

  CurrentForecastService({
    required this.apikey,
    required this.latitude,
    required this.longitude,
    required this.baseUrl,
  });

  Future getCurrentForecast() async {
    final response = await http
        .get(Uri.parse('$baseUrl?lat=$latitude&lon=$longitude&appid=$apikey'));
    if (response.statusCode == 200) {
      statuCode = response.statusCode;
      return jsonDecode(response.body);
    } else {
      statuCode = response.statusCode;
      throw Exception('Failed to load current weather data');
    }
  }
}
