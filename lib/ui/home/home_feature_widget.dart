import 'package:flutter/material.dart';
import 'package:pomelo_flutter/data/feed_feature.dart';

class FeatureItemWidget extends StatelessWidget {
  final FeedFeature featureItem;

  FeatureItemWidget({Key key, @required this.featureItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(featureItem.title);
  }
}