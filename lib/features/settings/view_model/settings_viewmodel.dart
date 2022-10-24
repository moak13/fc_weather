import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../../../core/app/app.locator.dart';

class SettingsViewModel extends BaseViewModel {
  final _themeService = locator<ThemeService>();

  List<String> tempList = ['C', 'F'];

  String? _temperature = '';
  String? get temperature => _temperature;

  void actionSwitchTemp(String? value) {
    _temperature = value;
    notifyListeners();
  }

  void actionSwitchTheme() {
    _themeService.toggleDarkLightTheme();
  }

  bool get isDark => _themeService.isDarkMode;
}
