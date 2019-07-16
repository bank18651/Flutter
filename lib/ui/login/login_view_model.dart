import 'package:dio/dio.dart';
import 'package:pomelo_flutter/data/authentication_token.dart';
import 'package:pomelo_flutter/data/source/users_repository.dart';
import 'package:pomelo_flutter/shared_prefs_helper.dart';
import 'package:pomelo_flutter/ui/login/login_navigator.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel {
  final LoginNavigator _loginNavigator;

  final UsersRepository _usersRepository;
  
  final SharedPrefsHelper _sharedPrefsHelper;

  BehaviorSubject<bool> _loadingVisibility;

  PublishSubject<String> _errorMessage;

  Stream<bool> get loadingVisibility => _loadingVisibility;

  Stream<String> get errorMessage => _errorMessage;

  LoginViewModel(this._loginNavigator, this._usersRepository, this._sharedPrefsHelper) {
    _loadingVisibility = BehaviorSubject.seeded(false);
    _errorMessage = PublishSubject();
  }

  Future<void> handleLoginClicked(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      return;
    }

    _errorMessage.add(null);
    _loadingVisibility.add(true);

    print("handleLoginClicked");
  }

  Future<void> handleGuestModeClicked() async {
    _errorMessage.add(null);
    _loadingVisibility.add(true);

    try {
      final AuthenticationToken authToken =
          await _usersRepository.guestMode();

      _sharedPrefsHelper.saveAccessToken(authToken.accessToken);
      _loginNavigator.navigateToHomePage();
    } on DioError catch (e) {
      String errorMessage =
          e.response?.data == null ? null : e.response.data['message'];
      if (errorMessage?.isNotEmpty == true) {
        _errorMessage.add(errorMessage);
      } else {
        _errorMessage.add(e.message);
      }
    } finally {
      _loadingVisibility.add(false);
    }
  }

}