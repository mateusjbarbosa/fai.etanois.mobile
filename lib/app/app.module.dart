import 'package:etanois/app/modules/splash/splash.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app.controller.dart';

import 'package:etanois/app/modules/home/home.module.dart';
import 'package:etanois/app/modules/chat/chat_module.dart';
import 'package:etanois/app/modules/menu/menu.module.dart';
import 'package:etanois/app/modules/radar/radar.module.dart';

import 'package:etanois/core/utils/works.page.dart';

import 'package:etanois/app/app.widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => Splash()),
        Router(
          '/chat',
          module: ChatModule(),
          transition: TransitionType.upToDown,
        ),
        Router('/works', child: (_, args) => WorksPage()),
        Router('/home', module: HomeModule()),
        Router('/radar', module: RadarModule()),
        Router('/menu', module: MenuModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
