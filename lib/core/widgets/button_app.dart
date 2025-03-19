import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hakathon_with_mts/core/enums/app_route.dart';
import 'package:hakathon_with_mts/core/shared/colors.dart';

class ButtonApp extends StatefulWidget {
  const ButtonApp({
    super.key,
    this.title,
    this.icon,
    required this.onPressed,
    required this.width,
    this.height,
  });
  final String? title;
  final Icon? icon;
  final double width;
  final double? height;
  final void Function() onPressed;
  @override
  State<ButtonApp> createState() => _ButtonAppState();
}

class _ButtonAppState extends State<ButtonApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(0),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          backgroundColor: WidgetStatePropertyAll(redMainColor),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
        ),
        onPressed: widget.onPressed,
        child:
            widget.title == null
                ? widget.icon
                : Text(
                  widget.title!,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "MTSWideBold",
                  ),
                ),
      ),
    );
  }
}
