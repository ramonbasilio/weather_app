// ignore_for_file: public_member_api_docs, sort_constructors_first

class ForecastDay {
  final Map location;
  final String region;
  final Map current;
  final String conditionText;
  final String temp;
  final String lastUpdated;
  final String humidity;

  ForecastDay({
    required this.conditionText,
    required this.temp,
    required this.lastUpdated,
    required this.humidity,
    required this.location,
    required this.current,
    required this.region,
  });

  factory ForecastDay.fromMap(Map<String, dynamic> map) {
    return ForecastDay(
      location: map['location'] as Map,
      current: map['current'] as Map,
      conditionText: map['current']['condition']['text'] as String,
      humidity: map['current']['humidity'].toString(),
      lastUpdated: map['current']['last_updated'],
      region: map['location']['region'],
      temp: map['current']['temp_c'].toString(),
    );
  }
}
