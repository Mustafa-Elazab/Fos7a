import 'package:flutter/material.dart';
import 'package:fos7a/constnats/utils.dart';
import 'package:fos7a/presentation/widget/center_text.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final Color color;
  CustomButton(
      {Key? key,
      required this.onTap,
      required this.title,
      this.color = Colors.green});

  @override
  Widget build(BuildContext context) {
    var size = Utils(context).getScreenSize;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height * .06,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: color),
        child: CenterText(
          title: title,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
