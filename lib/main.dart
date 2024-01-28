import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/config/theme/app_theme.dart';
import 'package:weather/feature/five_Day_forecast/Presentation/bloc/remote/currentForecast/remote_currentForecast_Bloc.dart';
import 'package:weather/feature/five_Day_forecast/Presentation/bloc/remote/currentForecast/remote_currentForecast_event.dart';
import 'package:weather/feature/five_Day_forecast/Presentation/pages/WeatherForecastPage.dart';
import 'package:weather/injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteCurrentForecastBloc>(
      create: (context) => sl()..add(const GetCurrentForecast()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const WeatherForecastPage(),
        theme: theme(),
      ),
    );
  }
}
