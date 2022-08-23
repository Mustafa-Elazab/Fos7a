import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fos7a/constnats/theme.dart';
import 'package:fos7a/presentation/page/bottom_nav/bottom_bar_page.dart';
import 'package:fos7a/presentation/page/setting/ineer_screen/add_place_page.dart';
import 'package:fos7a/presentation/page/setting/ineer_screen/feed_us_page.dart';
import 'package:fos7a/presentation/widget/center_text.dart';
import 'package:fos7a/presentation/widget/custom_text.dart';
import 'package:fos7a/presentation/widget/global_methods.dart';
import 'package:fos7a/provider/setting_provider.dart';
import 'package:fos7a/translations/locale_keys.g.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<String> menuItems = <String>['Arabic', 'English'];

    String buttonName = Hive.box('settings').get('app_language') ?? 'English';
    List<DropdownMenuItem<String>> list = menuItems
        .map((String value) =>
            DropdownMenuItem<String>(value: value, child: Text(value)))
        .toList();
    return Consumer<SettingProvider>(
      builder: (context, settingProvider, _) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: CustomText(
                title: LocaleKeys.settings_tx.tr(),
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Quaker',
              ),
              elevation: 0.2,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 10.0,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          ValueListenableBuilder<Box>(
                            valueListenable: Hive.box('settings').listenable(),
                            builder: (context, box, widget) {
                              return SwitchListTile(
                                title: CustomText(
                                  title: settingProvider.isDark
                                      ? LocaleKeys.dark_mode_tx.tr()
                                      : LocaleKeys.light_mode_tx.tr(),
                                  fontSize: 18,
                                ),
                                secondary: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: appColorPrimary),
                                  child: Icon(
                                    settingProvider.isDark
                                        ? Icons.dark_mode_outlined
                                        : Icons.light_mode_outlined,
                                    color: whiteColor,
                                  ),
                                ),
                                onChanged: (bool value) {
                                  box.put('darkMode', value);
                                  settingProvider.changeAppMode(mode: value);
                                  // print(box.get('darkMode'));
                                },
                                value: box.get('darkMode', defaultValue: false),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: CustomText(
                              title: LocaleKeys.language_tx.tr(),
                              fontSize: 18,
                            ),
                            leading: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: appColorPrimary),
                              child: const Icon(
                                Typicons.sort_alphabet,
                                color: whiteColor,
                              ),
                            ),
                            trailing: ValueListenableBuilder<Box>(
                                valueListenable:
                                    Hive.box('settings').listenable(),
                                builder: (context, box, widget) {
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return DropdownButton(
                                        value: buttonName,
                                        items: list,
                                        onChanged: (String? value) async {
                                          setState(() {
                                            buttonName = value!;

                                            box.put('app_language', value);

                                            settingProvider.changeAppLanguage(
                                                language: buttonName);

                                            if (buttonName.toLowerCase() ==
                                                'Arabic'.toLowerCase()) {
                                              context.setLocale(
                                                  const Locale('ar'));
                                              GlobalMethods().navigateAndFinish(
                                                  context,
                                                  const BottomBarPage());
                                            } else {
                                              context.setLocale(
                                                  const Locale('en'));
                                              GlobalMethods().navigateAndFinish(
                                                  context,
                                                  const BottomBarPage());
                                              //       Phoenix.rebirth(context);
                                            }
                                          });

                                          // print(box.get('app_language'));
                                        });
                                  });
                                }),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              GlobalMethods()
                                  .navigateTo(context, const AddPlacePage());
                            },
                            child: ListTile(
                              title: CustomText(
                                title: LocaleKeys.add_place_tx.tr(),
                                fontSize: 18,
                              ),
                              leading: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: appColorPrimary),
                                  child: const Icon(
                                    Typicons.address,
                                    color: whiteColor,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              GlobalMethods().navigateTo(context, FeedUsPage());
                            },
                            child: ListTile(
                              title: CustomText(
                                title: LocaleKeys.contact_us_tx.tr(),
                                fontSize: 18,
                              ),
                              leading: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: appColorPrimary),
                                child: const Icon(
                                  Typicons.phone_outline,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: ListTile(
                              title: CustomText(
                                title: LocaleKeys.share__friend_tx.tr(),
                                fontSize: 18,
                              ),
                              leading: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: appColorPrimary),
                                child: const Icon(
                                  FontAwesome.share,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListTile(
                            title: CustomText(
                              title: LocaleKeys.about_tx.tr(),
                              fontSize: 18,
                            ),
                            leading: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: appColorPrimary),
                                child: const Icon(
                                  Typicons.info_outline,
                                  color: whiteColor,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: SizedBox(
              width: size.width * .2,
              height: size.height * .06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CenterText(
                    title: 'Develop By ',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                  CenterText(
                    title: ' Decode ${generateCountryFlag()}',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String generateCountryFlag() {
    String countryCode = 'eg';

    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }
}
