import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  final Widget child;
  final Animation<Offset> position;

  const SlideAnimation({
    Key? key,
    required this.child,
    required this.position,
  }) : super(key: key);

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: widget.position,
      child: widget.child,
    );
  }
}
