import 'package:flutter/material.dart';
import 'package:pomelo_flutter/data/feed/product_item.dart';
import 'package:pomelo_flutter/ui/imgix_image_widget.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductItem productItem;

  ProductItemWidget({Key key, @required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.416,
      child: Column(
        children: <Widget>[
          AspectRatio(
              aspectRatio: 156 / 208,
              child: ImgixImageWidget(imageUrl: productItem.coverImage?.coverImagePath)),
        ],
      ),
    );
  }
}
