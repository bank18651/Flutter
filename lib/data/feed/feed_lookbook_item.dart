import 'package:json_annotation/json_annotation.dart';
import 'package:pomelo_flutter/data/image.dart';
import 'package:pomelo_flutter/data/feed/feed_cta.dart';
part 'feed_lookbook_item.g.dart';

@JsonSerializable()
class FeedLookbookItem {
  final String title;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  final Image image;
  final FeedCTA cta;

  FeedLookbookItem(
      this.title,
      this.releaseDate,
      this.image,
      this.cta,
      );

  factory FeedLookbookItem.fromJson(Map<String, dynamic> json) =>
      _$FeedLookbookItemFromJson(json);

  Map<String, dynamic> toJson() => _$FeedLookbookItemToJson(this);
}