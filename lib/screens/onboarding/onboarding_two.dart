import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eco_smart/core/app_icons.dart';
import 'package:eco_smart/core/extension.dart';
import 'package:eco_smart/core/localization/locale_keys.dart';
import 'package:eco_smart/screens/common/text_widget.dart';

class OnboardingTwoPage extends StatefulWidget {
  const OnboardingTwoPage({super.key});

  @override
  State<OnboardingTwoPage> createState() => _OnboardingTwoPageState();
}

class _OnboardingTwoPageState extends State<OnboardingTwoPage> {
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
              text: LocaleKeys.onboardingTwoTitle.tr(),
              fontSize: 32,
              fontWeight: FontWeight.w700,
              textColor: Color(0xFF101010),
            ),
            12.h,
            TextWidget(
              textColor: Color(0xFF101010),
              fontWeight: FontWeight.w400,
              fontSize: 16,
              text: LocaleKeys.onboardingTwo.tr(),
            ),
            24.h,
            // Image.asset(AppImages.onBoardingTwo),
          ],
        ),
      ),
    );
  }
}
