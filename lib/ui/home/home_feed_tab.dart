import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:pomelo_flutter/ui/home/home_view_model.dart';


class FeedTabWidget extends StatefulWidget {
  final HomeViewModel viewModel;

  FeedTabWidget({Key key, @required this.viewModel}) : super(key: key);

  @override
  _FeedTabState createState() => _FeedTabState();
  }

class _FeedTabState extends State<FeedTabWidget> {
  List<StreamSubscription> _subscriptions = List();
  bool _isFeed = true;

  @override
  void dispose() {
    _subscriptions.clear();
    super.dispose();
  }

@override
  void initState() {
    super.initState();
    
    _subscriptions.add(
      widget.viewModel.isFeed.listen((isFeed) {
        print('listen valuessss = $isFeed');
        setState(() {
          _isFeed = isFeed;
        });
      }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true,
        delegate: _SliverAppBarDelegate(
            minHeight: 42,
            maxHeight: 42,
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () => widget.viewModel.onFeedTabClicked(true),
                      child: Container(
                        height: double.infinity,
                        color: _isFeed
                            ? Colors.white
                            : Color.fromRGBO(211, 211, 211, 1),
                        child: Center(
                          child: Text('Discover'.toUpperCase(),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () => widget.viewModel.onFeedTabClicked(false),
                      child: Container(
                        height: double.infinity,
                        color: !_isFeed
                            ? Colors.white
                            : Color.fromRGBO(211, 211, 211, 1),
                        child: Center(
                          child: Text(
                            'Lookbooks'.toUpperCase(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
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
