import 'package:flutter/material.dart';
import 'package:fos7a/data/models/place_model.dart';
import 'package:hive/hive.dart';

class FavouriteProvider extends ChangeNotifier {
  List<PlaceModel> placeList = [];
  Future<void> addPlaceToFavorite({required PlaceModel placeModel}) async {
    try {
      final favourites = PlaceModel()
        ..id = placeModel.id
        ..title = placeModel.title
        ..address = placeModel.address
        ..description = placeModel.description
        ..openingTime = placeModel.openingTime
        ..facebookLink = placeModel.facebookLink
        ..instagramLink = placeModel.instagramLink
        ..thumbnail = placeModel.thumbnail
        ..categoryId = placeModel.categoryId
        ..govermentId = placeModel.govermentId
        ..phone = placeModel.phone
        ..whatsupNumber = placeModel.whatsupNumber
        ..images = placeModel.images;

      Hive.box<PlaceModel>('favourite').add(favourites);
      placeList.add(favourites);
      // print('add done');
      notifyListeners();
    } catch (e) {
      //  print(e.toString());
    }
  }

  List<String> placeIdList = [];
  Future<void> fetchAllFavourite() async {
    try {
      placeIdList = [];
      for (var element in placeList) {
        placeIdList.add(element.id!);
      }
      //  print(placeIdList);
      notifyListeners();
    } catch (e) {
      //print(e.toString());
    }
  }

  void removePlace(PlaceModel placeModel) async {
    try {
      placeModel.delete();
    } catch (e) {
      // print(e.toString());
    }
  }

  // List<FavouriteModel> favouritePlacesList = [];
  // Future<void> findAllFavouritePlaces() async {
  //   try {
  //     favouritePlacesList = [];
  //     await FirebaseFirestore.instance
  //         .collection('Favourite')
  //         .get()
  //         .then((value) {
  //       value.docs.forEach((element) {
  //         favouritePlacesList.add(FavouriteModel.fromJson(element.data()));

  //         favouritePlacesList.forEach((element) {
  //           print(element.placeId);
  //         });
  //         //findAllPlaces();
  //       });
  //       notifyListeners();
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // List<PlaceModel> placeModelList = [];
  // Future<void> findAllPlaces() async {
  //   try {
  //     placeModelList = [];
  //     await FirebaseFirestore.instance.collection('Places').get().then((value) {
  //       value.docs.forEach((element) {
  //         placeModelList.add(PlaceModel.fromJson(element.data()));
  //         getFavouritePlaces();
  //       });
  //       notifyListeners();
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // String? placeId, id;
  // List<PlaceModel> favouritePlaceModels = [];
  // Future<void> getFavouritePlaces() async {
  //   try {
  //     favouritePlacesList.forEach((element) {
  //       print(element.placeId);
  //     });
  //     favouritePlacesList.forEach((element) {
  //       placeId = element.placeId;
  //     });
  //     favouritePlaceModels = [];
  //     placeModelList.forEach((element) {
  //       if (placeId == element.id) {
  //         favouritePlaceModels.add(element);

  //         notifyListeners();
  //       } else {}
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  void clearfavouriteList() async {
    Hive.box<PlaceModel>('favourite').clear;
    notifyListeners();
  }
}
