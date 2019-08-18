import 'package:json_annotation/json_annotation.dart';
import 'package:pomelo_flutter/data/feed_feature.dart';
import 'package:pomelo_flutter/data/image.dart';

part 'feed_item.g.dart';

@JsonSerializable()
class FeedItem {
  @JsonKey(name: 'type')
  final String itemType;
  @JsonKey(includeIfNull: true)
  final String title;
  @JsonKey(name: 'description')
  @JsonKey(includeIfNull: true)
  final String feedDescription;
  @JsonKey(name: 'promocode')
  final String promotionCode;
  @JsonKey(name: 'terms')
  final String promotionTerms;
  final Image image;
  final String videoPath;

  FeedItem(
      this.itemType,
      this.title,
      this.feedDescription,
      this.promotionCode,
      this.promotionTerms,
      this.image,
      this.videoPath,
      );

  factory FeedItem.fromJson(Map<String, dynamic> json) =>
      _$FeedItemFromJson(json);

  Map<String, dynamic> toJson() => _$FeedItemToJson(this);

  static const feedSqureType = 'square';
  static const feedCollectionType = 'collection';
  static const feedLandscapeType = 'landscape';
  static const feedGalleryType = 'gallery';
  static const feedPromotionType = 'promotion';
  static const feedUSPType = 'usp';
}


