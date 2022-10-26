import 'package:sqflite_migration_service/sqflite_migration_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../../features/splash/splash_view.dart';
import '../../features/wrapper/wrapper_view.dart';
import '../services/current_weather_service.dart';
import '../services/database_service.dart';
import '../services/dio_service.dart';
import '../services/geo_locator_service.dart';
import '../services/permission_service.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: SplashView, initial: true),
    AdaptiveRoute(page: WrapperView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(
      classType: ThemeService,
      resolveUsing: ThemeService.getInstance,
    ),
    LazySingleton(classType: DatabaseMigrationService),
    LazySingleton(classType: DatabaseService),
    LazySingleton(
      classType: DioHttpServiceImpl,
      asType: DioHttpService,
    ),
    LazySingleton(
      classType: CurrentWeatherServiceImpl,
      asType: CurrentWeatherService,
    ),
    LazySingleton(
      classType: PermissionServiceImpl,
      asType: PermissionService,
    ),
    LazySingleton(
      classType: GeoLocatorServiceImpl,
      asType: GeoLocatorService,
    ),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
