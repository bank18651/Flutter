import 'package:flutter/material.dart';

class CategoryDetailPage extends StatefulWidget {

  final int categoryID;

  CategoryDetailPage({Key key, @required this.categoryID}) : super(key: key);
  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetailPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('Category Detail'),
      ),
      body: Text('${widget.categoryID}'),
    );
  }
}

class CategoryDetailArguments {
  int id;
}