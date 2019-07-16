import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomelo_flutter/data/feed.dart';
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
    _subscriptions.add(_viewModel.errorMessage.listen((message) => _showErrorDialog(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: 
      AppBar(title: 
        Text("Home"),
      ),
      body: FutureBuilder<Feed>(
          future: _viewModel.getFeedItems(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        FeatureItemWidget(featureItem: snapshot.data.features[index]),
                    separatorBuilder: (context, index) =>
                        Divider(color: Colors.amber, height: 0),
                    itemCount: snapshot.data.features.length)
                : Center(
                    child: CupertinoActivityIndicator(),
                  );
          }),
    );
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