import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pomelo_flutter/data/feed/feed.dart';
import 'package:pomelo_flutter/data/feed/feed_feature.dart';
import 'package:pomelo_flutter/data/feed/feed_item.dart';
import 'package:pomelo_flutter/data/feed/feed_lookbook_item.dart';
import 'package:pomelo_flutter/di/injector.dart';
import 'package:pomelo_flutter/ui/error_dialog.dart';
import 'package:pomelo_flutter/ui/home/home_feature_widget.dart';
import 'package:pomelo_flutter/ui/home/home_feed_landscape.dart';
import 'package:pomelo_flutter/ui/home/home_feed_promotion.dart';
import 'package:pomelo_flutter/ui/home/home_feed_square.dart';
import 'package:pomelo_flutter/ui/home/home_feed_tab.dart';
import 'package:pomelo_flutter/ui/home/home_view_model.dart';
import 'package:pomelo_flutter/app_route.dart';
import 'package:pomelo_flutter/ui/home/home_lookbook_widget.dart';
import 'home_feed_usp.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel _viewModel;
  List<StreamSubscription> _subscriptions = List();
  bool _isFeed = true;


  productTapCallBack(productID) {
    _goToProductDetail(context, productID);
  }

  @override
  void initState() {
    super.initState();
    print('Test log');
    _viewModel = HomeViewModel(Injector().provideFeedRepository);
    _subscriptions.add(
        _viewModel.errorMessage.listen((message) => _showErrorDialog(message)));
    _subscriptions.add(_viewModel.isFeed.listen((isFeed) => _setFeedState(isFeed)));
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
              List<FeedLookbookItem> lookbookItems = snapShot.data.collections == null ? [] : snapShot.data.collections.toList();
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
                            onTap: () => _goToCategoryDetail(context, features[index].cta.id),
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
                  _isFeed ?
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
                        return FeedLandScapeWidget(feedItem: item, callback: productTapCallBack,);
                      } else if (item.itemType.toLowerCase() == FeedItem.feedPromotionType) {
                        return FeedPromotionWidget(feedItem: item,);
                      }
                      return Container(
                        height: 0,
                      );
                    },
                    childCount: feedItems.length,
                  )) : SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              FeedLookbookItem lookbook = lookbookItems[index];
                          return HomeLookbookWidget(lookbook);
                        },
                        childCount: lookbookItems.length,
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

  _setFeedState(bool isFeed) {
    setState(() {
      _isFeed = isFeed;
    });
  }

  _goToCategoryDetail(BuildContext context, int id) {
    Navigator.of(context).pushNamed(AppRoute.categoryDetail, arguments: id);
    print(id);
  }

  _goToProductDetail(BuildContext context, int id) {
    Navigator.pushNamed(context, AppRoute.product, arguments: id);
//    Navigator.of(context).pushNamed(AppRoute.product, arguments: id);
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
