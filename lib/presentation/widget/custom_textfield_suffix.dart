import 'package:flutter/material.dart';
import 'package:fos7a/constnats/theme.dart';

class CustomTextFormFieldWithSuffix extends StatelessWidget {
  late String title;
  final String hint;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final int? maxLines;
  final Function(String?)? onSubmit;
  final Function(String?)? onSave;
  final Function()? onTap;
  final bool obscureText;
  final bool readOnly;

  CustomTextFormFieldWithSuffix({
    Key? key,
    required this.title,
    this.hint = '',
    this.controller,
    this.inputType = TextInputType.text,
    this.maxLines,
    this.onSubmit,
    this.suffixIcon,
    this.onTap,
    this.obscureText = false,
    this.readOnly = false,
    this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      onFieldSubmitted: onSubmit,
      readOnly: readOnly,
      controller: controller,
      onSaved: onSave,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Field is Requird  ';
        }
        return null;
      },
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: title,
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(width: 1.0, color: blackColor.withOpacity(.2)),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: blackColor.withOpacity(.2)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: blackColor.withOpacity(.5)),
          ),
          hintText: hint,
          suffixIcon: InkWell(
            onTap: onTap,
            child: Icon(
              suffixIcon,
            ),
          )),
    );
  }
}
