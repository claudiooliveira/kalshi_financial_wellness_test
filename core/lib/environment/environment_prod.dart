import 'package:core/environment/environment.dart';
import 'package:core/environment/flavor.dart';

class EnvProd extends AppEnvironment {
  @override
  String get baseApiUrl => 'http://localhost:3000';

  @override
  Flavor get flavor => Flavor.prod;

  @override
  String get appName => 'Kalshi';
}
