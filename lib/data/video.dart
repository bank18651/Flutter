import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video {
  @JsonKey(name: 'path')
  final String url;

  Video(this.url);

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}