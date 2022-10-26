// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:sqflite_migration_service/src/database_migration_service.dart';
import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_themes/src/theme_service.dart';

import '../services/current_weather_service.dart';
import '../services/database_service.dart';
import '../services/dio_service.dart';
import '../services/permission_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => ThemeService.getInstance());
  locator.registerLazySingleton(() => DatabaseMigrationService());
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton<DioHttpService>(() => DioHttpServiceImpl());
  locator.registerLazySingleton<CurrentWeatherService>(
      () => CurrentWeatherServiceImpl());
  locator
      .registerLazySingleton<PermissionService>(() => PermissionServiceImpl());
}
