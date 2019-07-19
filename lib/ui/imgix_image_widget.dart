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
        print(
            '${AppConfig.imgixBaseUrl}/$imageUrl?auto=compress&?w=${constraints.maxWidth}&h=${constraints.maxHeight}&dpr=$devicePixelRatio');
        return Image.network(
            '${AppConfig.imgixBaseUrl}/$imageUrl?auto=compress&?w=${constraints.maxWidth}&h=${constraints.maxHeight}&dpr=$devicePixelRatio');
      },
    );
  }
}
