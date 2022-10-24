class MainModel {
  double? temp;
  int? pressure;
  int? humidity;

  MainModel({
    this.temp,
    this.pressure,
    this.humidity,
  });

  MainModel.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    return data;
  }
}
