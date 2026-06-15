import 'package:flutter/material.dart';
import './container_foto.dart';

class ContainerPapelao extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  const ContainerPapelao({
    super.key,
    required this.child,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerFoto(
      width: width,
      height: height,
      image: 'images/papelao.png',
      child: child
    );
  }
}
