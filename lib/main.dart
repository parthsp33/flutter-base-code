import 'package:base_project/app.dart';
import 'package:base_project/data/storage/storage_constants.dart';
import 'package:base_project/presentation/service/connectivity_service.dart';
import 'package:base_project/util/core_export.dart';
import 'package:localization/localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(box);

  LocalJsonLocalization.delegate.directories = ['assets/languages'];

  Locator.registerDi();
  GetIt.I<ConnectivityService>().startListening();

  // Add Firebase, crash reporting, payment SDK etc. init here.

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}
