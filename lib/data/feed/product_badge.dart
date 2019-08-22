import 'package:json_annotation/json_annotation.dart';

part 'product_badge.g.dart';

@JsonSerializable()
class ProductBadge {
  final String type;
  final String value;

  ProductBadge(
      this.type,
      this.value
      );

  factory ProductBadge.fromJson(Map<String, dynamic> json) =>
      _$ProductBadgeFromJson(json);

  Map<String, dynamic> toJson() => _$ProductBadgeToJson(this);
}