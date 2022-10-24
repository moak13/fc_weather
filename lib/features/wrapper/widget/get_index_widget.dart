import 'package:flutter/material.dart';

import '../../home/home_view.dart';
import '../../settings/settings_view.dart';

class GetIndexWidget extends StatelessWidget {
  final int? index;
  const GetIndexWidget({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const SettingsView();
      default:
        return const HomeView();
    }
  }
}
