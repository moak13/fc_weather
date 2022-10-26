import 'package:geolocator/geolocator.dart';

import '../app/app.locator.dart';
import '../app/app.logger.dart';
import 'permission_service.dart';

abstract class GeoLocatorService {
  Future<Position> getUserLocation();
}

class GeoLocatorServiceImpl implements GeoLocatorService {
  final _permissionService = locator<PermissionService>();
  final _log = getLogger('GeoLocatorService');
  @override
  Future<Position> getUserLocation() async {
    _log.i('fetching user location');
    Position position;
    bool status = await _permissionService.checkPermissionStatus();
    if (!status) {
      bool requestStatus = await _permissionService.requestLocationPermission();
      if (!requestStatus) {
        position = Position(
          longitude: 0,
          latitude: 0,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          speedAccuracy: 0,
        );
      }
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    }
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return position;
  }
}
