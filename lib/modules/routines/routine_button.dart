// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smuzy_flutter/common/theme/colors.dart';
import 'package:smuzy_flutter/common/theme/fonts.dart';

class RoutineButton extends StatelessWidget {
  const RoutineButton({
    Key? key,
    required this.color,
    required this.title,
  }) : super(key: key);

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.gray, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Text(
                title,
                style: AppFonts.text,
              )
            ],
          ),
        ));
  }
}
