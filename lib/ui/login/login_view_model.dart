import 'package:dio/dio.dart';
import 'package:pomelo_flutter/data/authentication_token.dart';
import 'package:pomelo_flutter/data/source/users_repository.dart';
import 'package:pomelo_flutter/shared_prefs_helper.dart';
import 'package:pomelo_flutter/ui/base_view_model.dart';
import 'package:pomelo_flutter/ui/login/login_navigator.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel extends BaseViewModel {
  final LoginNavigator _loginNavigator;

  final UsersRepository _usersRepository;

  final SharedPrefsHelper _sharedPrefsHelper;

  LoginViewModel(
      this._loginNavigator, this._usersRepository, this._sharedPrefsHelper);

  Future<void> handleLoginClicked(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      return;
    }

    addErrorMessage(null);
    addLoadVisibility(true);

    print("handleLoginClicked");
  }

  Future<void> handleGuestModeClicked() async {
    addErrorMessage(null);
    addLoadVisibility(true);

    try {
      final AuthenticationToken authToken = await _usersRepository.guestMode();

      _sharedPrefsHelper.saveAccessToken(authToken.accessToken);
      _loginNavigator.navigateToHomePage();
    } on DioError catch (e) {
      String errorMessage =
          e.response?.data == null ? null : e.response.data['message'];
      if (errorMessage?.isNotEmpty == true) {
        addErrorMessage(errorMessage);
      } else {
        addErrorMessage(e.message);
      }
    } finally {
      addLoadVisibility(false);
    }
  }
}
