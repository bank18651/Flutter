import 'package:flutter/material.dart';
import 'package:pomelo_flutter/data/feed_feature.dart';
import 'package:pomelo_flutter/ui/imgix_image_widget.dart';

class FeatureItemWidget extends StatelessWidget {
  final FeedFeature featureItem;

  FeatureItemWidget({Key key, @required this.featureItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.5, 18, 8.5, 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 65,
            child: AspectRatio(
              aspectRatio: 1,
              child: ImgixImageWidget(imageUrl: featureItem.image.url),
            ),
          ),
          SizedBox(height: 6.2),
          Text(
            featureItem.title,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
