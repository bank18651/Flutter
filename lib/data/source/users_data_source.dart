import '../authentication_token.dart';

abstract class UserDataSource {
  Future<AuthenticationToken> guestMode();
}
