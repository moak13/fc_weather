import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.logger.dart';
import '../../../core/extensions/dio_error_extension.dart';
import '../../../core/models/current_weather_model.dart';
import '../../../core/models/lat_long_model.dart';
import '../../../core/services/current_weather_service.dart';
import '../../../core/services/geo_locator_service.dart';

class HomeViewModel extends BaseViewModel {
  final _currentWeatherService = locator<CurrentWeatherService>();
  final _geoLocatorService = locator<GeoLocatorService>();
  CurrentWeatherModel? currentWeatherModel;
  LatLongModel? latLongModel;
  final _log = getLogger('HomeViewModel');

  void actionTrackLatLong(LatLongModel data) {
    _log.i('selection logged');
    latLongModel = data;
    notifyListeners();
  }

  void actionGetUserLocationWeather() async {
    final position = await _geoLocatorService.getUserLocation();
    LatLongModel data = LatLongModel(
      lat: position.latitude.toString(),
      long: position.longitude.toString(),
    );
    await actionFetchCurrentWeather(data);
  }

  Future<void> actionFetchCurrentWeather(LatLongModel data) async {
    _log.i('network call made');
    setBusy(true);
    try {
      final response =
          await _currentWeatherService.getCurrentWeather(latLongModel: data);
      currentWeatherModel = response;
    } on DioError catch (e) {
      setBusy(false);
      setError(e.errorMessage);
    } catch (e) {
      setBusy(false);
      setError(e.toString());
    } finally {
      setBusy(false);
    }
  }
}
