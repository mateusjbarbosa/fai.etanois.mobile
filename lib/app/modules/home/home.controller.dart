import 'dart:async';
import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

import 'package:etanois/app/modules/user/user.controller.dart';

import 'package:etanois/app/modules/fuel-station/fuel_station.controller.dart';

import 'package:etanois/core/utils/convertAsset.dart';

part 'home.controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  UserController _userController = GetIt.I.get<UserController>();

  @observable
  Completer<GoogleMapController> mapController = Completer();

  @observable
  Position position;

  @observable
  CameraPosition userLocation;

  @observable
  Set<Circle> userRadius;

  @observable
  Set<Marker> fuelStations;

  @observable
  Set<Marker> userAndFuelStations;

  @action
  Future<void> loadUserLocation() async {
    position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    userLocation = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 16,
    );

    _listenerUserLocation();
  }

  @action
  Future<void> _updateMarker() async {
    BitmapDescriptor _iconUser =
        await _convertIcon('assets/icons/user_location.png', 48);
    BitmapDescriptor _iconFuelStation =
        await _convertIcon('assets/icons/fuel_station.png', 32);

    FuelStationController fuelStationController =
        GetIt.I.get<FuelStationController>();

    fuelStationController.readFuelStations(
      userLocation.target,
      1,
      1,
      _userController.user.token,
    );

    Marker _userPosition = Marker(
      markerId: MarkerId("userPosition"),
      position: userLocation.target,
      icon: _iconUser,
      anchor: Offset(0.5, 0.5),
      zIndex: 2,
    );

    Circle _userRadius = Circle(
      circleId: CircleId("userPreferencesRadius"),
      fillColor: Color(0xFFFF9800).withOpacity(0.2),
      strokeWidth: 0,
      center: userLocation.target,
      radius: _userController.user.searchDistanceWithoutRoute.toDouble(),
      zIndex: 1,
    );

    List<Marker> _userAndFuelStations = List<Marker>();

    _userAndFuelStations.add(_userPosition);

    fuelStationController.fuelStations.forEach(
      (fs) {
        Marker _fs = Marker(
          markerId: MarkerId("fs_${fs.name}_${fs.id}_${fs.lat}_${fs.lng}"),
          position: LatLng(fs.lat, fs.lng),
          icon: _iconFuelStation,
          anchor: Offset(0.5, 0.5),
          zIndex: 2,
        );

        _userAndFuelStations.add(_fs);
      },
    );

    if (userAndFuelStations != null) {
      userAndFuelStations = Set.from(_userAndFuelStations);
    } else {
      userAndFuelStations = Set.from(_userAndFuelStations);
    }

    if (userRadius != null) {
      userRadius = Set.from([_userRadius]);
    } else {
      userRadius = Set.from([_userRadius]);
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
          zoom: 16,
        );

        _userController.user.userLocation = userLocation.target;

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

  Future<BitmapDescriptor> _convertIcon(String path, int size) async {
    ConvertAsset convertAsset = ConvertAsset();

    return BitmapDescriptor.fromBytes(
      await convertAsset.getBytesFromAsset(path, size),
    );
  }
}
