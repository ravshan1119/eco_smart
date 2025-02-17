
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math show sin, pi;

class Loader extends StatelessWidget {
  final Color? color;

  const Loader({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: 3,
        ),
      ),
    )
        : Center(
      child: CupertinoActivityIndicator(
        radius: 15,
        color: color ?? Colors.white,
      ),
    );
  }
}

class SpinKitCircle extends StatefulWidget {
  const SpinKitCircle({
    super.key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  })  : assert(
  !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
      !(itemBuilder == null && color == null),
  'You should specify either a itemBuilder or a color',
  );

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  State<SpinKitCircle> createState() => _SpinKitCircleState();
}

class _SpinKitCircleState extends State<SpinKitCircle>
    with SingleTickerProviderStateMixin {
  static const _itemCount = 12;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Stack(
          children: List.generate(_itemCount, (index) {
            final position = widget.size * .5;
            return Positioned.fill(
              left: position,
              top: position,
              child: Transform(
                transform: Matrix4.rotationZ(30.0 * index * 0.0174533),
                child: Align(
                  alignment: Alignment.center,
                  child: ScaleTransition(
                    scale: DelayTween(
                      begin: 0.0,
                      end: 1.0,
                      delay: index / _itemCount,
                    ).animate(_controller),
                    child: SizedBox.fromSize(
                      size: Size.square(widget.size * 0.15),
                      child: _itemBuilder(index),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
    decoration: BoxDecoration(
      color: widget.color,
      shape: BoxShape.circle,
    ),
  );
}

class DelayTween extends Tween<double> {
  DelayTween({
    super.begin,
    super.end,
    required this.delay,
  });

  final double delay;

  @override
  double lerp(double t) {
    return super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);
  }

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
