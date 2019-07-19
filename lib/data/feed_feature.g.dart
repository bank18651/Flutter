// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedFeature _$FeedFeatureFromJson(Map<String, dynamic> json) {
  return FeedFeature(
      json['title'] as String,
      json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>));
}

Map<String, dynamic> _$FeedFeatureToJson(FeedFeature instance) =>
    <String, dynamic>{'title': instance.title, 'image': instance.image};
