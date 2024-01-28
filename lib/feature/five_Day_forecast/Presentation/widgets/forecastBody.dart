import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/config/theme/app_theme.dart';
import 'package:weather/core/resources/Conversion.dart';
import 'package:weather/feature/five_Day_forecast/Domain/entities/current_forecast.dart';
import 'package:weather/feature/five_Day_forecast/Presentation/widgets/detailed_forecast.dart';
import 'package:weather/feature/five_Day_forecast/Presentation/widgets/responseAnimMsg.dart';

// ignore: must_be_immutable
class ForecastBody extends StatelessWidget {
  final CurrentForecastEntity currentForecastEntity;
  const ForecastBody({
    super.key,
    required this.currentForecastEntity,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        backgroundColor: mainColor(),
        body: SafeArea(
            child: CustomScrollView(
          slivers: [
            //Sliver appbar
            SliverAppBar(
              backgroundColor: mainColor(),

              title: Row(
                children: [
                  Spacer(),
                  Text(
                    '${currentForecastEntity.cityName}',
                    style: textStyleheading(),
                  ),
                  Icon(
                    Icons.pin_drop,
                    color: Colors.white,
                  ),
                  const Spacer(),
                  Lottie.asset(
                      ResponseMessage.getWeatherAnimation(
                          currentForecastEntity.weatherCondition),
                      height: 75,
                      width: 75),
                ],
              ),

              expandedHeight: 500,
              toolbarHeight: 150,

              //The app bar will always appear when you scroll up
              floating: true,
              //The appbar will always be pinned on the top
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Container(
                    color: mainColor(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 100,
                        ),
                        Text(
                            '${Convertions.tempConvertion(currentForecastEntity.temperature)} °C',
                            style: temperatureText()),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          '${currentForecastEntity.weatherDesc}',
                          style: semiText(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${Convertions.tempConvertion(currentForecastEntity.maxTemp)} °C / ${Convertions.tempConvertion(currentForecastEntity.minTemp)} °C',
                          style: textMain(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 100),
                              child: Text(
                                'Feels like ${Convertions.tempConvertion(currentForecastEntity.feelsLikeTemp)} °C',
                                style: textMain(),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25,
                              ),
                              child: Lottie.asset(
                                  ResponseMessage.getWeatherStatusAnnimation(
                                      currentForecastEntity.weatherCondition),
                                  height: 150,
                                  width: 100),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ),

            //Sliver Items
            SliverToBoxAdapter(
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 250,
                      color: secondaryColor(),
                      child: Row(children: [
                        Spacer(),
                        //Temperature holder
                        Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)),
                              height: 160,
                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  //icon anim
                                  Lottie.asset('assets/Sunny-animation.json',
                                      height: 50, width: 50, fit: BoxFit.cover),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const SizedBox(height: 15),
                                  //weather_data
                                  Text(
                                    "${Convertions.tempConvertion(currentForecastEntity.temperature)} °C",
                                    style: textMain(),
                                  ),
                                  const SizedBox(height: 15),
                                  //weather description
                                  Text(
                                    'Temp',
                                    style: detailTemptext(),
                                  )
                                ],
                              ),
                            )),
                        Spacer(),
                        //Wind Speed and direction holder
                        Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)),
                              height: 160,
                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  //icon anim
                                  Lottie.asset('assets/windy.json',
                                      height: 50, width: 50, fit: BoxFit.cover),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(height: 15),
                                  //weather_data
                                  Text(
                                    "${Convertions.speedConvertion(currentForecastEntity.windSpeed)} km/h",
                                    style: textMain(),
                                  ),
                                  SizedBox(height: 15),
                                  //weather description
                                  Text(
                                    'Wind',
                                    style: detailTemptext(),
                                  )
                                ],
                              ),
                            )),
                        Spacer(),
                        //cloude coverage percentage
                        Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)),
                              height: 160,
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  //icon anim
                                  Lottie.asset('assets/Cloudy-animation.json',
                                      height: 50, width: 50, fit: BoxFit.cover),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(height: 15),
                                  //weather_data
                                  Text(
                                    "${currentForecastEntity.cloudsPerc} %",
                                    style: textMain(),
                                  ),
                                  SizedBox(height: 15),
                                  //weather description
                                  Text(
                                    'Clouds',
                                    style: detailTemptext(),
                                  )
                                ],
                              ),
                            )),
                        Spacer(),
                      ]),
                    ),
                  )),
            ),
            //Detailed 5 day forecast
            SliverToBoxAdapter(
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                        height: 300,
                        color: detailWidgetColor(),
                        child: const DetailedWidget()),
                  )),
            ),

            /**Add more weather information
            *  SliverToBoxAdapter(
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 500,
                      color: Colors.purple,
                    ),
                  )),
            ),
             */
          ],
        )));
  }
}
