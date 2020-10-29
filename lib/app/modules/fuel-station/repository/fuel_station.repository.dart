import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:etanois/app/modules/fuel-station/interface/fuel_station.interface.dart';
import 'package:etanois/app/modules/fuel-station/model/fuel_station.model.dart';
import 'package:etanois/core/custom_dio/custom_dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FuelStationRepository implements IFuelStation {
  final CustomDio _dio;

  final String _fuelStationRequests = '/fuel_station';

  FuelStationRepository(this._dio);

  @override
  Future<Either<dynamic, List<FuelStation>>> readFuelStations(
    LatLng target,
    double radius,
    int page,
    String token,
  ) async {
    List<FuelStation> fuelStations = List<FuelStation>();

    try {
      Response _response = await _dio.client.get(
        '$_fuelStationRequests/read-by-coordinate/${target.latitude}/${target.longitude}/$radius/$page',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      _response.data['payload']['fuel_stations'].forEach(
        (item) {
          FuelStation fs = FuelStation.fromJson(item);

          if (fs.availableFuels.isNotEmpty) fuelStations.add(fs);
        },
      );

      return Right(fuelStations);
    } on DioError catch (e) {
      return Left(e.response.data);
    }
  }
}
