import 'package:dio/dio.dart';

import 'app_state.dart';
import 'data/authentication_token.dart';
import 'data/source/api/user_services.dart';
import 'shared_prefs_helper.dart';

class AuthorizationInterceptor extends Interceptor {
  final Dio _httpClient;
  final UserServices _userServices;
  final SharedPrefsHelper _sharedPrefsHelper;

  AuthorizationInterceptor(this._httpClient, this._userServices, this._sharedPrefsHelper);

  @override
  onRequest(RequestOptions options) async {
    final String accessToken = await _sharedPrefsHelper.getAccessToken();
    if (accessToken?.isNotEmpty == true) {
      options.headers['authorization'] = 'bearer $accessToken';
      options.headers['x-platform'] = 'IOS 1.11.9';
      print('Attached access token to headers successfully');
      print('bearer $accessToken');
    }

    return options;
  }

  @override
  onError(DioError error) async {
    if (error.response?.data != null) {
      final int statusCode = error.response?.data['statusCode'] as int;
      final String message = error.response?.data['message'] as String;
      // Check if token expired
      // if (statusCode == 404 && (message == null || message.isEmpty)) {
      //   // Block incoming requests until the token updated
      //   _httpClient.interceptors.requestLock.lock();
      //   _httpClient.interceptors.responseLock.lock();
      //   _httpClient.interceptors.errorLock.lock();

      //   List<String> tokens = await Future.wait(
      //       [_sharedPrefsHelper.getAccessToken(), _sharedPrefsHelper.getRefreshToken()]);
      //   final String accessToken = tokens[0];
      //   final String refreshToken = tokens[1];

      //   final RequestOptions options = error.response.request;

      //   if (accessToken?.isNotEmpty == true &&
      //       refreshToken?.isNotEmpty == true) {
      //     // Check whether the failed request's access token is the same
      //     // with the saved access token
      //     final String authHeader = options.headers['authorization'] as String;
      //     final String attachingAccessToken =
      //         authHeader == null ? null : authHeader.split(' ')[1];
      //     if (accessToken == attachingAccessToken) {
      //       // Request a new authentication token
      //       // We use a new Dio(to avoid dead lock) instance to request token
      //       try {
      //         AuthenticationToken authToken =
      //             await _userServices.refreshToken(accessToken, refreshToken);
      //         _sharedPrefsHelper.saveAccessToken(authToken.accessToken);
      //         _sharedPrefsHelper.saveRefreshToken(authToken.refreshToken);
      //       } on DioError catch (e) {
      //         // Check for expired refresh token
      //         if (e.response?.statusCode == 400) {
      //           AppState.isRefreshTokenExpiredSubject.add(true);
      //         }

      //         return e;
      //       }
      //     }
      //   }
      //   _httpClient.interceptors.requestLock.unlock();
      //   _httpClient.interceptors.responseLock.unlock();
      //   _httpClient.interceptors.errorLock.unlock();

      //   return _httpClient.request(options.path,
      //       data: options.data, options: options);
      // }
    }

    return error;
  }
}
