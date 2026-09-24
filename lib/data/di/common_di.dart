import 'package:base_project/data/storage/storage.dart';
import 'package:base_project/presentation/service/date_time.dart';
import 'package:base_project/presentation/service/misc.dart';
import 'package:base_project/presentation/service/navigation.dart';
import 'package:base_project/presentation/service/toast.dart';
import 'package:base_project/util/event_bus.dart';
import 'package:get_it/get_it.dart';

/// Gives quick access to common services in widgets and cubits.
mixin CommonDi {
  NavigationService get navigation => GetIt.I<NavigationService>();
  StorageService get storage => GetIt.I<StorageService>();
  ToastService get toast => GetIt.I<ToastService>();
  DateTimeService get dateTime => GetIt.I<DateTimeService>();
  MiscService get misc => GetIt.I<MiscService>();
  EventBusService get eventBus => GetIt.I<EventBusService>();

  void showError(String? message) {
    if (message == null || message.isEmpty) return;
    toast.errorToast(message);
  }

  void showSuccess(String? message) {
    if (message == null || message.isEmpty) return;
    toast.successToast(message);
  }
}
