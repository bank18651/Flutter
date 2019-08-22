import 'package:json_annotation/json_annotation.dart';
import 'package:pomelo_flutter/data/image.dart';
import 'package:pomelo_flutter/data/feed/product_badge.dart';
import 'package:pomelo_flutter/data/feed/product_price.dart';
import 'package:pomelo_flutter/data/feed/product_stock.dart';

part 'product_item.g.dart';

@JsonSerializable()
class ProductItem {
  @JsonKey(name: 'id_product', disallowNullValue: true)
  final double productID;
  final String name;
  final ProductStock stock;
  @JsonKey(name: 'is_back_in_stock', defaultValue: false)
  final bool isBackInStock;
  final ProductPrice price;
  final ProductBadge badge;
  @JsonKey(name: 'metadata')
  final Image coverImage;

  ProductItem(this.productID, this.name, this.isBackInStock, this.stock,
      this.price, this.badge, this.coverImage);

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}
