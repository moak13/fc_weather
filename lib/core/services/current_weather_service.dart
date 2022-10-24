import 'package:dio/dio.dart';

import '../app/app.locator.dart';
import '../app/app.logger.dart';
import '../models/current_weather_model.dart';
import '../models/lat_long_model.dart';
import '../utils/config.dart';
import 'dio_service.dart';

abstract class CurrentWeatherService {
  String get appID;
  Future<CurrentWeatherModel> getCurrentWeather({LatLongModel? latLongModel});
}

class CurrentWeatherServiceImpl implements CurrentWeatherService {
  final _dioHttpService = locator<DioHttpService>();
  final _log = getLogger('CurrentWeatherService');
  @override
  String get appID => Config.appID;

  @override
  Future<CurrentWeatherModel> getCurrentWeather(
      {LatLongModel? latLongModel}) async {
    _log.i('function has been called');
    Map<String, String> param = {
      'lat': '${latLongModel?.lat}',
      'lon': '${latLongModel?.long}',
      'appid': appID,
    };

    try {
      final response = await _dioHttpService.appGet(
        Config.pathUrl,
        queryParameters: param,
      );
      return CurrentWeatherModel.fromJson(response);
    } on DioError {
      rethrow;
    }
  }
}
