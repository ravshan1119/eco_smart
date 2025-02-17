import 'package:eco_smart/core/colors.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    primarySwatch: primaryColor,
    useMaterial3: false,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFFFFFFF),
        iconTheme: IconThemeData(
          color: Color(0xFF000000),
        )
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFF000000),
    )
).copyWith(
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
  }),
);