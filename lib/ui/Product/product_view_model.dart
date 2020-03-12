import 'package:http/http.dart' as http;
import 'dart:convert';

enum ProductCellType {
 slider,
}

enum ProductSectionType {
  slider
}

class ProductViewModel {

//  Future<PMLProduct> product;
  PMLProduct product;
  Future<List<ProductSection>> sections;

  ProductViewModel(int productID) {
    setupSections(productID);
  }

  setupSections(int id) {
      sections = getProductSection(id);
  }

  Future<PMLProduct> getProductDetail(int productID)  async {
    final response = await http.get('https://docky-staging-api.pmlo.co/v2/products/$productID');
    return PMLProduct.fromJson(json.decode(response.body));
  }

  Future<List<ProductSection>> getProductSection(int productID) async {
    final response = await getProductDetail(productID);
    return [ProductSection(ProductSectionType.slider, [ProductCellType.slider])];
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

class ProductSection {

  final ProductSectionType sectionType;
  final List<ProductCellType> list;

  ProductSection(this.sectionType, this.list);
}

