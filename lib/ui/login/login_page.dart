import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'login_view_model.dart';
import 'login_navigator.dart';
import '../../di/injector.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final List<StreamSubscription> _subscriptions = List();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginViewModel _viewModel;
  String _errorMessage;
  bool _obscureText = true;
  bool _loadingVisibility = false;

  @override
  void initState() {
    super.initState();
    _viewModel = LoginViewModel(LoginNavigator(context),
        Injector().provideUsersRepository, Injector().provideSharedPrefsHelper);
    _subscriptions
        .add(_viewModel.loadingVisibility.listen((value) => setState(() {
              _loadingVisibility = value;
            })));
    _subscriptions.add(_viewModel.errorMessage.listen((value) => setState(() {
          _errorMessage = value;
        })));
  }

  @override
  void dispose() {
    _subscriptions.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text("Login"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Center(
                    child: Text(
                  'PomQ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ))),
            Expanded(
                flex: 2,
                child: SizedBox(
                  width: 360,
                  child: Wrap(
                    runSpacing: 16,
                    children: <Widget>[
                      SizedBox(
                        height: 45,
                        child: CupertinoTextField(
                          controller: _usernameController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          clearButtonMode: OverlayVisibilityMode.editing,
                          autocorrect: false,
                          focusNode: _usernameFocus,
                          placeholder: 'Email',
                          onSubmitted: (input) {
                            _usernameFocus.unfocus();
                            FocusScope.of(context).requestFocus(_passwordFocus);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        child: CupertinoTextField(
                          controller: _passwordController,
                          suffix: IconButton(
                              icon: Icon(_obscureText
                                  ? CupertinoIcons.eye_solid
                                  : CupertinoIcons.eye),
                              onPressed: () => setState(() {
                                    _obscureText = !_obscureText;
                                  })),
                          clearButtonMode: OverlayVisibilityMode.editing,
                          obscureText: _obscureText,
                          textInputAction: TextInputAction.done,
                          focusNode: _passwordFocus,
                          placeholder: 'Password',
                        ),
                      ),
                      Visibility(
                          visible: _errorMessage != null,
                          child: Text(
                            _errorMessage ?? '',
                            style: TextStyle(color: Colors.red),
                          )),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                            onPressed: _loadingVisibility
                                ? null
                                : () {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    _viewModel.handleLoginClicked(
                                        _usernameController.text,
                                        _passwordController.text);
                                  },
                            child: _loadingVisibility
                                ? CupertinoActivityIndicator()
                                : Text(
                                    "LOGIN",
                                    style: Theme.of(context).textTheme.button,
                                  )),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                            onPressed: _loadingVisibility
                                ? null
                                : () {
                                    _viewModel.handleGuestModeClicked();
                                  },
                            child: _loadingVisibility
                                ? CupertinoActivityIndicator()
                                : Text(
                                    "Guest Mode Login",
                                    style: Theme.of(context).textTheme.button,
                                  )),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
