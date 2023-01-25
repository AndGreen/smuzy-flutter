import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smuzy/common/theme/colors.dart';
import 'package:smuzy/common/theme/fonts.dart';
import 'package:styled_widget/styled_widget.dart';

class AddRoutineButton extends StatelessWidget {
  const AddRoutineButton({
    super.key,
    required this.onTap,
  });

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        side: BorderSide(
          width: 1.0,
          color: (context.isDarkMode ? Colors.white : Colors.black)
              .withOpacity(0.15),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        onTap();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Ionicons.add).padding(right: 5),
          Text(
            'Add',
            style: AppFonts.text.copyWith(
              color: context.isDarkMode ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
