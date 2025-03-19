import 'package:flutter/material.dart';
import 'package:hakathon_with_mts/core/shared/colors.dart';

class AdressLampWidget extends StatefulWidget {
  const AdressLampWidget({
    super.key,
    required this.adress,
    required this.onTap,
  });
  final String adress;
  final void Function() onTap;
  @override
  State<AdressLampWidget> createState() => _AdressLampWidgetState();
}

class _AdressLampWidgetState extends State<AdressLampWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Text(
        softWrap: true,
        widget.adress,
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(fontFamily: "MTSText", fontSize: 14, color: fontInactiveColor),
      ),
    );
  }
}
