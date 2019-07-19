import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            List<FeedFeature> features = snapShot.data.features.where((e) => e.title.isNotEmpty && e.image.url.isNotEmpty).toList();
            return snapShot.hasData
                ? ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: <Widget>[
                      SizedBox(
                        height: 140,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => FeatureItemWidget(
                            featureItem: features[index],
                          ),
                          itemCount: features.length,
                        ),
                      )
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
