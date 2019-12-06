import 'package:flutter/material.dart';
import 'product_view_model.dart';
class ProductPage extends StatefulWidget {

  final int productID;

  const ProductPage({
    Key key,
    @required this.productID,
  }) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<ProductPage> {

  ProductViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = ProductViewModel(widget.productID);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
      ),
      body: Center(
        child: FutureBuilder<PMLProduct>(
          future: viewModel.product,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('${snapshot.data.name}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}