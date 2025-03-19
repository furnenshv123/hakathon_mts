import 'package:flutter/material.dart';
import 'package:hakathon_with_mts/core/routers/router.dart';
import 'package:hakathon_with_mts/core/shared/colors.dart';

ThemeData theme = ThemeData(
  progressIndicatorTheme: ProgressIndicatorThemeData(color: redMainColor),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: NoTransitionsBuilder(),
      TargetPlatform.iOS: NoTransitionsBuilder(),
      TargetPlatform.linux: NoTransitionsBuilder(),
      TargetPlatform.macOS: NoTransitionsBuilder(),
      TargetPlatform.windows: NoTransitionsBuilder(),
    },
  ),
  scrollbarTheme: ScrollbarThemeData(
    trackColor: MaterialStateProperty.all(redMainColor),
    thumbColor: MaterialStateProperty.all(redMainColor),
  ),
  textTheme: TextTheme(
    bodySmall: TextStyle(
      fontFamily: "MTSText",
      color: fontBlackColor,
      fontSize: 12,
    ),
    labelLarge: TextStyle(
      fontFamily: "MTSWide",
      color: fontBlackColor,
      fontSize: 32,
    ),
  ),

  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    foregroundColor: Colors.white,
    surfaceTintColor: Colors.transparent,
  ),
);
