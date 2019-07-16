import 'package:flutter/material.dart';
import 'package:pomelo_flutter/data/feed_feature.dart';

class FeatureItemWidget extends StatelessWidget {
  final FeedFeature featureItem;

  FeatureItemWidget({Key key, @required this.featureItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(
      width: 120,
      height: double.infinity,
      child: 
      Container(padding: EdgeInsets.all(10),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
      Expanded(
        flex: 2,
        child: BlueBox()),
      Expanded(
        flex: 1,
        child: Wrap(
          children: <Widget>[
            Text(featureItem.title)
          ],
        ))
    ]))
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}