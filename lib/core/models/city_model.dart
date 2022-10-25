class CityModel {
  String? city;
  String? lat;
  String? lng;

  CityModel({
    this.city,
    this.lat,
    this.lng,
  });

  static const defaultCity = {
    "city": "Lagos",
    "lat": "6.4500",
    "lng": "3.4000",
  };

  CityModel.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}
