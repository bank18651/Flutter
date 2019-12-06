import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ProductViewModel {

  Future<PMLProduct> product;

  ProductViewModel(int productID) {
    product = getProductDetail(productID);
    print('gggg $productID');
  }

  Future<PMLProduct> getProductDetail(int productID)  async {
    final response = await http.get('https://docky-staging-api.pmlo.co/v2/products/$productID');
    return PMLProduct.fromJson(json.decode(response.body));
  }
}

class PMLProduct {
  final String name;

  PMLProduct({this.name});

  factory PMLProduct.fromJson(Map<String, dynamic> json) {
    return PMLProduct(
      name: json['name'],
    );
  }
}
