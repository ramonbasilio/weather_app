// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class Utils {
  static String utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }

  static String NightOrDay(String url) {
    String result = '';
    List<String> list = url.split('/');
    for (var elemento in list) {
      if (elemento == 'day' || elemento == 'night') {
        result = elemento;
      }
    }
    return result;
  }

  static String NameImage(String url) {
    String result = '';
    List<String> list = url.split('/');
    for (var elemento in list) {
      if (elemento.contains('.png')) {
        result = elemento;
      }
    }
    return result;
  }
}
