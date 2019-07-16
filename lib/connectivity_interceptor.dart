import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'connectivity_exception.dart';

class ConnectivityInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw ConnectivityException();
    }

    return options;
  }
}
