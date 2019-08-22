import 'package:json_annotation/json_annotation.dart';
import 'package:pomelo_flutter/data/image.dart';
import 'package:pomelo_flutter/data/feed/feed_cta.dart';

part 'feed_feature.g.dart';

@JsonSerializable()
class FeedFeature {
  final String title;
  final Image image;
  final FeedCTA cta;

  FeedFeature(
      this.title,
      this.image,
      this.cta,
      );

  factory FeedFeature.fromJson(Map<String, dynamic> json) =>
      _$FeedFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$FeedFeatureToJson(this);
}