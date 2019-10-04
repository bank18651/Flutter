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
              child: ImgixImageWidget(
                  imageUrl: productItem.coverImage?.coverImagePath)),
          Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Text(productItem.prices?.originalPriceFormatted ?? "0",
                          maxLines: 1),
                    ),
                    SizedBox(
                      width: 25,
                      height: 25,
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(Icons.star),
                        onPressed: () {
                          print("ggg");
                        },
                      ),
                    ),
                  ],
                ),
                Text(productItem.name, maxLines: 2)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
