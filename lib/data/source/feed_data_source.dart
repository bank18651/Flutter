

import 'package:pomelo_flutter/data/feed/feed.dart';

abstract class FeedDataSource {
  Future<Feed> getFeed();
}
