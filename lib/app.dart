// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
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
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
        ),
      ),
      title: "Pomelo Fashion",
      home: FutureBuilder<List<String>>(
          future: Future.wait([
            _sharedPrefsHelper.getAccessToken()
          ]),
          builder: (context, snapshot) {
            List<String> data = snapshot.data;
            if (data == null) {
              return Container();
            } else {
              String accessToken = data[0];

              if (accessToken == null ||
                  accessToken.isEmpty) {
                return LoginPage();
              } else {
                return HomePage();
              }
            }
          }),
      routes: <String, WidgetBuilder>{
        AppRoute.login: (context) => LoginPage(),
        AppRoute.home: (context) => HomePage(),
      },
    );
  }
}