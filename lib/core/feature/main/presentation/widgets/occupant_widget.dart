import 'package:flutter/material.dart';
import 'package:hakathon_with_mts/core/shared/colors.dart';

class OccupantWidget extends StatefulWidget {
  const OccupantWidget({super.key, required this.name, this.isAdding = false});
  final String name;
  final bool? isAdding;
  @override
  State<OccupantWidget> createState() => _OccupantWidgetState();
}

class _OccupantWidgetState extends State<OccupantWidget> {
  String getInitials(String fullName) {
    List<String> names = fullName.split(' ');
    if (names.length < 2) {
      return ''; // Возвращаем пустую строку, если входные данные некорректны
    }
    String initials =
        names[0][0] + names[1][0]; // Соединяем первые буквы имени и фамилии
    return initials.toUpperCase(); // Возвращаем инициалы в верхнем регистре
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: widget.isAdding! ? redMainColor : occupantColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child:
              widget.isAdding!
                  ? const Icon(Icons.add, color: Colors.white)
                  : Text(
                    getInitials(widget.name),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontFamily: "MTSCompactMedium",
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 80,
          child: Text(
            textAlign: TextAlign.center,
            softWrap: true,
            widget.isAdding! ? 'Добавить жильца' : widget.name,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontFamily: "MTSCompact",
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
