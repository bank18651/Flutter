import 'package:json_annotation/json_annotation.dart';
import 'package:pomelo_flutter/data/image.dart';

part 'product_stock.g.dart';

@JsonSerializable()
class ProductStock {
  final double quantity;
  @JsonKey(name: 'is_low_stock',defaultValue: false)
  final bool isLowStock;
  @JsonKey(name: 'is_sold_out',defaultValue: false)
  final bool isSoldOut;

  ProductStock(
      this.quantity,
      this.isLowStock,
      this.isSoldOut
      );

  factory ProductStock.fromJson(Map<String, dynamic> json) =>
      _$ProductStockFromJson(json);

  Map<String, dynamic> toJson() => _$ProductStockToJson(this);
}