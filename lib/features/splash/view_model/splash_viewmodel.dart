import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.logger.dart';
import '../../../core/app/app.router.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _log = getLogger('SplashViewModel');

  void _moveToWrapper() {
    _log.i('navigating to wrapper view');
    _navigationService.clearStackAndShow(Routes.wrapperView);
  }

  void handleStartUp() async {
    const Duration duration = Duration(seconds: 2);
    Timer(duration, _moveToWrapper);
  }
}
