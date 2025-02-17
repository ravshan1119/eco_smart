import 'dart:io';

import 'package:flutter/material.dart';
import 'package:eco_smart/core/colors.dart';
import 'package:eco_smart/core/route/navigator.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26, top: 55),
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          child: InkWell(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            onTap: () => navigator.pop(),
            child: Center(
              child: Icon(
                Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
                color: kPrimaryWhiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
