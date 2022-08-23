import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fos7a/constnats/utils.dart';
import 'package:fos7a/presentation/page/bottom_nav/bottom_bar_page.dart';
import 'package:fos7a/presentation/widget/global_methods.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';

import '../../../constnats/theme.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),
        () =>
            GlobalMethods().navigateAndFinish(context, const BottomBarPage()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = Utils(context).getScreenSize;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width,
            height: size.height / 2,
            child: Lottie.asset('assets/json/splash.json'),
          ),
          RichText(
              text: const TextSpan(
                  text: 'Fos',
                  style: TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                      fontFamily: "Maxima"),
                  children: <TextSpan>[
                TextSpan(
                  text: '7a',
                  style: TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: redColor,
                      fontFamily: "Maxima"),
                ),
              ]))
        ],
      ),
    );
  }
}
