import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_tutors/utils/constants.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  final double height;
  final String imageUrl;
  ImageLoader({@required this.height, @required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      imageUrl: imageUrl,
      placeholder: Placeholder(),
      errorWidget: ErrorWidget(),
    );
  }
}

class Placeholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 2.0,
    );
  }
}

class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Images.noImagePlaceholder,
      height: 90.0,
    );
  }
}
