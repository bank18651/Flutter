// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(json['path'] as String, json['cover_image_path'] as String);
}

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'path': instance.url,
      'cover_image_path': instance.coverImagePath
    };
