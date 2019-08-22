import 'package:json_annotation/json_annotation.dart';

part 'product_price.g.dart';

@JsonSerializable()
class ProductPrice {
  @JsonKey(name: 'original_price')
  final double originalPrice;
  @JsonKey(name: 'original_price_formatted')
  final String originalPriceFormatted;
  @JsonKey(name: 'discounted_price')
  final double discountedPrice;
  @JsonKey(name: 'discounted_price_formatted')
  final String discountedPriceFormatted;

  ProductPrice(
      this.originalPrice,
      this.originalPriceFormatted,
      this.discountedPrice,
      this.discountedPriceFormatted
      );

  factory ProductPrice.fromJson(Map<String, dynamic> json) =>
      _$ProductPriceFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPriceToJson(this);
}