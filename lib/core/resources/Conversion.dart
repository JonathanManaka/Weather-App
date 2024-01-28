import 'package:intl/intl.dart';

class Convertions {
  //This function converts m/s to Km/h
  static int speedConvertion(double? ms) {
    int kmh = (ms! * 3.6).round();

    return kmh;
  }

  //This function converts temperature from kelvin to degrees celsius
  static int tempConvertion(double? kelvTemp) {
    return (kelvTemp! - 273.15).toInt();
  }

  //This function converts fractional value to a whole number
  static int percipitationPerc(double? pop) {
    double percentageVal = pop! * 100;

    return percentageVal.toInt();
  }

  //This function changes date format and return only the time with the format (eg. 3:00 AM)
  static String convertDateTime(String dateTime) {
    DateTime dateTimeVal = DateTime.parse(dateTime);
    String formatedDate = DateFormat.jmv().format(dateTimeVal);

    return formatedDate;
  }
}
