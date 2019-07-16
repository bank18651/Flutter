import 'package:flutter/material.dart';
import 'package:pomelo_flutter/ui/home/home_page.dart';

class LoginNavigator {
  final BuildContext _context;

  LoginNavigator(this._context);

  void navigateToHomePage() {
    Navigator.pushReplacement(_context,
        MaterialPageRoute(builder: (context) => HomePage()));
  }
}