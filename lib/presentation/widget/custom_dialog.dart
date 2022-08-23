import 'package:flutter/material.dart';
import 'package:fos7a/constnats/theme.dart';
import 'package:fos7a/constnats/utils.dart';
import 'package:fos7a/presentation/widget/center_text.dart';
import 'package:fos7a/presentation/widget/custom_button.dart';
import 'package:fos7a/provider/setting_provider.dart';
import 'package:provider/provider.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image? image;
  final bool hasButton;

  CustomDialog({
    required this.title,
    required this.description,
    required this.buttonText,
    this.image,
    this.hasButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    var settingProvider = Provider.of<SettingProvider>(context);
    var size = Utils(context).getScreenSize;
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          width: size.width * .8,
          height: size.height * .3,
          decoration: BoxDecoration(
            color: settingProvider.isDark
                ? whiteColor
                : whiteColor, //Colors.black.withOpacity(0.3),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // To make the card compact
            children: <Widget>[
              CenterText(
                title: title,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 20.0),
              CenterText(
                title: description,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                maxLines: 2,
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: size.width * .3,
                height: size.height * .05,
                child: CustomButton(
                    onTap: () {
                      Navigator.of(context).pop(); // To close the dialog
                    },
                    title: buttonText),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
