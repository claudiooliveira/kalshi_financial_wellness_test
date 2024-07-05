import 'package:core/environment/flavor.dart';

/// This class models the Environment objects
/// to each environment

abstract class AppEnvironment {
  /// API Url
  String get baseApiUrl;

  /// App title
  String get appName;

  /// Environment flavor
  Flavor get flavor;
}
