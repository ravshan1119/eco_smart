import 'package:eco_smart/screens/home_screens/home_screen.dart';
import 'package:eco_smart/screens/home_screens/pages/home/profile/language_profile.dart';
import 'package:eco_smart/screens/home_screens/pages/home/profile/profile.dart';
import 'package:eco_smart/screens/home_screens/pages/home/widgets/notifications.dart';
import 'package:eco_smart/screens/language/language_page.dart';
import 'package:eco_smart/screens/login/login.dart';
import 'package:eco_smart/screens/service/service_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:eco_smart/core/route/routes_const.dart';
import 'package:eco_smart/screens/onboarding/onboarding.dart';
import 'package:eco_smart/screens/splash/splash_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) {
    return {
      RouteList.splash: (context) => SplashScreen(),
      RouteList.onBoarding: (context) => OnboardingPage(),
      RouteList.language: (context) => LanguagePage(),
      RouteList.homeScreen: (context) => HomeScreen(),
      RouteList.notifications: (context) => Notifications(),
      RouteList.login: (context) => Login(),
      RouteList.service: (context) => ServicePage(),
      RouteList.profile: (context) => ProfilePage(),
      RouteList.languageP: (context) => LanguageProfilePage(),
    };
  }
}
