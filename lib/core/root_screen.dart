import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hakathon_with_mts/core/enums/app_route.dart';
import 'package:hakathon_with_mts/core/enums/screnn_type.dart';
import 'package:hakathon_with_mts/core/routers/router.dart';
import 'package:hakathon_with_mts/core/shared/colors.dart';
import 'package:hakathon_with_mts/core/shared/icons.dart';
import 'package:hakathon_with_mts/core/widgets/custom_bottom_nav_bar.dart';

class RootScreen extends StatefulWidget {
  final Widget child;
  final String currentPath; // Вместо индекса используем путь

  const RootScreen({super.key, required this.child, required this.currentPath});

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late String _currentPath;

  @override
  void initState() {
    super.initState();
    _currentPath = widget.currentPath; // Инициализируем путь
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar:
          context.screenType == ScreenType.mobile ||
                  context.screenType == ScreenType.tablet
              ? SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 0.5, color: borderColor),
                    ),
                  ),
                  height: 70,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    child: Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: BottomNavigationBar(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        unselectedFontSize: 0,
                        selectedFontSize: 0.0,
                        unselectedIconTheme: null,
                        selectedIconTheme: null,
                        unselectedLabelStyle: null,
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        enableFeedback: false,
                        useLegacyColorScheme: false,
                        type: BottomNavigationBarType.fixed,
                        items: _buildBottomNavBarItems,
                        currentIndex: _getCurrentIndex(
                          _currentPath,
                        ), // Индекс на основе пути
                        onTap: onItemTapped,
                      ),
                    ),
                  ),
                ),
              )
              : null,
    );
  }

  void onItemTapped(int index) {
    String newPath = _getPathFromIndex(index);
    if (_currentPath != newPath) {
      setState(() {
        _currentPath = newPath;
      });

      rootNavigatorKey.currentState?.context.go(newPath);
    }
  }

  // Получаем путь на основе индекса
  String _getPathFromIndex(int index) {
    switch (index) {
      case 0:
        return AppRoutes.main.fullPath();
      case 1:
        return AppRoutes.device.fullPath();
      case 2:
        return AppRoutes.notification.fullPath();
      case 3:
        return AppRoutes.profile.fullPath();
      default:
        return AppRoutes.main.fullPath(); // Путь по умолчанию
    }
  }

  int _getCurrentIndex(String path) {
    final segments = path.split('/');

    if (segments.contains('main')) return 0;

    if (segments.contains('device')) return 1;

    if (segments.contains('notification')) return 2;
    if (segments.contains('profile')) return 3;

    return 0;
  }

  List<BottomNavigationBarItem> get _buildBottomNavBarItems => [
    const BottomNavigationBarItem(
      icon: CustomBottomNavBarItem(
        iconPath: mainIcon,
        label: 'Главная',
        isActive: false,
      ),
      activeIcon: CustomBottomNavBarItem(
        iconPath: mainIcon,
        label: 'Главная',
        isActive: true,
      ),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: CustomBottomNavBarItem(
        iconPath: deviceIcon,
        label: 'Устройства',
        isActive: false,
      ),
      activeIcon: CustomBottomNavBarItem(
        iconPath: deviceIcon,
        label: 'Устройства',
        isActive: true,
      ),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: CustomBottomNavBarItem(
        iconPath: notificationIcon,
        label: 'Уведомления',
        isActive: false,
      ),
      activeIcon: CustomBottomNavBarItem(
        iconPath: notificationIcon,
        label: 'Уведомления',
        isActive: true,
      ),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: CustomBottomNavBarItem(
        iconPath: profileIcon,
        label: 'Профиль',
        isActive: false,
      ),
      activeIcon: CustomBottomNavBarItem(
        iconPath: profileIcon,
        label: 'Профиль',
        isActive: true,
      ),
      label: '',
    ),
  ];
}
