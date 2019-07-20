import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pomelo_flutter/data/feed.dart';
import 'package:pomelo_flutter/data/feed_feature.dart';
import 'package:pomelo_flutter/di/injector.dart';
import 'package:pomelo_flutter/ui/error_dialog.dart';
import 'package:pomelo_flutter/ui/home/home_feature_widget.dart';
import 'package:pomelo_flutter/ui/home/home_view_model.dart';

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
    _viewModel = HomeViewModel(Injector().provideFeedRepository);
    _subscriptions.add(
        _viewModel.errorMessage.listen((message) => _showErrorDialog(message)));
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
            List<FeedFeature> features = snapShot.data.features
                .where((e) => e.title.isNotEmpty && e.image.url.isNotEmpty)
                .toList();
            return snapShot.hasData
                ? CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        backgroundColor: Colors.green,
                        expandedHeight: 120.0,
                        flexibleSpace: FlexibleSpaceBar(
                          background: SizedBox(
                            height: 120,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  FeatureItemWidget(
                                featureItem: features[index],
                              ),
                              itemCount: features.length,
                            ),
                          ),
                        ),
                      ),
                      SliverPersistentHeader(
                          pinned: true,
                          delegate: _SliverAppBarDelegate(
                              minHeight: 42,
                              maxHeight: 42,
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: double.infinity,
                                        color: Colors.white,
                                        child: Center(
                                          child: Text('Discover'.toUpperCase(),
                                              textAlign: TextAlign.center),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: double.infinity,
                                        color: Color.fromRGBO(211, 211, 211, 1),
                                        child: Center(
                                          child: Text(
                                            'Lookbooks'.toUpperCase(),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ))),
                      SliverFixedExtentList(
                        itemExtent: 150.0,
                        delegate: SliverChildListDelegate(
                          [
                            Container(color: Colors.red),
                            Container(color: Colors.purple),
                            Container(color: Colors.green),
                            Container(color: Colors.orange),
                            Container(color: Colors.yellow),
                            Container(color: Colors.pink),
                          ],
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: CupertinoActivityIndicator(),
                  );
          },
        ));
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
