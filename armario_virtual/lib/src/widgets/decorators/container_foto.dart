import 'package:flutter/material.dart';

class ContainerFoto extends StatelessWidget {
  final Widget child;
  final String image;

  const ContainerFoto({
    super.key,
    required this.child,
    this.width,
    this.height,
    required this.image,
    this.boxFit = BoxFit.fitHeight
  });

  final double? width;
  final double? height;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/$image'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
