import 'package:permission_handler/permission_handler.dart';

import '../app/app.logger.dart';

abstract class PermissionService {
  Future<bool> requestLocationPermission();
  Future<bool> checkPermissionStatus();
}

class PermissionServiceImpl implements PermissionService {
  final _log = getLogger('PermissionService');
  @override
  Future<bool> requestLocationPermission() async {
    _log.i('permission requested');
    PermissionStatus data = await Permission.location.request();
    if (data.isDenied) {
      _log.i('permission is denied');
      return false;
    }
    _log.i('permission is accepted');
    return true;
  }

  @override
  Future<bool> checkPermissionStatus() async {
    _log.i('status check');
    PermissionStatus data = await Permission.location.status;
    if (data.isDenied) {
      _log.i('permission is denied');
      return false;
    }
    _log.i('peermission is accepted');
    return true;
  }
}
