import 'package:flutter/material.dart';
import 'package:hakathon_with_mts/core/shared/colors.dart';

class AdressTrashWidget extends StatefulWidget {
  const AdressTrashWidget({super.key, required this.adress, required this.onTap});
  final String adress;
  final void Function() onTap;
  @override
  State<AdressTrashWidget> createState() => _AdressTrashWidgetState();
}

class _AdressTrashWidgetState extends State<AdressTrashWidget> {
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