
import 'package:flutter/material.dart';

class NavigationPages {
  final BuildContext _context = NavigationService.navigatorKey.currentContext!;

  pop() {
    Navigator.pop(_context);
  }

  pushNamed(String page, {Object? arguments}) {
    Navigator.pushNamed(_context, page, arguments: arguments);
  }

  pushReplacementNamed(String routeName, {Object? arguments}){
    Navigator.pushReplacementNamed(_context, routeName, arguments: arguments);
  }

  pushAndRemoveUntil(String routeName){
    Navigator.pushNamedAndRemoveUntil(_context, routeName, (route) => false);
  }
}

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
}

NavigatorState navigator = NavigationService.navigatorKey.currentState!;
