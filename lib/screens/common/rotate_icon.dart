
import 'package:flutter/material.dart';

class RotateIcon extends StatefulWidget {
  const RotateIcon({super.key, required this.rotate});

  final bool rotate;

  @override
  State<RotateIcon> createState() => _RotateIconState();
}

class _RotateIconState extends State<RotateIcon> with TickerProviderStateMixin {
  late Animation<double> _iconTurns;
  late AnimationController _controller;
  final _duration = const Duration(milliseconds: 200);

  static final Animatable<double> _iconTurnTween =
  Tween<double>(begin: 0.0, end: 0.5)
      .chain(CurveTween(curve: Curves.fastOutSlowIn));

  @override
  void initState() {
    _controller = AnimationController(duration: _duration, vsync: this);
    _iconTurns = _controller.drive(_iconTurnTween);
    _controller.forward();
    super.initState();
  }

  rotate() {
    if (widget.rotate) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    rotate();
    return RotationTransition(
      turns: _iconTurns,
      child: const Icon(Icons.keyboard_arrow_down_outlined),
    );
  }
}
