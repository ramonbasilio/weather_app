// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/foundation.dart';
import 'package:weaher_app/model/model_search_city.dart';
import 'package:weaher_app/service/http_service.dart';

import '../model/model_weather_current.dart';

class AppProvider extends ChangeNotifier {
  final _httpService = HttpService();
  bool isLoading = false;
  List<ModelSearchCity> _listSearchCity = [];
  List<ModelSearchCity> get listSearchCity => _listSearchCity;

  late ForecastDay _weatherCurrent;
  ForecastDay get weatherCurrent => _weatherCurrent;

  Future<void> getSearchCity(String city) async {
    _listSearchCity = await _httpService.GetSearchCity(city: city);
    notifyListeners();
  }
}
