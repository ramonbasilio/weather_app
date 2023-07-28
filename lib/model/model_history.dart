// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class History {
  String city;
  String country;
  
  History({
    required this.city,
    required this.country,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city,
      'country': country,
    };
  }

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      city: map['city'] as String,
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory History.fromJson(String source) => History.fromMap(json.decode(source) as Map<String, dynamic>);
}
