import 'package:flutter/material.dart';
import 'package:pomelo_flutter/data/feed/feed_lookbook_item.dart';
import 'package:pomelo_flutter/ui/imgix_image_widget.dart';

class HomeLookbookWidget extends StatelessWidget {
  final FeedLookbookItem lookbook;

  HomeLookbookWidget(this.lookbook);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 4 / 3,
                child: ImgixImageWidget(imageUrl: lookbook.image.url),
              ),
              SizedBox(height: 8),
              Text(lookbook.title),
              SizedBox(height: 8),
              Text(lookbook.releaseDate),
            ],
          ),
        ),
        Container(
          height: 10,
          decoration:
          BoxDecoration(color: Color.fromRGBO(211, 211, 211, 1)),
        )
      ],
    );
  }
}
