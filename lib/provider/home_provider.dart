import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fos7a/data/models/category_model.dart';
import 'package:fos7a/data/models/goverment_model.dart';
import 'package:fos7a/data/models/place_model.dart';

class HomeProvider extends ChangeNotifier {
  String govermentId = '1';

  bool isLiked = false;
  List<PlaceModel> placeList = [];
  List<CategoryModel> get categoryList {
    return LocalCategoryData.categoryList;
  }

  List<GovermentModel> get govermentList {
    return GovermentLocalData.govermentList;
  }

  List<PlaceModel> findPlaceByCategory(String categoryId) {
    List<PlaceModel> categoryProduct = LocalPlaceData.placeList
        .where((element) =>
            element.categoryId!.toString().contains(categoryId.toLowerCase()))
        .toList();
    return categoryProduct;
  }

  List<PlaceModel> placeByGoverment = [];

  List<PlaceModel> placeByCategoryAndGoverment = [];

  List<PlaceModel> listPlaceModel = [];

  Future<void> findPlaceByGov() async {
    placeByGoverment = [];
    await FirebaseFirestore.instance
        .collection('Places')
        .where('govermentId', isEqualTo: govermentId.toLowerCase())
        .get()
        .then((value) {
      for (var element in value.docs) {
        placeByGoverment.add(PlaceModel.fromJson(element.data()));
      }
    });

    notifyListeners();
  }

  Future<void> findPlaceByGovAndCategory(var categoryId) async {
    placeByCategoryAndGoverment = [];
    await FirebaseFirestore.instance
        .collection('Places')
        .where('govermentId', isEqualTo: govermentId.toLowerCase())
        .where('categoryId', isEqualTo: categoryId.toLowerCase())
        .get()
        .then((value) {
      for (var element in value.docs) {
        placeByCategoryAndGoverment.add(PlaceModel.fromJson(element.data()));
      }
      notifyListeners();
    });

    notifyListeners();
  }
}
