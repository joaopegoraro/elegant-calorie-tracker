import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class InternetConnectionCheckerNetworkInfo implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  InternetConnectionCheckerNetworkInfo(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
