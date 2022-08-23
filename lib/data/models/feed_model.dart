import 'package:flutter/material.dart';

class FeedModel extends ChangeNotifier {
  String? name, feedText,phone;


  FeedModel({required this.name, required this.feedText,required this.phone});

  FeedModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    feedText = json['feedText'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'feedText': feedText,
      'phone': phone,
    };
  }
}
