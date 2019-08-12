// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedItem _$FeedItemFromJson(Map<String, dynamic> json) {
  return FeedItem(
      json['type'] as String,
      json['title'] as String,
      json['description'] as String,
      json['promocode'] as String,
      json['terms'] as String,
      json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      json['videoPath'] as String);
}

Map<String, dynamic> _$FeedItemToJson(FeedItem instance) => <String, dynamic>{
      'type': instance.itemType,
      'title': instance.title,
      'description': instance.feedDescription,
      'promocode': instance.promotionCode,
      'terms': instance.promotionTerms,
      'image': instance.image,
      'videoPath': instance.videoPath
    };
