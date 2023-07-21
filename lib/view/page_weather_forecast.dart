// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weaher_app/model/model_forecastday.dart';
import 'package:weaher_app/widgets/big_container.dart';
import '../service/http_service.dart';


class PageWeatherForecast extends StatelessWidget {
  const PageWeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF041023),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: FutureBuilder<ForecastDayFull>(
                future: HttpService().GetWeatherCurrent(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: 600,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           CircularProgressIndicator(),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Align(alignment: Alignment.center,
                      child: Text(
                          'Nenhuma cidade pesquisada ainda...${snapshot.error}'),
                    );
                  } else if (snapshot.hasData) {
                    ForecastDayFull dataWeather = snapshot.data as ForecastDayFull;
                    return BigContainer(dataWeather: dataWeather);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
