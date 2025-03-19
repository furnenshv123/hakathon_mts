import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hakathon_with_mts/core/enums/app_route.dart';
import 'package:hakathon_with_mts/core/feature/auth/presentation/screens/auth_screen.dart';
import 'package:hakathon_with_mts/core/feature/device/presentation/screens/device_screen.dart';
import 'package:hakathon_with_mts/core/feature/device/presentation/screens/selected_lamp_screen.dart';
import 'package:hakathon_with_mts/core/feature/device/presentation/screens/selected_parking_screen.dart';
import 'package:hakathon_with_mts/core/feature/device/presentation/screens/selected_trash_screen.dart';
import 'package:hakathon_with_mts/core/feature/initial/presentation/screens/welcome_screen.dart';
import 'package:hakathon_with_mts/core/feature/main/presentation/bloc/sensor_bloc.dart';
import 'package:hakathon_with_mts/core/feature/main/presentation/screens/main_screen.dart';
import 'package:hakathon_with_mts/core/feature/notification/presentation/notification_screen.dart';
import 'package:hakathon_with_mts/core/feature/profile/presentation/screens/profile_screen.dart';
import 'package:hakathon_with_mts/core/root_screen.dart';

GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  redirect: (context, state) {},
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.welcome.path,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.welcome.path,
      name: AppRoutes.welcome.name,
      builder: (context, state) {
        return const WelcomeScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.auth.path,
      name: AppRoutes.auth.name,
      builder: (context, state) {
        return const AuthScreen();
      },
    ),
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return RootScreen(currentPath: state.uri.path, child: child);
      },
      routes: [
        GoRoute(
          path: AppRoutes.main.path,
          parentNavigatorKey: shellNavigatorKey,
          builder:
              (context, state) => BlocProvider(
                create:
                    (context) =>
                        context.read<SensorBloc>()..add(SensorGetSensors()),
                child: MainScreen(),
              ),
        ),
        GoRoute(
          path: AppRoutes.device.path,
          parentNavigatorKey: shellNavigatorKey,
          builder:
              (context, state) => BlocProvider(
                create:
                    (context) =>
                        context.read<SensorBloc>()..add(SensorGetSensors()),
                child: DeviceScreen(),
              ),
          routes: [
            GoRoute(
              path: '${AppRoutes.parking.path}/:id',
              parentNavigatorKey: shellNavigatorKey,
              builder: (context, state) {
                final String? id = state.pathParameters['id'];
                if (id == null || id.isEmpty) {
                  return DeviceScreen();
                } else {
                  return SelectedParkingScreen();
                }
              },
            ),
            GoRoute(
              path: '${AppRoutes.lamp.path}/:id',
              parentNavigatorKey: shellNavigatorKey,
              builder: (context, state) {
                final String? id = state.pathParameters['id'];
                if (id == null || id.isEmpty) {
                  return DeviceScreen();
                } else {
                  return SelectedLampScreen();
                }
              },
            ),
            GoRoute(
              path: '${AppRoutes.trash.path}/:id',
              parentNavigatorKey: shellNavigatorKey,
              builder: (context, state) {
                final String? id = state.pathParameters['id'];
                if (id == null || id.isEmpty) {
                  return DeviceScreen();
                } else {
                  return SelectedTrashScreen();
                }
              },
            ),
          ],
        ),
        GoRoute(
          path: AppRoutes.profile.path,
          parentNavigatorKey: shellNavigatorKey,
          builder: (context, state) => ProfileScreen(),
        ),
        GoRoute(
          path: AppRoutes.notification.path,
          parentNavigatorKey: shellNavigatorKey,
          builder: (context, state) => NotificationScreen(),
        ),
      ],
    ),
  ],
);

class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget? child,
  ) {
    return child!;
  }
}

extension GoRouterExtension on GoRouter {
  void clearStackAndNavigate(String location) {
    while (canPop()) {
      pop();
    }
    pushReplacement(location);
  }
}
