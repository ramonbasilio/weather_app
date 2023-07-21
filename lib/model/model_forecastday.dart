// ignore_for_file: public_member_api_docs, sort_constructors_first
class ForecastDayFull {
  final Map location;
  final Map current;
  final Map forecast;
  final List forecastday;
  final int temp;
  final String linkIcon;

  ForecastDayFull({
    required this.location,
    required this.current,
    required this.forecast,
    required this.forecastday,
    required this.temp,
    required this.linkIcon,
  });


  factory ForecastDayFull.fromMap(Map<String, dynamic> map) {
    return ForecastDayFull(
      location: map['location'] as Map,
      current: map['current'] as Map,
      forecast: map['forecast'] as Map,
      forecastday: map['forecast']['forecastday'],
      temp: map['current']['temp_c'] as int,
      linkIcon: map['current']['condition']['icon']
    );
  }

}
