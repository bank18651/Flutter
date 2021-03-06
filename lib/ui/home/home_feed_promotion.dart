import 'package:flutter/material.dart';
import 'package:pomelo_flutter/data/feed/feed_item.dart';
import 'package:pomelo_flutter/ui/imgix_image_widget.dart';

class FeedPromotionWidget extends StatelessWidget {
  final FeedItem feedItem;

  FeedPromotionWidget({Key key, @required this.feedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 4/3,
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
              ),
            ],
          ),
        ),
        Container(height: 10,color: Colors.grey[400],)],
    );
  }
}
