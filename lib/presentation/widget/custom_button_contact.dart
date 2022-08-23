import 'package:flutter/material.dart';
import 'package:fos7a/constnats/utils.dart';
import 'package:fos7a/presentation/widget/custom_text.dart';

class CustomContactButton extends StatelessWidget {
  late String title;
  late IconData iconData;
  final Function()? onTap;
  Color? iconColor;

  CustomContactButton({
    Key? key,
    required this.title,
    required this.iconData,
    this.onTap,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = Utils(context).getScreenSize;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
              height: size.height / 16,
              width: size.width / 10,
              // padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                iconData,
              )),
          const SizedBox(
            width: 8,
          ),
          CustomText(
            title: title,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
