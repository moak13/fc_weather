import 'main_model.dart';
import 'weather_model.dart';

class CurrentWeatherModel {
  List<WeatherModel>? weather;
  MainModel? main;
  String? name;

  CurrentWeatherModel({
    this.weather,
    this.main,
    this.name,
  });

  CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    if (json['weather'] != null) {
      weather = <WeatherModel>[];
      json['weather'].forEach((v) {
        weather!.add(WeatherModel.fromJson(v));
      });
    }
    main = json['main'] != null ? MainModel.fromJson(json['main']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (main != null) {
      data['main'] = main!.toJson();
    }
    data['name'] = name;
    return data;
  }
}
