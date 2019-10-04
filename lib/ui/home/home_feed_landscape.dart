import 'package:flutter/material.dart';
import 'package:pomelo_flutter/data/feed/feed_item.dart';
import 'package:pomelo_flutter/ui/imgix_image_widget.dart';
import 'package:pomelo_flutter/ui/share/product_item_widget.dart';

class FeedLandScapeWidget extends StatelessWidget {
  final FeedItem feedItem;

  FeedLandScapeWidget({Key key, @required this.feedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 4 / 3,
                child: ImgixImageWidget(imageUrl: feedItem.image?.url),
              ),
              feedItem.title?.isNotEmpty ?? false
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        feedItem.title,
                        textAlign: TextAlign.center,
                      ),
                    )
                  : SizedBox(
                      height: 0,
                    ),
              feedItem.feedDescription?.isNotEmpty ?? false
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        feedItem.feedDescription,
                        textAlign: TextAlign.center,
                      ),
                    )
                  : SizedBox(
                      height: 0,
                    )
            ],
          ),
        ),
        feedItem.productItem.isNotEmpty
            ? SizedBox(
                height: screenWidth * (322 / 375),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Container(
                    color: Colors.white,
                    width: 6,
                  ),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: _onProductClick(),
                    child: ProductItemWidget(
                        productItem: feedItem.productItem[index]),
                  ),
                  itemCount: feedItem.productItem.length,
                ))
            : SizedBox(
                height: 0,
              ),
        Container(
          height: 10,
          color: Colors.grey[400],
        )
      ],
    );
  }

  _onProductClick() {
    print("asdasd");
  }
}
