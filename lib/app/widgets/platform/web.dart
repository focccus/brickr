import 'package:flutter/material.dart';

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
    return Image.network(
      url,
      errorBuilder: errorWidget,
      width: width,
      height: height,
    );
  }
}
