import 'package:flutter/material.dart';
import 'package:fos7a/presentation/page/favourite/favourite_page.dart';
import 'package:fos7a/presentation/page/home/home_page.dart';
import 'package:fos7a/presentation/page/setting/setting_page.dart';

class BottomBarProvider extends ChangeNotifier {
  int currentIndex = 0;

  void changeBottomBar(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<Widget> screens = const [
    HomePage(),
    FavouritePage(),
    SettingPage(),
  ];
}
