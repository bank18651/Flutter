// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return Feed(
      (json['featured'] as List)
          ?.map((e) => e == null
              ? null
              : FeedFeature.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['feedItems'] as List)
          ?.map((e) =>
              e == null ? null : FeedItem.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'featured': instance.features,
      'feedItems': instance.feedItems
    };
