import 'package:flutter/material.dart';
import 'package:fos7a/constnats/utils.dart';

class CustomLoginButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  Color? btnColor;
  final Widget? startWidget;
  final Widget? endWidget;
  final double sizeBox;
  final MainAxisAlignment mainAxisAlignment;

  CustomLoginButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.sizeBox = 20,
      this.startWidget,
      this.endWidget,
      this.btnColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = Utils(context).getScreenSize;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * .06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: btnColor,
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            startWidget == null
                ? Container()
                : Container(
                    child: startWidget,
                  ),
            SizedBox(
              width: sizeBox,
            ),
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            endWidget == null
                ? Container()
                : Container(
                    child: endWidget,
                  ),
          ],
        ),
      ),
    );
  }
}
