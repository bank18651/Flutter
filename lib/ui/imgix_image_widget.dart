import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../app_config.dart';

class ImgixImageWidget extends StatelessWidget {
  final String imageUrl;

  ImgixImageWidget({@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
        return CachedNetworkImage(
            placeholder: (context, url) => CircularProgressIndicator(),
            imageUrl:
                '${AppConfig.imgixBaseUrl}/$imageUrl?auto=compress&?w=${constraints.maxWidth}&h=${constraints.maxHeight}&dpr=$devicePixelRatio',
            imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                  ),
                ),
            errorWidget: (context, url, error) => Icon(Icons.error));
      },
    );
  }
}
