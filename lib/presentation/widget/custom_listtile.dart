import 'package:flutter/material.dart';
import 'package:fos7a/constnats/theme.dart';

import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  String? title;
  String? subtitle;
  bool? haveSub;
  IconData? icon;
  Function()? onPressed;
  Color? color;
  Color? borderColor;
  IconData? arrowIcon;

  CustomListTile({
    Key? key,
    required this.title,
    this.onPressed,
    this.color,
    this.icon,
    this.borderColor = appColorPrimary,
    this.haveSub = false,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: borderColor),
              child: Icon(
                icon,
                color: whiteColor,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: title!,
                  fontSize: 18,
                ),
                if (haveSub == true)
                  CustomText(
                    title: subtitle!,
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
