import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/custom_dio/custom_dio.dart';

import 'app/modules/user/repository/user.repository.dart';
import 'package:etanois/app/modules/fuel_station/repository/fuel_station.repository.dart';
import 'package:etanois/app/modules/fuel_station/fuel_station.controller.dart';

import 'app/modules/user/user.controller.dart';

import 'package:etanois/app/app.module.dart';

void main() {
  GetIt getIt = GetIt.I;

  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  );
  getIt.registerLazySingleton<CustomDio>(
    () => CustomDio(GetIt.I.get<Dio>()),
  );
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepository(GetIt.I.get<CustomDio>()),
  );
  getIt.registerLazySingleton<UserController>(
    () => UserController(GetIt.I.get<UserRepository>()),
  );
  getIt.registerLazySingleton<FuelStationRepository>(
    () => FuelStationRepository(GetIt.I.get<CustomDio>()),
  );
  getIt.registerLazySingleton<FuelStationController>(
    () => FuelStationController(GetIt.I.get<FuelStationRepository>()),
  );

  runApp(ModularApp(module: AppModule()));
}
