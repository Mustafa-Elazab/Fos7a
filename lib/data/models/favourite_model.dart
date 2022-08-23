import 'package:flutter/material.dart';

class FavouriteModel extends ChangeNotifier {
  String? id, placeId;

  FavouriteModel({required this.id, required this.placeId});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    placeId = json['placeId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'placeId': placeId,
    };
  }
}
