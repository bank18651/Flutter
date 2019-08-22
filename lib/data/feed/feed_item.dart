import 'package:json_annotation/json_annotation.dart';
import 'package:pomelo_flutter/data/image.dart';
import 'package:pomelo_flutter/data/feed/product_item.dart';
import 'package:pomelo_flutter/data/video.dart';

part 'package:pomelo_flutter/data/feed/feed_item.g.dart';

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
  final Video video;
  final ProductItem productItem;

  FeedItem(this.itemType, this.title, this.feedDescription, this.promotionCode,
      this.promotionTerms, this.image, this.video, this.productItem);

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
