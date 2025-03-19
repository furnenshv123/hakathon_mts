import 'package:flutter/material.dart';
import 'package:hakathon_with_mts/core/shared/colors.dart';

class AdressParkingWidget extends StatefulWidget {
  const AdressParkingWidget({super.key, required this.adress, required this.onTap});
    final String adress;
  final void Function() onTap;

  @override
  State<AdressParkingWidget> createState() => _AdressParkingWidgetState();
}

class _AdressParkingWidgetState extends State<AdressParkingWidget> {
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