import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'network_image.dart';

class CustomImage extends StatelessWidget {
  final String url;

  final Widget Function(BuildContext, Object, dynamic) errorWidget;

  final double width;
  final double height;
  final bool cached;

  const CustomImage(
    this.url, {
    Key key,
    this.errorWidget,
    this.width,
    this.height,
    this.cached = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cached != null && cached) {
      return CachedNetworkImage(
        imageUrl: url,
        errorWidget: errorWidget,
      );
    }

    return Image(
      image: NetworkImageWithRetry(url),
      errorBuilder: errorWidget,
      width: width,
      height: height,
    );
  }
}
