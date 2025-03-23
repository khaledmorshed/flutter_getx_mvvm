import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAssetImageWidget extends StatelessWidget {
  const CustomAssetImageWidget({
    Key? key,
    required this.dynamicChild,
    this.height,
    this.width,
    this.color,
    this.scale,
    this.fit,
  }) : super(key: key);

  final dynamic dynamicChild;
  final double? height;
  final double? width;
  final Color? color;
  final double? scale;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return _getView();
  }

  Widget _getView() {
    String mimType = dynamicChild.split(".").last;
    String path = "images/$dynamicChild";

    if (mimType.isEmpty) {
      return Icon(
        dynamicChild,
        size: width,
        color: color,
      );
    }

    switch (mimType) {
      case "svg":
        return SvgPicture.asset(
          path,
          height: height,
          width: width,
          colorFilter: color == null? null: ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn),
          fit: fit ?? BoxFit.contain,
        );
      case "png":
      case "jpg":
      case "jpeg":
        return Image.asset(
          path,
          height: height,
          width: width,
          color: color,
          scale: scale,
        );
      default:
        return Icon(
          dynamicChild,
          size: width,
          color: color,
        );
    }
  }
}
