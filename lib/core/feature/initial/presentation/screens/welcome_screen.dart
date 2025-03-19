import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hakathon_with_mts/core/enums/app_route.dart';
import 'package:hakathon_with_mts/core/shared/colors.dart';
import 'package:hakathon_with_mts/core/shared/icons.dart';
import 'package:hakathon_with_mts/core/widgets/button_app.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Column(
              children: [
                SvgPicture.asset(initialIcon, width: 74, height: 74),
                const SizedBox(height: 45),
                Text(
                  'Добро пожаловать',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'В МТС Город!',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 46),
              child: ButtonApp(
                title: 'ДАЛЕЕ',
                onPressed: () {
                  context.go(AppRoutes.auth.path);
                },
                width: double.infinity,
                height: 44,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
