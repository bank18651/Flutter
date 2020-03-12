import 'package:pomelo_flutter/data/source/api/feed_services.dart';
import 'package:pomelo_flutter/data/source/api/user_services.dart';
import 'package:pomelo_flutter/data/source/feed_repository.dart';
import 'package:pomelo_flutter/data/source/users_repository.dart';
import 'package:pomelo_flutter/di/network_Injector.dart';

import '../shared_prefs_helper.dart';

class Injector {
  static final Injector _singleton = Injector._internal();

  static SharedPrefsHelper _sharedPrefsHelper;

  static UserServices _userServices;

  static UsersRepository _usersRepository;

  static FeedServices _feedServices;

  static FeedRepository _feedRepository;

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  SharedPrefsHelper get provideSharedPrefsHelper {
    if (_sharedPrefsHelper == null) {
      _sharedPrefsHelper = SharedPrefsHelper();
    }
    return _sharedPrefsHelper;
  }

  UserServices get provideUserServices {
    if (_userServices == null) {
      _userServices = UserServices(NetworkInjector().provideHttpClient);
    }
    return _userServices;
  }

  UsersRepository get provideUsersRepository {
    if (_usersRepository == null) {
      _usersRepository = UsersRepository(this.provideUserServices);
    }
    return _usersRepository;
  }

  FeedServices get provideFeedServices {
    if (_feedServices == null) {
      _feedServices = FeedServices(NetworkInjector().provideHttpClient);
    }
    return _feedServices;
  }

  FeedRepository get provideFeedRepository {
    if (_feedRepository == null) {
      _feedRepository = FeedRepository(this.provideFeedServices);
    }
    return _feedRepository;
  }
}