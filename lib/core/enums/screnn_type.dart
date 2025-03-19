import 'package:flutter/material.dart';

enum ScreenType {
  mobile,
  tablet,
  desktop,
}

extension ScreenTypeExtension on BuildContext {
  ScreenType get screenType {
    double width = MediaQuery.of(this).size.width;
    if (width < 600) {
      return ScreenType.mobile;
    } else if (width < 1200) {
      return ScreenType.tablet;
    } else {
      return ScreenType.desktop;
    }
  }
}

sealed class ScreenLayout {
  const ScreenLayout();
}

class MobileLayout extends ScreenLayout {}

class TabletLayout extends ScreenLayout {}

class DesktopLayout extends ScreenLayout {}
