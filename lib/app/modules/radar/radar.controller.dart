import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/modules/fuel_station/fuel_station.controller.dart';
import 'package:etanois/app/modules/user/user.controller.dart';

part 'radar.controller.g.dart';

@Injectable()
class RadarController = _RadarControllerBase with _$RadarController;

abstract class _RadarControllerBase with Store {
  FuelStationController fuelStationController =
      GetIt.I<FuelStationController>();
  UserController userController = GetIt.I<UserController>();

  double _degreesToRadians(degrees) {
    return degrees * pi / 180;
  }

  String distanceInKmBetweenEarthCoordinates(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    int earthRadiusKm = 6371;

    double dLat = _degreesToRadians(lat2 - lat1);
    double dLon = _degreesToRadians(lon2 - lon1);

    lat1 = _degreesToRadians(lat1);
    lat2 = _degreesToRadians(lat2);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        sin(dLon / 2) * sin(dLon / 2) * cos(lat1) * cos(lat2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return (earthRadiusKm * c).toStringAsFixed(2);
  }
}
