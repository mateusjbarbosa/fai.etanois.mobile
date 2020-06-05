import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/shared/custom_dio/custom_dio.dart';

import 'package:etanois/app/modules/user/repository/user_repository.dart';
import 'package:etanois/app/modules/user/user_controller.dart';

import 'package:etanois/app/app_module.dart';

void main() {
  GetIt getIt = GetIt.I;

  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<CustomDio>(() => CustomDio(GetIt.I.get<Dio>()));
  getIt.registerLazySingleton<UserRepository>(() => UserRepository(GetIt.I.get<CustomDio>()));
  getIt.registerLazySingleton<UserController>(() => UserController(GetIt.I.get<UserRepository>()));

  runApp(ModularApp(module: AppModule()));
}
