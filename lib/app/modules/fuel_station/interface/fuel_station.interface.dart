import 'package:dartz/dartz.dart';
import 'package:etanois/app/modules/fuel_station/model/fuel_station.model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class IFuelStation {
  Future<Either<dynamic, List<FuelStation>>> readFuelStations(
    LatLng target,
    double radius,
    int page,
    String token,
  );
}
