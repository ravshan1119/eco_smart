import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eco_smart/core/app_icons.dart';
import 'package:eco_smart/core/extension.dart';
import 'package:eco_smart/core/localization/locale_keys.dart';
import 'package:eco_smart/screens/common/text_widget.dart';

class OnboardingThreePage extends StatefulWidget {
  const OnboardingThreePage({super.key});

  @override
  State<OnboardingThreePage> createState() => _OnboardingThreePageState();
}

class _OnboardingThreePageState extends State<OnboardingThreePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: "Eng yaqin punktni toping!",
              fontSize: 32,
              fontWeight: FontWeight.w700,
              textColor: Color(0xFF101010),
            ),
            12.h,
            TextWidget(
              textColor: Color(0xFF101010),
              fontWeight: FontWeight.w400,
              fontSize: 16,
              text: "Geo-lokatsiya orqali yaqin atrofdagi yig‘ish punktlarini osongina toping va xaritadan yo‘nalishingizni belgilang.",
            ),
            24.h,
            // Image.asset(AppImages.onBoardingThree),
          ],
        ),
      ),
    );
  }
}
