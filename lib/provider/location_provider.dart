import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationProvider extends ChangeNotifier {
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(37.42796, -122.08574), zoom: 14.0);
  String address = 'Your Location';
  Set<Marker> markersList = {};

  late GoogleMapController googleMapController;

  Future<Position> determinePosition() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      await Geolocator.requestPermission();
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    //   print(placemarks);
    Placemark place = placemarks[0];
    address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    //print(Address);
    notifyListeners();
  }

  // // Future<void> goToLake() async {
  // //   final GoogleMapController controller = await _controller.future;
  // //   controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  // // }

  // // Future<void> handlePressButton({context, scafoldKey, apiKey}) async {
  // //   Prediction? p = await PlacesAutocomplete.show(
  // //       context: context,
  // //       apiKey: apiKey,
  // //       onError: onError,
  // //       mode: _mode,
  // //       language: 'en',
  // //       strictbounds: false,
  // //       types: [""],
  // //       decoration: InputDecoration(
  // //           hintText: 'Search',
  // //           focusedBorder: OutlineInputBorder(
  // //               borderRadius: BorderRadius.circular(20),
  // //               borderSide: BorderSide(color: Colors.white))),
  // //       components: [
  // //         Component(Component.country, "pk"),
  // //         Component(Component.country, "usa")
  // //       ]);

  // //   displayPrediction(p!, scafoldKey.currentState);
  // // }

  // // void onError(PlacesAutocompleteResponse response) {}

  // // Future<void> displayPrediction(
  // //     Prediction p, ScaffoldState? currentState) async {
  // //   GoogleMapsPlaces places = GoogleMapsPlaces(
  // //       apiKey: '', apiHeaders: await const GoogleApiHeaders().getHeaders());

  // //   PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);

  // //   final lat = detail.result.geometry!.location.lat;
  // //   final lng = detail.result.geometry!.location.lng;

  // //   markersList.clear();
  // //   markersList.add(Marker(
  // //       markerId: const MarkerId("0"),
  // //       position: LatLng(lat, lng),
  // //       infoWindow: InfoWindow(title: detail.result.name)));

  // //   update();

  // //   googleMapController
  // //       .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
  // // }
}
