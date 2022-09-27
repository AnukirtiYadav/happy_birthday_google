import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  final Widget child;
  final Animation<double> scale;
  const ScaleAnimation({required this.child, required this.scale, super.key});

  @override
  State<ScaleAnimation> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation> {
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: widget.scale,
      child: widget.child,
    );
  }
}
