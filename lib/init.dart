import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app_wrapper.dart';
import 'app.dart';
import 'app_config.dart';

void init() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (AppConfig.appFlavor == Flavor.LABS) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone to report to
      // Crashlytics.
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };
  runZoned<Future<Null>>(() async {
    runApp(AppWrapper(rootWidget: MyApp()));
  }, onError: (error, stackTrace) async {
    String errorString = error.toString();
    String stackTraceString = stackTrace.toString();
    print('$errorString: $stackTraceString');
  });
}