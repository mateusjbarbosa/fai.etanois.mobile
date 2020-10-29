import 'package:flutter_modular/flutter_modular.dart';

import 'radar.controller.dart';

import 'radar.page.dart';

class RadarModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RadarController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => RadarPage()),
      ];

  static Inject get to => Inject<RadarModule>.of();
}
