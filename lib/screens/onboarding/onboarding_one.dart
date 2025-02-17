import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eco_smart/core/app_icons.dart';
import 'package:eco_smart/core/extension.dart';
import 'package:eco_smart/core/localization/locale_keys.dart';
import 'package:eco_smart/screens/common/text_widget.dart';

class OnboardingOnePage extends StatefulWidget {
  const OnboardingOnePage({super.key});

  @override
  State<OnboardingOnePage> createState() => _OnboardingOnePageState();
}

class _OnboardingOnePageState extends State<OnboardingOnePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: "Eco mahsulotlaringizni daromadga aylantiring!",
              fontSize: 32,
              fontWeight: FontWeight.w700,
              textColor: Color(0xFF101010),
            ),
            12.h,
            TextWidget(
              textColor: Color(0xFF101010),
              fontWeight: FontWeight.w400,
              fontSize: 16,
              text: "Uyda yig‘ilib qolgan plastik, temir va qog‘oz buyumlarni yig‘ib, bizning platformamiz orqali sotib, qo‘shimcha daromad oling.",
            ),
            24.h,
            // Image.asset(AppImages.onBoardingOne),
          ],
        ),
      ),
    );
  }
}
