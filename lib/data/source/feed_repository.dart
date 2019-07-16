import 'package:pomelo_flutter/data/feed.dart';
import 'package:pomelo_flutter/data/source/api/feed_services.dart';

import 'feed_data_source.dart';

class FeedRepository implements FeedDataSource {
  final FeedServices _feedServices;

  FeedRepository(this._feedServices);

  @override
  Future<Feed> getFeed() {
    return this._feedServices.getFeed();
  }
}