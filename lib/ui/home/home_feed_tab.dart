import 'package:flutter/material.dart';
import 'dart:math' as math;

class FeedTab {
  final isFeed;
  final void Function() onFeedClicked;
  final void Function() onLookbookClicked;

  FeedTab(this.isFeed,this.onFeedClicked,this.onLookbookClicked);
}

class FeedTabWidget extends StatefulWidget {
  final FeedTab feedTab;

  FeedTabWidget({Key key, @required this.feedTab}) : super(key: key);

  @override
  _FeedTabState createState() => _FeedTabState();
}

class _FeedTabState extends State<FeedTabWidget> {
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
                    child: GestureDetector(
                      onTap: () => widget.feedTab.onFeedClicked,
                      child: Container(
                        height: double.infinity,
                        color: widget.feedTab.isFeed
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
                    child: GestureDetector(
                      onTap: () => widget.feedTab.onLookbookClicked,
                      child: Container(
                        height: double.infinity,
                        color: !widget.feedTab.isFeed
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
