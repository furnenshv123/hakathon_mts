import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hakathon_with_mts/core/shared/colors.dart';
import 'package:hakathon_with_mts/core/shared/icons.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.onChanged,
    this.controller,
    this.validator,
    this.isRequired = false,
  });
  final String label;
  final bool isRequired;

  final String hintText;
  final bool? isPassword;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late TextEditingController _controller;
  bool showPass = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontFamily: "MTSCompact",
            color: textFieldTextColor,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: widget.controller,
          cursorColor: redMainColor,
          obscureText: widget.isPassword! ? !showPass : false,
          onChanged: (value) {
            setState(() {
              widget.onChanged?.call(value);
            });
          },
          minLines: 1,
          maxLines: 1,
          decoration: InputDecoration(
            fillColor: textFieldTextColor,
            suffixIcon:
                widget.isPassword!
                    ? IconButton(
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          showPass = !showPass;
                        });
                      },
                      icon:
                          showPass
                              ? SvgPicture.asset(openEye)
                              : SvgPicture.asset(closeEye),
                    )
                    : null,
            hintText: widget.hintText,
            counterStyle: const TextStyle(
              color: textFieldTextColor,
              fontSize: 12,
            ),
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(width: 1, color: redMainColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(width: 1, color: borderColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(width: 1, color: borderColor),
            ),

            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: textFieldTextColor,
              fontSize: 17,
              fontFamily: "MTSCompact",
            ),
          ),
          validator:
              widget.isRequired
                  ? (value) {
                    if (value == null || value.isEmpty) {
                      return 'Это поле обязательно для заполнения';
                    }
                    return widget.validator?.call(value);
                  }
                  : widget.validator,
        ),
      ],
    );
  }

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
