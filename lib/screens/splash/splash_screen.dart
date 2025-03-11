import 'dart:async';

import 'package:eco_smart/core/app_icons.dart';
import 'package:eco_smart/data/injection.dart';
import 'package:eco_smart/data/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:eco_smart/core/colors.dart';
import 'package:eco_smart/core/route/navigator.dart';
import 'package:eco_smart/core/route/routes_const.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  void nextPages() async {
    timer = Timer(const Duration(seconds: 2), () {
      if (getIt<LocalStorage>().getIsFirst() == true) {
        if (getIt<LocalStorage>().getToken().isNotEmpty) {
          navigator.pushReplacementNamed(RouteList.homeScreen);
        } else {
          navigator.pushReplacementNamed(RouteList.login);
        }
      } else {
        navigator.pushReplacementNamed(RouteList.language);
      }
    });
  }

  @override
  void initState() {
    nextPages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  splashGradientColor1,
                  splashGradientColor2,
                ],
              ),
            ),
          ),
          Center(
            child: SvgPicture.asset(
              AppImages.logoImages,
              height: 200,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
