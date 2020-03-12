import 'package:flutter/material.dart';
import 'package:pomelo_flutter/data/feed/feed_item.dart';
import 'package:pomelo_flutter/ui/imgix_image_widget.dart';

class FeedUSPWidget extends StatelessWidget {
  final FeedItem feedItem;

  FeedUSPWidget({Key key, @required this.feedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: AspectRatio(
            aspectRatio: 375 / 81,
            child: ImgixImageWidget(imageUrl: feedItem.image.url),
          ),
//    height: uspImageHeight,
        ),
        Container(height: 10,color: Colors.grey[400],)],
    );
  }
}
