import 'package:flutter/material.dart';

/// Custom image widget that loads an image as a static asset.
class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imageUrl,this.assetImage=true, this.width, this.height, this.fit, this.color});
  final String imageUrl;
  final bool assetImage;
  final double? width,height;
  final BoxFit? fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    // TODO: Use [CachedNetworkImage] if the url points to a remote resource
    return assetImage? Image.asset(imageUrl,width: width,height: height,fit:fit,color: color,) : Image.network(imageUrl,width: width,height: height,fit:fit,);

  }
}
