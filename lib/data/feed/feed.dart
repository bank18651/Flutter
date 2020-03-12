import 'package:json_annotation/json_annotation.dart';
import 'package:pomelo_flutter/data/feed/feed_feature.dart';
import 'package:pomelo_flutter/data/feed/feed_item.dart';
import 'package:pomelo_flutter/data/feed/feed_lookbook_item.dart';

part 'feed.g.dart';

@JsonSerializable()
class Feed {
  @JsonKey(name: 'featured')
  final List<FeedFeature> features;
  @JsonKey(name: 'feeds')
  final List<FeedItem> feedItems;
  @JsonKey(name: 'collections')
  final List<FeedLookbookItem> collections;

  Feed(
      this.features,
      this.feedItems,
      this.collections
      );

  factory Feed.fromJson(Map<String, dynamic> json) =>
      _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);
}