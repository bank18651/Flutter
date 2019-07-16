import 'package:dio/dio.dart';
import '../../authentication_token.dart';

class UserServices {
  final Dio _httpClient;

  UserServices(this._httpClient);

  Future<AuthenticationToken> guestMode() async {
    final response = await _httpClient.post('v2/authentication/guest/',
        data: null,
        options: Options(responseType: ResponseType.json));
    return AuthenticationToken.fromJson(response.data);
  }
}