import 'package:flutter/material.dart';

class CategoryDetailPage extends StatefulWidget {

  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetailPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final int args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Category Detail'),
      ),
      body: Text('$args'),
    );
  }
}

class CategoryDetailArguments {
  int id;
}