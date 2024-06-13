import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.colorElevatedButton = iconColorBlue});

  Function() onTap;

  final String title;

  Color? colorElevatedButton;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: colorElevatedButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            )
            /*

          Decoration: BoxDecoration(
            color: iconColorBlue,
            borderRadius: BorderRadius.circular(4),

          ),
           */
            ),
        onPressed: onTap,
        child: Text(title, style: theme.textTheme.titleSmall),
      ),
    );
  }
}
