import 'package:pomelo_flutter/data/feed.dart';
import 'package:pomelo_flutter/data/source/feed_repository.dart';
import 'package:pomelo_flutter/ui/home/home_feed_tab.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel {
  PublishSubject<String> _errorMessage;

  final FeedRepository _feedRepository;

  Stream<String> get errorMessage => _errorMessage;

  PublishSubject<bool> _isFeed = PublishSubject();
  Stream<bool> get isFeed => _isFeed;

  HomeViewModel(this._feedRepository) {
    _errorMessage = PublishSubject();
  }

  Future<Feed> getFeedItems() {
    return _feedRepository.getFeed().then((Feed feed) {
      return feed;
    });
  }

  void onFeedTabClicked(bool isFeed) {
    print('_onFeedClicked');
    _isFeed.add(isFeed);
    // _feedTab.add(getFeedTab());
  }

}
