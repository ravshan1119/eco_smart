import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.hintStyle,
    required this.radius,
    this.obscureText,
    this.maxLines,
    this.validator,
    this.inputFormatter,
    this.suffixIcon,
    this.onChanged,
    this.onSubmit,
    this.onTap,
    this.textInputType,
    this.textInputAction,
    this.prefixText,
    this.style,
    this.prefixIcon,
    this.prefixConstraints,
    this.editable,
    this.autoFocus,
    this.fillColor,
    this.contentPadding,
    this.textAlign,
    this.error,
    this.suffixConstraints,
    this.counterText,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final TextStyle? hintStyle;
  final double radius;
  final bool? obscureText;
  final int? maxLines;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatter;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final Function()? onTap;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? prefixText;
  final TextStyle? style;
  final Widget? prefixIcon;
  final BoxConstraints? prefixConstraints;
  final bool? editable;
  final Color? fillColor;
  final EdgeInsets? contentPadding;
  final TextAlign? textAlign;
  final bool? autoFocus;
  final String? error;
  final String? counterText;
  final BoxConstraints? suffixConstraints;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onSubmit,
      keyboardType: textInputType,
      inputFormatters: inputFormatter,
      validator: validator,
      maxLines: maxLines ?? 1,
      obscureText: obscureText ?? false,
      onTap: onTap,
      onChanged: onChanged,
      style: style,
      autofocus: autoFocus ?? false,
      textInputAction: textInputAction,
      textAlign: textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        counterText: counterText,
        counterStyle: const TextStyle(
            color: Color(0xFF5C697A),
            fontSize: 14,
            fontWeight: FontWeight.w500),
        suffixIconConstraints: suffixConstraints,
        enabled: editable ?? true,
        fillColor: fillColor,
        filled: fillColor != null ? true : false,
        errorText: error,
        contentPadding: contentPadding,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(
            color: Colors.black, // primary colors boladi kok!
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: Colors.black, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
          borderRadius: BorderRadius.circular(
            radius,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixConstraints,
        hintText: hintText,
        hintStyle: hintStyle,
        prefixText: prefixText,
        prefixStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
