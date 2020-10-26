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
  CameraPosition userLocation;

  @observable
  Set<Circle> circles;

  @observable
  Set<Marker> markers;

  @action
  Future<void> loadUserLocation() async {
    position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    userLocation = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 18,
    );

    _listenerUserLocation();
  }

  @action
  Future<void> _updateMarker() async {
    ConvertAsset convertAsset = new ConvertAsset();

    Marker marker = Marker(
      markerId: MarkerId("userPosition"),
      position: userLocation.target,
      icon: BitmapDescriptor.fromBytes(
        await convertAsset.getBytesFromAsset(
          'assets/icons/user_location.png',
          48,
        ),
      ),
      anchor: Offset(0.5, 0.5),
      zIndex: 2,
    );

    Circle circle = Circle(
      circleId: CircleId("userPreferencesRadius"),
      fillColor: Color(0xFFFF9800).withOpacity(0.2),
      strokeWidth: 0,
      center: userLocation.target,
      radius: 200,
      zIndex: 1,
    );

    if (markers != null) {
      markers.remove(markers.first);
      markers = Set.from([marker]);
    } else {
      markers = Set.from([marker]);
    }

    if (circles != null) {
      circles.remove(circles.first);
      circles = Set.from([circle]);
    } else {
      circles = Set.from([circle]);
    }
  }

  @action
  void _listenerUserLocation() {
    GeolocatorPlatform geolocator = GeolocatorPlatform.instance;

    geolocator
        .getPositionStream(
            desiredAccuracy: LocationAccuracy.bestForNavigation,
            distanceFilter: 5)
        .listen(
      (Position position) {
        this.userLocation = CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 17,
        );

        _updateMarker();
        _moveCamera();
      },
    );
  }

  @action
  Future<void> _moveCamera() async {
    GoogleMapController googleMapController = await mapController.future;

    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(userLocation),
    );
  }
}
