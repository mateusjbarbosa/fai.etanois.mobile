import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/modules/chat/chat_module.dart';
import 'package:etanois/app/modules/home/home_module.dart';
import 'package:etanois/app/modules/menu/menu_module.dart';

import 'package:etanois/app/modules/home/home_controller.dart';
import 'package:etanois/app/modules/menu/menu_controller.dart';

import 'package:etanois/app/app_controller.dart';
import 'package:etanois/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MenuController()),
        Bind((i) => HomeController()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: ChatModule()),
        Router('/home', module: HomeModule()),
        Router('/menu', module: MenuModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
