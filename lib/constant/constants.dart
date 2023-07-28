// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants{
  static String URLBASE = 'api.weatherapi.com';
  static String URLSEARCH = '/v1/search.json';
  static String URLFORECAST = '/v1/forecast.json';
  static String KEYAPI = 'cf6742caba224882a0303024232104';

  static Color BACKGROUND_DAY=const Color(0xffe5ecf4);
  static Color BACKGROUND_NIGHT =const Color(0xff313745);
  
  static TextStyle GOOGLE_FONTS_NUNITO = GoogleFonts.nunito();

  static Color FONT_COLOR_DAY = Colors.black;
  static Color FONT_COLOR_NIGHT = Colors.white;

    static Map<int, Color> color = {
    50: Color.fromRGBO(0, 0, 0, 0.098),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };

}