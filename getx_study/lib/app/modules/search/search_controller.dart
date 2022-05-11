import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchController extends GetxController {
  Rx<LatLng> center = const LatLng(0, 0).obs;
  Completer<GoogleMapController> gmapController = Completer();
  LatLng lastMapPosition;
  Position currentLocation;

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    center.value = LatLng(currentLocation.latitude, currentLocation.longitude);
  }

  void onMapCreated(GoogleMapController controller) {
    gmapController.complete(controller);
  }

  void onCameraMove(CameraPosition position) {
    lastMapPosition = position.target;
  }
}
