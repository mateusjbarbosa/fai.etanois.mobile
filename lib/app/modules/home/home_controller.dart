import 'dart:async';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition userPosition;

  String mapStyle = '';

  void setMapStyle() => rootBundle.loadString('assets/map.style.txt').then((s) => mapStyle = s);

  onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);

    print(controller);

    _controller.complete(controller);
  }

  CameraPosition onInitPosition() {
    CameraPosition position = CameraPosition(
      target: LatLng(-22.260342, -45.702316),
      zoom: 16,
      tilt: 0,
    );

    userPosition = position;

    return position;
  }

  moveCamera() async {
    GoogleMapController camera = await _controller.future;

    camera.animateCamera(
      CameraUpdate.newCameraPosition(userPosition),
    );
  }

  recoverUserLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    CameraPosition newPosition = CameraPosition(
      target: LatLng(
        position.latitude,
        position.longitude,
      ),
      zoom: 20,
      tilt: 0,
    );

    userPosition = newPosition;

    moveCamera();
  }

  onListenerUserLocation() async {
    Geolocator geolocator = Geolocator();
    LocationOptions locationOptions = LocationOptions(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
      timeInterval: 10,
    );

    geolocator.getPositionStream(locationOptions).listen((position) {
      CameraPosition newPosition = CameraPosition(
        target: LatLng(position.altitude, position.longitude),
      );

      userPosition = newPosition;

      moveCamera();
    });
  }
}
