import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:eco_smart/core/app_icons.dart';
import 'package:eco_smart/core/localization/locates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:eco_smart/core/colors.dart';
import 'package:eco_smart/core/extension.dart';
import 'package:eco_smart/core/localization/locale_keys.dart';
import 'package:eco_smart/core/route/navigator.dart';
import 'package:eco_smart/core/route/routes_const.dart';
import 'package:eco_smart/data/injection.dart';
import 'package:eco_smart/data/local_storage.dart';
import 'package:eco_smart/screens/common/my_elevated_button.dart';
import 'package:eco_smart/screens/common/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  void initState() {
    super.initState();
  }

  String? languageCode = getIt<LocalStorage>().getLanguage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextWidget(
            text: LocaleKeys.language.tr(),
            textColor: const Color(0xFF101010),
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
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
                navigator.pushNamed(RouteList.onBoarding);
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.h,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () {
                languageCode = "uz";
                getIt<LocalStorage>().setLanguage(Locates.all[0].toString());
                context.setLocale(Locale(Locates.all[0].languageCode));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: context.locale.languageCode == "uz"
                      ? GradientBoxBorder(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              splashGradientColor1,
                              splashGradientColor2,
                            ],
                          ),
                          width: 1,
                        )
                      : Border.all(color: const Color(0xFFEEEEEE), width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF416EB114).withOpacity(0.08),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            AppImages.flagUz,
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                      12.w,
                      const TextWidget(
                        text: "O’zbekcha",
                        textColor: Color(0xFF212121),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      const Spacer(),
                      context.locale.languageCode == "uz"
                          ? SvgPicture.asset(AppIcons.check)
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          12.h,
          GestureDetector(
            onTap: () {
              languageCode = "en";
              getIt<LocalStorage>().setLanguage(Locates.all[1].toString());
              context.setLocale(Locale(Locates.all[1].languageCode));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: context.locale.languageCode == "en"
                      ? GradientBoxBorder(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              splashGradientColor1,
                              splashGradientColor2,
                            ],
                          ),
                          width: 1,
                        )
                      : Border.all(color: const Color(0xFFEEEEEE), width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF416EB114).withOpacity(0.08),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            AppImages.flagEn,
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                      12.w,
                      const TextWidget(
                        text: "English",
                        textColor: Color(0xFF212121),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      const Spacer(),
                      context.locale.languageCode == "en"
                          ? SvgPicture.asset(AppIcons.check)
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ),
          ),
          12.h,
          GestureDetector(
            onTap: () {
              languageCode = "ru";
              getIt<LocalStorage>().setLanguage(Locates.all[2].toString());
              context.setLocale(Locale(Locates.all[2].languageCode));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: context.locale.languageCode == "ru"
                      ? GradientBoxBorder(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              splashGradientColor1,
                              splashGradientColor2,
                            ],
                          ),
                          width: 1,
                        )
                      : Border.all(color: const Color(0xFFEEEEEE), width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF416EB114).withOpacity(0.08),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            AppImages.flagRu,
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                      12.w,
                      const TextWidget(
                        text: "Русский",
                        textColor: Color(0xFF212121),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      const Spacer(),
                      context.locale.languageCode == "ru"
                          ? SvgPicture.asset(AppIcons.check)
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ),
          ),
          12.h,
          GestureDetector(
            onTap: () {
              languageCode = "tr";
              getIt<LocalStorage>().setLanguage(Locates.all[3].toString());
              context.setLocale(Locale(Locates.all[3].languageCode));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: context.locale.languageCode == "tr"
                      ? GradientBoxBorder(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              splashGradientColor1,
                              splashGradientColor2,
                            ],
                          ),
                          width: 1,
                        )
                      : Border.all(color: const Color(0xFFEEEEEE), width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF416EB114).withOpacity(0.08),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            AppImages.flagTr,
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                      12.w,
                      const TextWidget(
                        text: "Türkçe",
                        textColor: Color(0xFF212121),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      const Spacer(),
                      context.locale.languageCode == "tr"
                          ? SvgPicture.asset(AppIcons.check)
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ),
          ),
          12.h,
          GestureDetector(
            onTap: () {
              languageCode = "fr";
              getIt<LocalStorage>().setLanguage(Locates.all[4].toString());
              context.setLocale(Locale(Locates.all[4].languageCode));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: context.locale.languageCode == "fr"
                      ? GradientBoxBorder(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              splashGradientColor1,
                              splashGradientColor2,
                            ],
                          ),
                          width: 1,
                        )
                      : Border.all(color: const Color(0xFFEEEEEE), width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF416EB114).withOpacity(0.08),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            AppImages.flagUz,
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                      12.w,
                      const TextWidget(
                        text: "Кириллча",
                        textColor: Color(0xFF212121),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      const Spacer(),
                      context.locale.languageCode == "fr"
                          ? SvgPicture.asset(AppIcons.check)
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
