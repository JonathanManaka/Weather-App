import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/config/theme/app_theme.dart';
import 'package:weather/core/resources/Conversion.dart';
import 'package:weather/feature/five_Day_forecast/Domain/entities/five_day_forecast.dart';
import 'package:weather/feature/five_Day_forecast/Presentation/bloc/remote/remote_fiveDaysForecast_Bloc.dart';
import 'package:weather/feature/five_Day_forecast/Presentation/bloc/remote/remote_fiveDaysForecast_state.dart';
import 'package:weather/feature/five_Day_forecast/Presentation/bloc/remote/remote_fiveDaysForecats_event.dart';
import 'package:weather/feature/five_Day_forecast/Presentation/widgets/loadingWidget.dart';
import 'package:weather/injection_container.dart';

class DetailedWidget extends StatelessWidget {
  const DetailedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteFiveDaysForecastBloc>(
      create: (context) => sls()..add(const GetFiveDaysForecast()),
      child: _buildDetailWidget(),
    );
  }

  _buildDetailWidget() {
    return BlocBuilder<RemoteFiveDaysForecastBloc, RemoteFiveDaysForecastState>(
        builder: (_, state) {
      if (state is RemoteFiveDayForecastLoading) {
        return const Center(child: LoadingWidget());
      }
      if (state is RemoteFiveDayForecastDone) {
        return DetailedForecastWidget(
            fiveDayForecastEntity: state.fiveDayForecast!);
      }
      return const SizedBox();
    });
  }
}

class DetailedForecastWidget extends StatelessWidget {
  final List<FiveDayForecastEntity> fiveDayForecastEntity;
  const DetailedForecastWidget(
      {super.key, required this.fiveDayForecastEntity});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          width: 100,
          child: Column(
            children: <Widget>[
              Text(
                Convertions.convertDateTime(
                    fiveDayForecastEntity[index].weatherDate!),
                style: detailTemptext(),
              ),
              SizedBox(
                height: 25,
              ),
              Image.network(
                  'http://openweathermap.org/img/w/${fiveDayForecastEntity[index].weathericon}.png'),
              SizedBox(
                height: 25,
              ),
              Text(
                '${Convertions.tempConvertion(fiveDayForecastEntity[index].maxTemp)}°C / ${Convertions.tempConvertion(fiveDayForecastEntity[index].minTemp)}°C',
                style: detailedTempStyle(),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: Lottie.asset('assets/rain_icon_anim.json'),
                  ),
                  Text(
                    '${Convertions.percipitationPerc(fiveDayForecastEntity[index].probabilityOfPrecipitation)}%',
                    style: detailedTempStyle(),
                  )
                ],
              )
            ],
          ),
        );
      },
      itemCount: fiveDayForecastEntity.length,
    );
  }
}
