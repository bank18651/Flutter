import 'package:json_annotation/json_annotation.dart';

part 'authentication_token.g.dart';

@JsonSerializable()
class AuthenticationToken {
  @JsonKey(name: "access_token")
  final String accessToken;

  AuthenticationToken(this.accessToken);

  factory AuthenticationToken.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationTokenToJson(this);
}
