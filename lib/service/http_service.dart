// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weaher_app/model/model_forecastday.dart';
import 'package:weaher_app/model/model_search_city.dart';
import '../constant/constants.dart';
import "package:http/http.dart" as http;

import 'firebase_service.dart';

class HttpService {
  Future<List<ModelSearchCity>> GetSearchCity({required String city}) async {
    Uri url = Uri.https(
      Constants.URLBASE,
      Constants.URLSEARCH,
      {
        'q': city,
        'key': Constants.KEYAPI,
        'lang': 'pt',
      },
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<ModelSearchCity> responseCity =
          jsonResponse.map((e) => ModelSearchCity.fromMap(e)).toList();
      return responseCity;
    } else {
      return [];
      //throw "Erro ao buscar cidade. Erro: ${response.statusCode}";
    }
  }

  Future<ForecastDayFull> GetWeatherCurrent() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> dados = await FirebaseService().getCitySave();
    print(dados);

    Uri url = Uri.https(
      Constants.URLBASE,
      Constants.URLFORECAST,
      {
        'q': dados['cidade'],
        'key': Constants.KEYAPI,
        'lang': 'pt',
        'days': '2',
      },
    );
    // Uri url = Uri.parse('http://api.weatherapi.com/v1/current.json?key=cf6742caba224882a0303024232104&q=Caieiras&lang=pt');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      ForecastDayFull weatherCurrent = ForecastDayFull.fromMap(jsonResponse);
      return weatherCurrent;
    } else {
      throw "Erro ao buscar cidade. Erro: ${response.statusCode}";
    }
  }
}
