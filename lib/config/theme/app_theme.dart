import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: mainColor(),
    fontFamily: 'Poppins',
    appBarTheme: appBarTheme(),
  );
}

Color mainColor() {
  return const Color(0xFF13ADEB);
}

Color secondaryColor() {
  return const Color(0xFF71C8EB);
}

Color detailWidgetColor() {
  return const Color(0xFF42BBEB);
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: mainColor(),
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
  );
}

TextStyle textStyleheading() {
  return const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 27);
}

TextStyle textMain() {
  return const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 18);
}

TextStyle semiText() {
  return const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 25);
}

TextStyle temperatureText() {
  return const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 37);
}

TextStyle detailTemptext() {
  return const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 14);
}

TextStyle detailedTempStyle() {
  return const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 11);
}
