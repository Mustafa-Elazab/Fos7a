// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fos7a/constnats/theme.dart';
import 'package:fos7a/constnats/utils.dart';
import 'package:fos7a/provider/location_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class LocationPlace extends StatelessWidget {
  LocationPlace({Key? key}) : super(key: key);

  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(31.242222, 30.128611), zoom: 14);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    var size = Utils(context).getScreenSize;
    var locationProvider = Provider.of<LocationProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialCameraPosition,
            markers: markers,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              googleMapController = controller;
            },
          ),
          Positioned(
            bottom: size.height * .05,
            right: 20,
            child: FloatingActionButton(
              child: const Icon(
                Typicons.location,
                color: greenLight,
              ),
              onPressed: () async {
                Position position = await locationProvider.determinePosition();
                //   print(position);
                locationProvider.getAddressFromLatLong(position);
                googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(CameraPosition(
                        target: LatLng(position.latitude, position.longitude),
                        zoom: 14.0)));

                markers.clear();

                markers.add(Marker(
                    markerId: const MarkerId('currentLocation'),
                    position: LatLng(position.latitude, position.longitude)));
              },
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
