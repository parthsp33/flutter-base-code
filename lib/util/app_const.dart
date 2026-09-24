abstract class AppConst {
  static const int phoneNumberMinLen = 7;
  static const int phoneNumberLen = 15;
  static const int addressMinLen = 10;
  static const int addressMax = 500;
  static const int desMinLen = 10;
  static const int desMax = 500;
  static const int snackBarDuration = 2000;
  static const int paginationLimit = 10;

  /// Name of the route that is visible now. Updated by NavigationService.
  static String currentScreen = '';
}
