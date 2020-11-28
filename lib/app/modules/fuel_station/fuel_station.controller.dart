import 'package:dartz/dartz.dart';
import 'package:etanois/app/modules/fuel_station/model/fuel_station.model.dart';
import 'package:etanois/app/modules/fuel_station/repository/fuel_station.repository.dart';
import 'package:etanois/core/utils/error.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FuelStationController {
  final FuelStationRepository _repository;

  FuelStationController(this._repository);

  List<FuelStation> fuelStations = List<FuelStation>();

  Future<Error> readFuelStations(
    LatLng target,
    double radius,
    int page,
    String token,
  ) async {
    Error errors = Error();

    Either<dynamic, List<FuelStation>> response =
        await _repository.readFuelStations(target, radius, page, token);

    response.fold((err) => errors = Error.fromJson(err), (fs) {
      fuelStations.clear();
      fuelStations.addAll(fs);
    });

    return errors;
  }
}
