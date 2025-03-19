import 'package:flutter/material.dart';
import 'package:hakathon_with_mts/core/routers/router.dart';
import 'package:hakathon_with_mts/core/utils/theme.dart';

class MTCHome extends StatelessWidget {
  const MTCHome({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: theme,
    );
  }
}