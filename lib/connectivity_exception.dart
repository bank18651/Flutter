import 'dart:io';

class ConnectivityException extends IOException {
  @override
  String toString() =>
      'No internet connection. Please check your WiFi or mobile data.';
}
