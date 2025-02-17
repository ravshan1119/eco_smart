import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    super.key,
    this.radius,
    this.height,
    this.primaryColor,
    this.width,
    required this.child,
    this.onTap,
    this.expanded,
  });

  final double? width, height, radius;
  final Color? primaryColor;
  final Widget child;
  final VoidCallback? onTap;
  final bool? expanded;

  @override
  Widget build(BuildContext context) {
    Widget button = ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        backgroundColor: primaryColor,
        fixedSize: Size(
          width ?? 0,
          height ?? 48,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 30),
        ),
      ),
      onPressed: onTap,
      child: child,
    );
    return (expanded ?? false)
        ? Row(
            children: [Expanded(child: button)],
          )
        : button;
  }
}
