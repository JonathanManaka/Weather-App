import 'dart:convert';
import 'package:http/http.dart' as http;

class FiveDaysForecastService {
  final String apikey;
  final String latitude;
  final String longitude;
  final String baseUrl;
  int statuCode = 0;
  FiveDaysForecastService(
      {required this.apikey,
      required this.latitude,
      required this.longitude,
      required this.baseUrl});
  Future getFiveDaysForecast() async {
    String testLat = '-24.1833';
    String testLong = '29.0167';
    final response = await http
        .get(Uri.parse('$baseUrl?lat=$latitude&lon=$longitude&appid=$apikey'));
    if (response.statusCode == 200) {
      //status code for  testing
      statuCode = response.statusCode;
      return jsonDecode(response.body);
    } else {
      //status code for  testing
      statuCode = response.statusCode;
      throw Exception('Failed to load Weather Data');
    }
  }
}
