import 'package:json_annotation/json_annotation.dart';
import 'package:pomelo_flutter/data/feed_feature.dart';
import 'package:pomelo_flutter/data/feed_item.dart';

part 'feed.g.dart';

@JsonSerializable()
class Feed {
  @JsonKey(name: 'featured')
  final List<FeedFeature> features;
  final List<FeedItem> feedItems;

  Feed(
      this.features,
      this.feedItems
      );

  factory Feed.fromJson(Map<String, dynamic> json) =>
      _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);
}