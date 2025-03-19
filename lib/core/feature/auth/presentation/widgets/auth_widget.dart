import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakathon_with_mts/core/feature/auth/data/models/auth_model.dart';
import 'package:hakathon_with_mts/core/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:hakathon_with_mts/core/widgets/button_app.dart';
import 'package:hakathon_with_mts/core/widgets/custom_text_field.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                CustomFormField(
                  label: 'Почта',
                  hintText: 'mail123@mail.ru',
                  controller: widget.emailController,
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  controller: widget.passwordController,
                  label: 'Пароль',
                  isPassword: true,
                  hintText: 'Пароль',
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 46),
            child: ButtonApp(
              onPressed: () {
                context.read<AuthBloc>().add(
                  LoginEvent(
                    model: AuthModel(
                      email: widget.emailController.text,
                      password: widget.passwordController.text,
                    ),
                  ),
                );
              },

              width: double.infinity,
              title: 'Далее',
              height: 44,
            ),
          ),
        ],
      ),
    );
  }
}
