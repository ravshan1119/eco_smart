import 'package:easy_localization/easy_localization.dart';
import 'package:eco_smart/core/route/navigator.dart';
import 'package:eco_smart/core/route/routes_const.dart';
import 'package:flutter/material.dart';
import 'package:eco_smart/core/colors.dart';
import 'package:eco_smart/core/localization/locale_keys.dart';
import 'package:eco_smart/data/injection.dart';
import 'package:eco_smart/data/local_storage.dart';
import 'package:eco_smart/screens/common/text_widget.dart';
import 'package:eco_smart/screens/onboarding/onboarding_one.dart';
import 'package:eco_smart/screens/onboarding/onboarding_three.dart';
import 'package:eco_smart/screens/onboarding/onboarding_two.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 32.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                splashGradientColor1,
                splashGradientColor2,
              ],
            ),
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
            child: InkWell(
              onTap: () {
                if (pageController.page == 2) {
                  getIt<LocalStorage>().setIsFirst(true);
                  navigator.pushNamedAndRemoveUntil(
                    RouteList.login,
                    (route) => false,
                  );
                } else {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                }
              },
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
              child: Center(
                child: TextWidget(
                  text: LocaleKeys.continueButton.tr(),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  textColor: kPrimaryWhiteColor,
                ),
              ),
            ),
          ),
        ),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        children: [
          const OnboardingOnePage(),
          const OnboardingTwoPage(),
          const OnboardingThreePage(),
        ],
      ),
    );
  }
}
