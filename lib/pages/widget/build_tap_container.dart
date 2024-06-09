import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class BuildTapContainer extends StatelessWidget {
  BuildTapContainer(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap});

  final String title;
  final String image;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: blackColor,
          border: Border.all(color: iconColorBlue, width: 2),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 35,
              width: 35,
              fit: BoxFit.cover,
            ),
            Text(
              " $title",
              style: theme.textTheme.titleSmall?.copyWith(
                color: whiteColor.withOpacity(0.87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
