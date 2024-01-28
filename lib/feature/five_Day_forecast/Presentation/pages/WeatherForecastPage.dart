import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/feature/five_Day_forecast/Presentation/bloc/remote/currentForecast/remote_currentForecast_Bloc.dart';
import 'package:weather/feature/five_Day_forecast/Presentation/bloc/remote/currentForecast/remote_currentForecast_state.dart';

import 'package:weather/feature/five_Day_forecast/Presentation/widgets/forecastBody.dart';
import 'package:weather/feature/five_Day_forecast/Presentation/widgets/loadingWidget.dart';

class WeatherForecastPage extends StatelessWidget {
  const WeatherForecastPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

//
  _buildBody() {
    return BlocBuilder<RemoteCurrentForecastBloc, RemoteCurrentForecastState>(
        builder: (_, state) {
      if (state is RemoteCurrentForecastLoading) {
        return const Center(child: LoadingWidget());
      }

      if (state is RemoteCurrentForecastDone) {
        return ForecastBody(currentForecastEntity: state.currentForecast![0]);
      }
      return const SizedBox();
    });
  }
}
