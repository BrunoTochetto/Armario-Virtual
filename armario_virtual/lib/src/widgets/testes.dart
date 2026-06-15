import 'package:flutter/material.dart';
import 'dart:math';

class ExplicitAnimationScreen extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;

  const ExplicitAnimationScreen({super.key, required this.child, this.width = 150, this.height = 150, required this.onPressed});

  final double height;
  final double width;

  @override
  State<ExplicitAnimationScreen> createState() => _ExplicitAnimationScreenState();
}

class _ExplicitAnimationScreenState extends State<ExplicitAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Isso será a porcentagem que eles voam por ai, então de -100 à 100 porcento. No código ele ajusta.
  final List<double> _offsetValues = [0.0, -30, 40.0, -40.0, 34, -40, 10, -20.0, 15, -23, 34, -100];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double mapRange({
  required double value,
  required double inMin,
  required double inMax,
  required double outMin,
  required double outMax,
    }) {
      return outMin + (value - inMin) * (outMax - outMin) / (inMax - inMin);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final index = (_controller.value * _offsetValues.length).floor() % _offsetValues.length;
          final angle = _offsetValues[index];

          return Transform(
            transform: Matrix4.rotationZ(mapRange(
              value: angle,
              inMin: -100,
              inMax: 100,
              outMin: -3,
              outMax: 3
            ) * (pi / 180)),
            alignment: Alignment.center,
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("assets/images/papelao.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: ElevatedButton(onPressed: widget.onPressed, child: widget.child),
            ),
          );
        },
      )
    );
  }
}
 