import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app.controller.dart';

import 'package:etanois/app/modules/home/home.module.dart';
import 'package:etanois/app/modules/chat/chat_module.dart';

import 'package:etanois/app/app.widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router("/", module: ChatModule()),
        Router("/home", module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
