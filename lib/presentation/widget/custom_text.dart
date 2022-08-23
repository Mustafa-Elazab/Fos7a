import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  late String title;
  final double fontSize;
  final Color? color;
  final Alignment textAlignment;
  final FontWeight fontWeight;
  final int maxLines;
  final TextOverflow textOverflow;
  final String? fontFamily;

  CustomText(
      {Key? key,
      required this.title,
      this.fontSize = 14,
      this.color,
      this.textAlignment = Alignment.topLeft,
      this.fontWeight = FontWeight.normal,
      this.maxLines = 1,
      this.textOverflow = TextOverflow.ellipsis,
      this.fontFamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      overflow: textOverflow,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontFamily: fontFamily),
    );
  }
}
