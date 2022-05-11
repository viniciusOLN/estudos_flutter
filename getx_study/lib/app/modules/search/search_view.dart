import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/modules/search/search_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Searchpage extends GetView<SearchController> {
  const Searchpage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: controller.center.value,
          zoom: 14.0,
        ),
        onMapCreated: controller.onMapCreated,
        zoomGesturesEnabled: true,
        onCameraMove: controller.onCameraMove,
        myLocationEnabled: true,
        compassEnabled: false,
        myLocationButtonEnabled: true,
        mapToolbarEnabled: false,
      ),
    );
  }
}
