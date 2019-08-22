import 'package:json_annotation/json_annotation.dart';
part 'feed_cta.g.dart';

@JsonSerializable()
class FeedCTA {
  final String type;
  final int id;
  final String name;

  FeedCTA(this.type, this.id, this.name);

  factory FeedCTA.fromJson(Map<String, dynamic> json) =>
      _$FeedCTAFromJson(json);

  Map<String, dynamic> toJson() => _$FeedCTAToJson(this);

}