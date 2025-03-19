import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hakathon_with_mts/core/enums/app_route.dart';
import 'package:hakathon_with_mts/core/feature/auth/data/models/auth_model.dart';
import 'package:hakathon_with_mts/core/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:hakathon_with_mts/core/feature/auth/presentation/widgets/auth_widget.dart';
import 'package:hakathon_with_mts/core/feature/auth/presentation/widgets/registration_widget.dart';
import 'package:hakathon_with_mts/core/shared/colors.dart';
import 'package:hakathon_with_mts/core/widgets/button_app.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;
  late TextEditingController _lastnameController;
  late TextEditingController _numberController;
  late TextEditingController _adressController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _lastnameController = TextEditingController();
    _numberController = TextEditingController();
    _adressController = TextEditingController();
    super.initState();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.go(AppRoutes.main.path);
        }
        if (state is AuthError) {
          _emailController.text = "";
          _passwordController.text = "";
          _lastnameController.text = "";
          _nameController.text = "";
          _numberController.text = "";
          _adressController.text = "";
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 130),
                child: Column(
                  children: [
                    _segmentButton(
                      text: 'Авторизация',
                      selected: index == 0,
                      onTap: () {
                        setState(() {
                          index = 0;
                        });
                      },
                    ),
                    _segmentButton(
                      text: 'Регистрация',
                      selected: index == 1,
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(child: _getSelectedWidget(index)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _segmentButton({
    required String text,
    required bool selected,
    required Function() onTap,
  }) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          selected ? textFieldBackGroundColoor : Colors.transparent,
        ),
        foregroundColor: WidgetStatePropertyAll(fontBlackColor),
        elevation: WidgetStatePropertyAll(0),
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        textStyle: WidgetStatePropertyAll(
          Theme.of(context).textTheme.labelLarge?.copyWith(
            fontFamily: "MTSCompactMedium",
            fontSize: 17,
          ),
        ),
        shape: WidgetStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      onPressed: onTap,
      child: Text(text),
    );
  }

  Widget _getSelectedWidget(int index) {
    if (index == 0) {
      return AuthWidget(
        emailController: _emailController,
        passwordController: _passwordController,
      );
    } else {
      return RegistrationWidget(
        emailController: _emailController,
        passwordController: _passwordController,
        nameController: _nameController,
        lastnameController: _lastnameController,
        numberController: _numberController,
        addressController: _adressController,
      );
    }
  }
}
