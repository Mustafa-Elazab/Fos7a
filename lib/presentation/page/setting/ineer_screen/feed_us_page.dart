import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fos7a/constnats/theme.dart';
import 'package:fos7a/constnats/utils.dart';
import 'package:fos7a/data/models/feed_model.dart';
import 'package:fos7a/presentation/page/bottom_nav/bottom_bar_page.dart';
import 'package:fos7a/presentation/widget/center_text.dart';
import 'package:fos7a/presentation/widget/custom_button.dart';
import 'package:fos7a/presentation/widget/custom_textfield_title.dart';
import 'package:fos7a/presentation/widget/global_methods.dart';
import 'package:fos7a/provider/setting_provider.dart';
import 'package:provider/provider.dart';

import '../../../../translations/locale_keys.g.dart';

class FeedUsPage extends StatelessWidget {
  FeedUsPage({Key? key}) : super(key: key);
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _feedTextController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(LocaleKeys.contact_tx.tr()),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CenterText(
                  title: LocaleKeys.contact_us_contain_tx.tr(),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hint: LocaleKeys.contact_us_name_tx.tr(),
                  controller: _nameController,
                  onSave: (value) {},
                  onSubmit: (value) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1.0, color: blackColor.withOpacity(.2)),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        child: Text(
                          generateCountryFlag() + ' +20',
                          style:
                              const TextStyle(fontSize: 14, letterSpacing: 2.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          //autofocus: true,
                          controller: _phoneController,

                          style: const TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.0,
                          ),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0,
                                    color: blackColor.withOpacity(.2)),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: blackColor.withOpacity(.2)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: blackColor.withOpacity(.5)),
                              ),
                              hintText: LocaleKeys.contact_us_phone_tx.tr()),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter yout phone number!';
                            } else if (value.length < 11) {
                              return 'Too short for a phone number!';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                          onFieldSubmitted: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hint: LocaleKeys.contact_us_feed_tx.tr(),
                  maxLines: 4,
                  controller: _feedTextController,
                  onSave: (value) {},
                  onSubmit: (value) {},
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: size.width * .25,
                    child: CustomButton(
                        onTap: () {
                          formKey.currentState!.save();
                          if (formKey.currentState!.validate()) {
                            settingProvider.sendFeedToFireStore(
                                feedModel: FeedModel(
                                    name: _nameController.text,
                                    feedText: _feedTextController.text,
                                    phone: _phoneController.text));
                            GlobalMethods().navigateAndFinish(
                                context, const BottomBarPage());
                          } else {}
                        },
                        title: LocaleKeys.contact_us_save_tx.tr()))
              ],
            ),
          ),
        ),
      ),
    );
  }

  String generateCountryFlag() {
    String countryCode = 'eg';

    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }
}
