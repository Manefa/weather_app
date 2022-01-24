/// EnvConfig
/// 
/// Contains the environment variables 
/// passed to the application via dart-define.
/// Example:
/// ```dart
/// $ flutter run --dart-define=env=dev
/// ```
/// 
/// appName will this be equal to "dev"
/// Learn more: https://medium.com/@tatsu.ukraine/flutter-2-2-dart-defines-and-breaking-changes-here-we-go-again-ce40cfea74fd
mixin EnvConfig {
  static const String appName = String.fromEnvironment("env");
  static const String endpoint = String.fromEnvironment("endpoint");
  static const String noInternetConnection = String.fromEnvironment("Aucune Connection internet");
  static const String failureToLoadDataLocally = String.fromEnvironment("Échec du chargement des données en local");
  static const String localDataBackupFailure = String.fromEnvironment("Échec de la sauvegarde des données en local");
}
