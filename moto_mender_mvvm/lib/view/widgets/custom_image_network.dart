import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({
    super.key,
    required this.imgPath,
    this.fit,
    this.width,
    this.height,
  });

  final String imgPath;
  final BoxFit? fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imgPath,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      // ON IMAGE ERROR
      errorBuilder: (context, error, stackTrace) {
        return SvgPicture.asset(
          'assets/image/svg/error.svg',
          height: 80,
          width: 80,
          fit: BoxFit.fill,
        );
      },
    );
  }
}
