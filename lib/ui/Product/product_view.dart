import 'package:flutter/material.dart';
import 'product_view_model.dart';
class ProductPage extends StatefulWidget {

  final int productID;

  ProductPage({Key key, @required this.productID}) : super(key: key);

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
        child: FutureBuilder<List<ProductSection>>(
          future: viewModel.sections,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final sections = snapshot.data;
              return ListView.builder(
                  itemCount: sections.length,
                  itemBuilder: (BuildContext context, int index) {
                    switch (sections[index].sectionType) {
                      case ProductSectionType.slider:
                        return Container(
                          decoration: BoxDecoration(color: Colors.red),
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          child: ProductSliderWidget(['1', '2']),
                        );
                      default: return Container();
                  }
              });
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

class ProductSliderWidget extends StatelessWidget {

  final List<String> imagePaths;
  ProductSliderWidget(this.imagePaths);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              final imagePath = imagePaths[index];
              return ProductSliderItemWidget(imagePath);
        }),
      );
  }
}

class ProductSliderItemWidget extends StatelessWidget {
  final String text;
  ProductSliderItemWidget(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Text('$text'),
      decoration: BoxDecoration(color: Colors.yellow),
    );
  }
}