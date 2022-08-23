import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fos7a/constnats/utils.dart';
import 'package:fos7a/presentation/widget/center_text.dart';
import 'package:fos7a/presentation/widget/custom_button.dart';
import 'package:fos7a/presentation/widget/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../translations/locale_keys.g.dart';

class AddPlacePage extends StatelessWidget {
  const AddPlacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(LocaleKeys.add_place_tx.tr()),
        ),
        body: Column(
          children: [
            CustomText(title: LocaleKeys.add_place_contain_tx.tr()),
            SizedBox(
              height: size.height * .3,
            ),
            CenterText(
              title: '+201555465611',
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: size.width * .4,
                child: CustomButton(
                    onTap: () async {
                      var phone = "+201555465611";
                      var whatsappUrl = "whatsapp://send?phone=$phone";
                      await canLaunch(whatsappUrl)
                          ? launch(whatsappUrl)
                          : print(
                              "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
                    },
                    title: 'whatsapp')),
            const SizedBox(
              height: 20,
            ),
            CenterText(
              title: 'mustafaelazab97@gmail.com',
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: size.width * .4,
                child: CustomButton(
                    onTap: () {
                      String? encodeQueryParameters(
                          Map<String, String> params) {
                        return params.entries
                            .map((MapEntry<String, String> e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            .join('&');
                      }

                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'mustafaelazab97@gmail.com',
                        query: encodeQueryParameters(<String, String>{
                          'subject': 'To Add Place',
                        }),
                      );

                      launchUrl(emailLaunchUri);
                    },
                    title: 'Email Me')),
          ],
        ));
  }
}
