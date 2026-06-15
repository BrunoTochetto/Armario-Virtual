import 'package:flutter/material.dart';
import 'dart:math';

class Animator extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final List<double> offsetValues;

  const Animator({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 3),
    this.offsetValues = const [0.0, -30, 40.0, -40.0, 34, -40, 10, -20.0, 15, -23, 34, -100],
  });

  @override
  State<Animator> createState() => _AnimatorState();
}

class _AnimatorState extends State<Animator> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _mapRange({
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final index = (_controller.value * widget.offsetValues.length).floor() % widget.offsetValues.length;
        final angle = widget.offsetValues[index];

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(
            _mapRange(
              value: angle,
              inMin: -100,
              inMax: 100,
              outMin: -3,
              outMax: 3,
            ) * (pi / 180),
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
