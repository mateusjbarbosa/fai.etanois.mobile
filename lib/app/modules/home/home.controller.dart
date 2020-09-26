import 'dart:async';

import 'package:etanois/core/utils/convertAsset.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'home.controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  Completer<GoogleMapController> mapController = Completer();

  @observable
  Position position;

  @observable
  CameraPosition _userLocation;

  @observable
  Set<Circle> circles;

  @observable
  Set<Marker> markers;

  @action
  Future<void> loadUserLocation() async {
    ConvertAsset convertAsset = new ConvertAsset();

    position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    _userLocation = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 18,
    );

    circles = Set.from([
      Circle(
        circleId: CircleId("userPreferencesRadius"),
        fillColor: Color(0xFFFF9800).withOpacity(0.2),
        strokeWidth: 0,
        center: LatLng(position.latitude, position.longitude),
        radius: 200,
        zIndex: 1,
      ),
    ]);

    markers = Set.from([
      Marker(
        markerId: MarkerId("userPosition"),
        position: LatLng(position.latitude, position.longitude),
        icon: BitmapDescriptor.fromBytes(
          await convertAsset.getBytesFromAsset(
            'assets/icons/user_location.png',
            48,
          ),
        ),
        anchor: Offset(0.5, 0.5),
        zIndex: 2,
      ),
    ]);

    _moveCamera();
  }

  @action
  Future<void> _moveCamera() async {
    GoogleMapController googleMapController = await mapController.future;

    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(_userLocation),
    );
  }
}
