// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pomelo_flutter/ui/home/home_page.dart';
import 'di/injector.dart';
import 'ui/login/login_page.dart';
import 'shared_prefs_helper.dart';
import 'app_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final SharedPrefsHelper _sharedPrefsHelper =
      Injector().provideSharedPrefsHelper;
  static final ThemeData meterialThemeData = ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.white,
      buttonColor: Colors.black,
      textTheme:
          TextTheme(button: TextStyle(color: Colors.white, fontSize: 12)),
      dialogTheme: DialogTheme(backgroundColor: Colors.white),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        height: 45,
        buttonColor: Colors.black,
        disabledColor: Colors.grey,
        splashColor: Colors.grey,
      ));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // android: (_) => MaterialAppData(theme: meterialThemeData),
        title: 'Pomelo Fashion',
        home: FutureBuilder<List<String>>(
            future: Future.wait([_sharedPrefsHelper.getAccessToken()]),
            builder: (context, snapshot) {
              List<String> data = snapshot.data;
              if (data == null) {
                return Container();
              } else {
                String accessToken = data[0];

                if (accessToken == null || accessToken.isEmpty) {
                  return LoginPage();
                } else {
                  return HomePage();
                }
              }
            }),
        routes: <String, WidgetBuilder>{
          AppRoute.login: (context) => LoginPage(),
          AppRoute.home: (context) => HomePage(),
        });
  }
}
