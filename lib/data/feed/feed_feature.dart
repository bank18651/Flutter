import 'package:json_annotation/json_annotation.dart';
import 'package:pomelo_flutter/data/image.dart';

part 'feed_feature.g.dart';

@JsonSerializable()
class FeedFeature {
  final String title;
  final Image image;

  FeedFeature(
      this.title,
      this.image,
      );

  factory FeedFeature.fromJson(Map<String, dynamic> json) =>
      _$FeedFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$FeedFeatureToJson(this);
}