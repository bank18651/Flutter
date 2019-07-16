// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationToken _$AuthenticationTokenFromJson(Map<String, dynamic> json) {
  return AuthenticationToken(
      json['access_token'] as String);
}

Map<String, dynamic> _$AuthenticationTokenToJson(
        AuthenticationToken instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken
    };