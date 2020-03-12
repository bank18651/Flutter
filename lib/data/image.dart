import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  @JsonKey(name: 'path')
  final String url;
  @JsonKey(name: 'cover_image_path')
  final String coverImagePath;

  Image(this.url, this.coverImagePath);

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
