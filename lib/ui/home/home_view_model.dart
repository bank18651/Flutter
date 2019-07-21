import 'package:pomelo_flutter/data/feed.dart';
import 'package:pomelo_flutter/data/source/feed_repository.dart';
import 'package:pomelo_flutter/ui/home/home_feed_tab.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel {
  PublishSubject<String> _errorMessage;

  final FeedRepository _feedRepository;

  Stream<String> get errorMessage => _errorMessage;

  PublishSubject<FeedTab> _feedTab = PublishSubject();

  Stream<FeedTab> get renderFeedTab => _feedTab;
  bool isFeed = true;
  FeedTab test;

  HomeViewModel(this._feedRepository) {
    _errorMessage = PublishSubject();
    _feedTab.add(getFeedTab());
    test = getFeedTab();
  }

  Future<Feed> getFeedItems() {
    return _feedRepository.getFeed().then((Feed feed) {
      return feed;
    });
  }

  FeedTab getFeedTab() {
    return FeedTab(isFeed, onFeedClicked, onLookbookClicked);
  }

  void onFeedClicked() {
    print('_onFeedClicked');
    isFeed = true;
    _feedTab.add(getFeedTab());
  }

  void onLookbookClicked() {
    print('_onLookbookClicked');
    isFeed = true;
    _feedTab.add(getFeedTab());
  }


}
