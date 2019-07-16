import 'package:json_annotation/json_annotation.dart';
import 'package:pomelo_flutter/data/feed_feature.dart';

part 'feed.g.dart';

@JsonSerializable()
class Feed {
  @JsonKey(name: 'featured')
  final List<FeedFeature> features;

  Feed(
      this.features,
      );

  factory Feed.fromJson(Map<String, dynamic> json) =>
      _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);
}