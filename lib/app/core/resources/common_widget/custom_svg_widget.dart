import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgWidget extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final Color? color;
  final bool? isNetwork;

  const CustomSvgWidget({super.key, 
    required this.imagePath,
    this.width = 100,
    this.height = 100,
    this.color,
    this.isNetwork = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isNetwork == true
          ? SvgPicture.network(
        imagePath,
        width: width,
        height: height,
        fit: BoxFit.fill,
        color: color,
        placeholderBuilder: (context) => Icon(
          Icons.image_not_supported,
          color: Colors.grey,
          size: 50,
        ),
        errorBuilder: (context, error, stackTrace) => Icon(
          Icons.error,
          color: Colors.red,
          size: 50,
        ),
      )
          : SvgPicture.asset(
        imagePath,
        width: width,
        height: height,
        fit: BoxFit.fill,
        color: color,
        placeholderBuilder: (context) => Icon(
          Icons.image_not_supported,
          color: Colors.grey,
          size: 50,
        ),
        errorBuilder: (context, error, stackTrace) => Icon(
          Icons.error,
          color: Colors.red,
          size: 50,
        ),
      ),
    );
  }
}
