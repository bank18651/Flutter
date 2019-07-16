import 'package:pomelo_flutter/data/feed.dart';
import 'package:pomelo_flutter/data/source/feed_repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel {
  PublishSubject<String> _errorMessage;

  final FeedRepository _feedRepository;

  Stream<String> get errorMessage => _errorMessage;
  
  HomeViewModel(this._feedRepository) {
    _errorMessage = PublishSubject();
  }

  Future<Feed> getFeedItems() {
    return _feedRepository.getFeed().then((Feed feed) {
      return feed;
    });
  }

}