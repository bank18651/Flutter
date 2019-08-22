import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pomelo_flutter/data/feed.dart';
import 'package:pomelo_flutter/data/feed_feature.dart';
import 'package:pomelo_flutter/data/feed_item.dart';
import 'package:pomelo_flutter/di/injector.dart';
import 'package:pomelo_flutter/ui/error_dialog.dart';
import 'package:pomelo_flutter/ui/home/home_feature_widget.dart';
import 'package:pomelo_flutter/ui/home/home_feed_landscape.dart';
import 'package:pomelo_flutter/ui/home/home_feed_promotion.dart';
import 'package:pomelo_flutter/ui/home/home_feed_square.dart';
import 'package:pomelo_flutter/ui/home/home_feed_tab.dart';
import 'package:pomelo_flutter/ui/home/home_view_model.dart';

import 'home_feed_usp.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel _viewModel;
  List<StreamSubscription> _subscriptions = List();

  @override
  void initState() {
    super.initState();
    print('Test log');
    _viewModel = HomeViewModel(Injector().provideFeedRepository);
    _subscriptions.add(
        _viewModel.errorMessage.listen((message) => _showErrorDialog(message)));
  }

  @override
  void dispose() {
    _subscriptions.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: FutureBuilder<Feed>(
          future: _viewModel.getFeedItems(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              List<FeedFeature> features = snapShot.data.features
                  .where((e) => e.title.isNotEmpty && e.image.url.isNotEmpty)
                  .toList();
              List<FeedItem> feedItems = snapShot.data.feedItems.toList();
              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    expandedHeight: 120.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => _goToCategoryDetail(features[index].cta.id),
                            child:  FeatureItemWidget(
                              featureItem: features[index],
                            ),
                          ),
                          itemCount: features.length,
                        ),
                      ),
                    ),
                  ),
                  FeedTabWidget(viewModel: _viewModel),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final item = feedItems[index];
                      if (item.itemType.toLowerCase() == FeedItem.feedUSPType) {
                        return FeedUSPWidget(
                          feedItem: item,
                        );
                      } else if (item.itemType.toLowerCase() == FeedItem.feedSqureType) {
                        return FeedSquareWidget(feedItem: item,);
                      } else if (item.itemType.toLowerCase() == FeedItem.feedLandscapeType) {
                        return FeedLandScapeWidget(feedItem: item,);
                      } else if (item.itemType.toLowerCase() == FeedItem.feedPromotionType) {
                        return FeedPromotionWidget(feedItem: item,);
                      }
                      return Container(
                        height: 0,
                      );
                    },
                    childCount: feedItems.length,
                  ))
                ],
              );
            }
            return Center(
              child: CupertinoActivityIndicator(),
            );
          },
        ));
  }
  
  _goToCategoryDetail(int id) {
    print(id);
  }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return ErrorDialog(
            message: message,
          );
        });
  }
}

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate({
//     @required this.minHeight,
//     @required this.maxHeight,
//     @required this.child,
//   });
//   final double minHeight;
//   final double maxHeight;
//   final Widget child;
//   @override
//   double get minExtent => minHeight;
//   @override
//   double get maxExtent => math.max(maxHeight, minHeight);
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return new SizedBox.expand(child: child);
//   }

//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return maxHeight != oldDelegate.maxHeight ||
//         minHeight != oldDelegate.minHeight ||
//         child != oldDelegate.child;
//   }
// }
