import 'package:base_project/data/api/api_service.dart';
import 'package:base_project/data/storage/storage.dart';
import 'package:base_project/presentation/service/connectivity_service.dart';
import 'package:base_project/presentation/service/date_time.dart';
import 'package:base_project/presentation/service/misc.dart';
import 'package:base_project/presentation/service/navigation.dart';
import 'package:base_project/presentation/service/toast.dart';
import 'package:base_project/util/event_bus.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

/// Register all app services here. Call after Hive box is open.
abstract class Locator {
  static void registerDi() {
    final getIt = GetIt.instance;
    getIt.registerLazySingleton<NavigationService>(() => NavigationService());
    getIt.registerLazySingleton<StorageService>(() => StorageService());
    getIt.registerLazySingleton<ToastService>(() => ToastService());
    getIt.registerLazySingleton<ApiService>(() => ApiService());
    getIt.registerLazySingleton<ConnectivityService>(() => ConnectivityService());
    getIt.registerLazySingleton<DateTimeService>(() => DateTimeService());
    getIt.registerLazySingleton<MiscService>(() => MiscService());
    getIt.registerLazySingleton<EventBusService>(() => EventBusService());
  }
}

/// Context of the root navigator. Use only when no local context is available.
BuildContext get appContext => GetIt.I<NavigationService>().navigatorKey.currentContext!;
