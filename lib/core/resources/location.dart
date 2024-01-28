import 'package:geolocator/geolocator.dart';

class Location {
  //This method returns location latitute
  Future<String> getLatitude() async {
    //Get Permission from the user
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    //Fetch current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //Asigning latitude

    return position.latitude.toString();
  }

//This method returns location longitude
  Future<String> getLongitude() async {
    //Get Permission from the user
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    //Fetch current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //Asigning longitude

    return position.longitude.toString();
  }
}
