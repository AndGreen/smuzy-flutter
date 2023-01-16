// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_button.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class ColorCircle extends StatelessWidget {
  const ColorCircle({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext _context) => colorCircle(color: color);
}

class RoutineButton extends StatelessWidget {
  const RoutineButton({
    Key? key,
    required this.color,
    required this.title,
    required this.onTap,
    required this.isActive,
  }) : super(key: key);

  final Color color;

  final String title;

  final Function onTap;

  final bool isActive;

  @override
  Widget build(BuildContext _context) => routineButton(
        color: color,
        title: title,
        onTap: onTap,
        isActive: isActive,
      );
}
