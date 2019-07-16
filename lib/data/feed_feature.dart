import 'package:json_annotation/json_annotation.dart';

part 'feed_feature.g.dart';

@JsonSerializable()
class FeedFeature {
  final String title;
  @JsonKey(name: 'image.path')
  final String imagePath;

  FeedFeature(
      this.title,
      this.imagePath,
      );

  factory FeedFeature.fromJson(Map<String, dynamic> json) =>
      _$FeedFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$FeedFeatureToJson(this);
}