import 'users_data_source.dart';
import 'api/user_services.dart';
import '../authentication_token.dart';

class UsersRepository implements UserDataSource {
  final UserServices _userServices;

  UsersRepository(this._userServices);

  @override
  Future<AuthenticationToken> guestMode() {
    return this._userServices.guestMode();
  }
}