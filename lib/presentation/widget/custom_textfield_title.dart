import 'package:flutter/material.dart';
import 'package:fos7a/constnats/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final String? hint;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final int? maxLines;
  final Function(String?)? onSubmit;
  final Function(String?)? onSave;

  CustomTextFormField({
    Key? key,
    this.title,
    this.hint,
    this.controller,
    this.inputType = TextInputType.text,
    this.maxLines,
    this.prefixIcon,
    this.onSubmit,
    this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: inputType,
        textInputAction: TextInputAction.next,
        controller: controller,
        onFieldSubmitted: onSubmit,
        maxLines: maxLines,
        onSaved: onSave,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Field is Requird  ';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hint!,
          //label: Text(title!),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                width: 1.0, color: Colors.transparent.withOpacity(.2)),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent.withOpacity(.2)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent.withOpacity(.2)),
          ),
        ));
  }
}
