import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pomelo_flutter/authorization_interceptor.dart';

import '../app_config.dart';
import '../connectivity_interceptor.dart';
import 'injector.dart';

class NetworkInjector {
  static final NetworkInjector _singleton = NetworkInjector._internal();

  static Dio _httpClient;

  factory NetworkInjector() {
    return _singleton;
  }

  NetworkInjector._internal();

  Dio get provideHttpClient {
    if (_httpClient == null) {
      _httpClient = Dio(BaseOptions(
          baseUrl: AppConfig.pomeloApiBaseUrl,
          connectTimeout: 30000,
          receiveTimeout: 5000));

      // Logging interceptor
      if (AppConfig.appFlavor == Flavor.LABS ||
          AppConfig.appFlavor == Flavor.STAGING) {
        _httpClient.interceptors.add(LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        ));
      }

      _httpClient.interceptors.add(ConnectivityInterceptor());
      _httpClient.interceptors.add(AuthorizationInterceptor(_httpClient,
          Injector().provideUserServices, Injector().provideSharedPrefsHelper));
    }

    return _httpClient;
  }
}
