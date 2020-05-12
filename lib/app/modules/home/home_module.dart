import 'package:flutter_modular/flutter_modular.dart';

import 'package:dio/dio.dart';

import 'package:etanois/app/shared/custom_dio/custom_dio.dart';

import 'package:etanois/app/modules/user/repositories/user_repository.dart';

import 'package:etanois/app/modules/home/home_controller.dart';
import 'package:etanois/app/modules/user/user_controller.dart';

import 'package:etanois/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind((i) => UserController(i.get())),
        Bind((i) => UserRepository(i.get())),
        Bind((i) => CustomDio(i.get())),
        Bind((i) => Dio()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
