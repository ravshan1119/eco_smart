import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontWeight,
    required this.fontSize,
    this.overFlow,
    this.textAlign,
    this.maxLines,
  });
  final TextOverflow? overFlow;
  final String? text;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      overflow: overFlow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        color: textColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: "GolosText",
      ),
    );
  }
}
