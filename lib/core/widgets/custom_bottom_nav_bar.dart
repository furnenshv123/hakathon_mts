import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hakathon_with_mts/core/shared/colors.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;

  const CustomBottomNavBarItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 4),
        Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,

          child: SvgPicture.asset(
            iconPath,
            color: isActive ? redMainColor : iconInactiveColor,
          ),
        ),
        SizedBox(
          width: 84,
          height: 24,
          child: Text(
            label,
            textAlign: TextAlign.center,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 11,
              height: 1,
              fontWeight: FontWeight.w400,
              color: isActive ? redMainColor : iconInactiveColor,
            ),
          ),
        ),
      ],
    );
  }
}
