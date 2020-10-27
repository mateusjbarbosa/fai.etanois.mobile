// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$mapControllerAtom = Atom(name: '_HomeControllerBase.mapController');

  @override
  Completer<GoogleMapController> get mapController {
    _$mapControllerAtom.reportRead();
    return super.mapController;
  }

  @override
  set mapController(Completer<GoogleMapController> value) {
    _$mapControllerAtom.reportWrite(value, super.mapController, () {
      super.mapController = value;
    });
  }

  final _$positionAtom = Atom(name: '_HomeControllerBase.position');

  @override
  Position get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(Position value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  final _$userLocationAtom = Atom(name: '_HomeControllerBase.userLocation');

  @override
  CameraPosition get userLocation {
    _$userLocationAtom.reportRead();
    return super.userLocation;
  }

  @override
  set userLocation(CameraPosition value) {
    _$userLocationAtom.reportWrite(value, super.userLocation, () {
      super.userLocation = value;
    });
  }

  final _$userRadiusAtom = Atom(name: '_HomeControllerBase.userRadius');

  @override
  Set<Circle> get userRadius {
    _$userRadiusAtom.reportRead();
    return super.userRadius;
  }

  @override
  set userRadius(Set<Circle> value) {
    _$userRadiusAtom.reportWrite(value, super.userRadius, () {
      super.userRadius = value;
    });
  }

  final _$fuelStationsAtom = Atom(name: '_HomeControllerBase.fuelStations');

  @override
  Set<Marker> get fuelStations {
    _$fuelStationsAtom.reportRead();
    return super.fuelStations;
  }

  @override
  set fuelStations(Set<Marker> value) {
    _$fuelStationsAtom.reportWrite(value, super.fuelStations, () {
      super.fuelStations = value;
    });
  }

  final _$userAndFuelStationsAtom =
      Atom(name: '_HomeControllerBase.userAndFuelStations');

  @override
  Set<Marker> get userAndFuelStations {
    _$userAndFuelStationsAtom.reportRead();
    return super.userAndFuelStations;
  }

  @override
  set userAndFuelStations(Set<Marker> value) {
    _$userAndFuelStationsAtom.reportWrite(value, super.userAndFuelStations, () {
      super.userAndFuelStations = value;
    });
  }

  final _$loadUserLocationAsyncAction =
      AsyncAction('_HomeControllerBase.loadUserLocation');

  @override
  Future<void> loadUserLocation() {
    return _$loadUserLocationAsyncAction.run(() => super.loadUserLocation());
  }

  final _$_updateMarkerAsyncAction =
      AsyncAction('_HomeControllerBase._updateMarker');

  @override
  Future<void> _updateMarker() {
    return _$_updateMarkerAsyncAction.run(() => super._updateMarker());
  }

  final _$_moveCameraAsyncAction =
      AsyncAction('_HomeControllerBase._moveCamera');

  @override
  Future<void> _moveCamera() {
    return _$_moveCameraAsyncAction.run(() => super._moveCamera());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void _listenerUserLocation() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase._listenerUserLocation');
    try {
      return super._listenerUserLocation();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mapController: ${mapController},
position: ${position},
userLocation: ${userLocation},
userRadius: ${userRadius},
fuelStations: ${fuelStations},
userAndFuelStations: ${userAndFuelStations}
    ''';
  }
}
