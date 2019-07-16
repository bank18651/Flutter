import 'package:flutter/material.dart';

///
/// This is created to keep data and make it stay in whole application life cycle
/// or to broadcast data to a child without passing through each node of
/// the widget tree and a child having a reference on this data
/// will get notified when data gets updated as well.
///
class MyInheritedWidget extends InheritedWidget {
  const MyInheritedWidget({Key key, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return true;
  }
}
