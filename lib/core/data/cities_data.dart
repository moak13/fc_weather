import '../models/city_model.dart';

const List<Map<String, dynamic>> _cities = [
  {
    "city": "Lagos",
    "lat": "6.4500",
    "lng": "3.4000",
  },
  {
    "city": "Kano",
    "lat": "12.0000",
    "lng": "8.5167",
  },
  {
    "city": "Ibadan",
    "lat": "7.3964",
    "lng": "3.9167",
  },
  {
    "city": "Onitsha",
    "lat": "6.1667",
    "lng": "6.7833",
  },
  {
    "city": "Owerri",
    "lat": "5.4833",
    "lng": "7.0333",
  },
  {
    "city": "Abuja",
    "lat": "9.0556",
    "lng": "7.4914",
  },
  {
    "city": "Maiduguri",
    "lat": "11.8333",
    "lng": "13.1500",
  },
  {
    "city": "Benin City",
    "lat": "6.3176",
    "lng": "5.6145",
  },
  {
    "city": "Ikare",
    "lat": "7.5304",
    "lng": "5.7600",
  },
  {
    "city": "Ogbomoso",
    "lat": "8.1333",
    "lng": "4.2500",
  },
  {
    "city": "Port Harcourt",
    "lat": "4.7500",
    "lng": "7.0000",
  },
  {
    "city": "Abeokuta",
    "lat": "7.1500",
    "lng": "3.3500",
  },
  {
    "city": "Jos",
    "lat": "9.9333",
    "lng": "8.8833",
  },
  {
    "city": "Ilorin",
    "lat": "8.5000",
    "lng": "4.5500",
  },
  {
    "city": "Warri",
    "lat": "5.5167",
    "lng": "5.7500",
  }
];

List<CityModel> get deserializedCities {
  final List<CityModel> data =
      _cities.map<CityModel>((e) => CityModel.fromJson(e)).toList();
  return data;
}
