import 'package:flutter/material.dart';

class CenterText extends StatelessWidget {
  late String title;
  final double fontSize;
  final Color? color;

  final FontWeight fontWeight;
  final int maxLines;
  final TextOverflow textOverflow;
  final String? fontFamily;

  CenterText(
      {Key? key,
      required this.title,
      this.fontSize = 14,
      this.color,
      this.fontWeight = FontWeight.normal,
      this.maxLines = 1,
      this.textOverflow = TextOverflow.ellipsis,
      this.fontFamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(title,
          maxLines: maxLines,
          overflow: textOverflow,
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
              fontFamily: fontFamily)),
    );
  }
}
