import 'package:flutter/material.dart';
import 'package:pomelo_flutter/data/feed_item.dart';
import 'package:pomelo_flutter/ui/imgix_image_widget.dart';

class FeedLandScapeWidget extends StatelessWidget {
  final FeedItem feedItem;

  FeedLandScapeWidget({Key key, @required this.feedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
