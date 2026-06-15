import 'package:armario_virtual/src/widgets/decorators/animator.dart';
import 'package:armario_virtual/src/widgets/decorators/container_papelao.dart';
import 'package:flutter/material.dart';

class BotaoPapelao extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double height;
  final double width;

  const BotaoPapelao({
    super.key,
    required this.child,
    required this.onPressed,
    this.width = 150,
    this.height = 150,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: GestureDetector(
        onTap: onPressed,
        child: Animator(
          child: ContainerPapelao(
            width: width,
            height: height,
            child: Align(
              alignment: Alignment.center,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
