import 'dart:core';

class OpenWeatherModel {
  double? temp;
  double? feelslike;
  int? humidity;
  String? description;
  int? timezone;
  String? country;
  int? id;
  String? city;
  int? cod;
  String? icon;
  double? windspeed;

  OpenWeatherModel({
    this.temp,
    this.feelslike,
    this.humidity,
    this.description,
    this.timezone,
    this.country,
    this.id,
    this.city,
    this.cod,
    this.icon,
    this.windspeed,
  });

  factory OpenWeatherModel.fromJson(Map<String, dynamic> json) =>
      OpenWeatherModel(
        country: json["sys"]["country"],
        temp: json["main"]["temp"],
        feelslike: json["main"]["feels_like"],
        humidity: json["main"]["humidity"],
        description: json["weather"][0]["description"],
        timezone: json["timezone"],
        id: json["id"],
        city: json["name"],
        cod: json["cod"],
        icon: json["weather"][0]["icon"],
        windspeed: json['wind']['speed'],
      );
}
