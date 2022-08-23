import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fos7a/data/models/feed_model.dart';

class SettingProvider extends ChangeNotifier {
  var isDark = false;

  void changeAppMode({bool? mode}) {
    if (mode != null) {
      isDark = mode;
      notifyListeners();
    } else {
      isDark = !isDark;
      notifyListeners();
    }
  }

  var lang = 'English';
  void changeAppLanguage({required String language}) {
    if (language.isNotEmpty) {
      lang = language;
    } else {
      lang = 'English';
    }
  }

  void sendFeedToFireStore({required FeedModel feedModel}) async {
    var id = feedModel.name! + feedModel.phone!;
    await FirebaseFirestore.instance
        .collection('Feeds')
        .doc(id)
        .set(feedModel.toJson());
    notifyListeners();
  }
}
