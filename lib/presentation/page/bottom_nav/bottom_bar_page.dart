import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fos7a/provider/bottom_bar_provider.dart';
import 'package:fos7a/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  @override
  Widget build(BuildContext context) {
    var bottomBarProvider = Provider.of<BottomBarProvider>(context);
    List<BottomNavigationBarItem> bottomItem = [
      BottomNavigationBarItem(
        icon: Icon(bottomBarProvider.currentIndex == 0
            ? Typicons.home
            : Typicons.home_outline),
        label: LocaleKeys.home_tx.tr(),
      ),
      BottomNavigationBarItem(
        icon: Icon(bottomBarProvider.currentIndex == 1
            ? Typicons.heart_filled
            : Typicons.heart),

        label: LocaleKeys.favourite_tx.tr(),

        // Icon(IconlyBroken.buy)
      ),
      BottomNavigationBarItem(
        icon: Icon(bottomBarProvider.currentIndex == 2
            ? Typicons.cog
            : Typicons.cog_outline),
        label: LocaleKeys.settings_tx.tr(),
      ),
    ];
    return WillPopScope(
      onWillPop: () async {
        if (bottomBarProvider.currentIndex == 0) return true;
        setState(() {
          bottomBarProvider.currentIndex = 0;
        });
        return false;
      },
      child: Scaffold(
          body: bottomBarProvider.screens[bottomBarProvider.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: bottomItem,
            // backgroundColor:
            //     _isDark ? Theme.of(context).cardColor : Colors.white,
            type: BottomNavigationBarType.shifting,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            currentIndex: bottomBarProvider.currentIndex,
            // unselectedItemColor: _isDark ? Colors.white10 : Colors.black12,
            // selectedItemColor:
            //     _isDark ? Colors.lightBlue.shade200 : Colors.black87,
            onTap: (index) {
              bottomBarProvider.changeBottomBar(index);
            },
          )),
    );
  }
}
