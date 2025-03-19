import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakathon_with_mts/core/feature/auth/data/models/auth_model.dart';
import 'package:hakathon_with_mts/core/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:hakathon_with_mts/core/widgets/button_app.dart';
import 'package:hakathon_with_mts/core/widgets/custom_text_field.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.lastnameController,
    required this.numberController,
    required this.addressController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController lastnameController;
  final TextEditingController numberController;
  final TextEditingController addressController;
  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
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
                  label: 'Имя',
                  hintText: 'Введите имя',
                  controller: widget.nameController,
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  label: 'Фамилия',
                  hintText: 'Введите фамилию',
                  controller: widget.lastnameController,
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  label: 'Номер телефона',
                  hintText: '+375',
                  controller: widget.numberController,
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  label: 'Почта',
                  hintText: 'mail123@mail.ru',
                  controller: widget.emailController,
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  label: 'Пароль',
                  isPassword: true,
                  hintText: 'Пароль',
                  controller: widget.passwordController,
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  label: 'Адрес',
                  hintText: 'Введите адрес',
                  controller: widget.addressController,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 46),
            child: ButtonApp(
              onPressed: () {
                context.read<AuthBloc>().add(
                  RegisterEvent(
                    model: AuthModel(
                      email: widget.emailController.text,
                      password: widget.passwordController.text,
                      name: widget.nameController.text,
                      surname: widget.lastnameController.text,
                      phoneNumber: widget.numberController.text,
                      address: widget.addressController.text,
                      role: "USER",
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
