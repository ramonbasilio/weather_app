import 'package:flutter/material.dart';
import 'package:weaher_app/model/model_forecastday.dart';

class ForecastdayProvider extends ChangeNotifier {
  final List<ForecastDayFull> _listForecastDay = [];
  List<ForecastDayFull> get listForecastDay => _listForecastDay;

  saveForecastDayProvider(ForecastDayFull dataWeather) {
    _listForecastDay.add(dataWeather);
    //notifyListeners();
  }
}
