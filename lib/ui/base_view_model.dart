import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel {
  BehaviorSubject<bool> _loadingVisibility;

  PublishSubject<String> _errorMessage;

  Stream<bool> get loadingVisibility => _loadingVisibility;

  Stream<String> get errorMessage => _errorMessage;

  BaseViewModel() {
    _loadingVisibility = BehaviorSubject.seeded(false);
    _errorMessage = PublishSubject();
  }

  void addErrorMessage(String text) {
    _errorMessage.add(text);
  }

  void addLoadVisibility(bool isVisible) {
    _loadingVisibility.add(isVisible);
  }
}
