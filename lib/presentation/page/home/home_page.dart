import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fos7a/presentation/page/home/inner_screen/home_body.dart';
import 'package:fos7a/presentation/widget/custom_text.dart';
import 'package:fos7a/translations/locale_keys.g.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: LocaleKeys.fos7a_tx.tr(),
          fontFamily: 'Quaker',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        elevation: 0.2,
      ),
      body: HomeBody(),
    );
  }
}
