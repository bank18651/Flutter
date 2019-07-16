

import 'package:pomelo_flutter/data/feed.dart';

abstract class FeedDataSource {
  Future<Feed> getFeed();
}
