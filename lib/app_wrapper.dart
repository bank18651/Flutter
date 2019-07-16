import 'dart:async';

import 'package:flutter/material.dart';

import 'inherited_widget.dart';
import 'shared_prefs_helper.dart';
import 'di/injector.dart';

///
///  This is created as a wrapper for root widget
class AppWrapper extends StatefulWidget {
  final Widget rootWidget;

  const AppWrapper({@required this.rootWidget});

  @override
  _AppWrapperState createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  final List<StreamSubscription> _subscriptions = List();
  final SharedPrefsHelper _sharedPrefsHelper =
      Injector().provideSharedPrefsHelper;
  Key _key = new UniqueKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _subscriptions.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      key: _key,
      child: widget.rootWidget,
    );
  }
}
