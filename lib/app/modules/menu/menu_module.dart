import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/./modules/menu/menu_controller.dart';
import 'package:etanois/app/./modules/menu/menu_page.dart';

class MenuModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MenuController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => MenuPage()),
      ];

  static Inject get to => Inject<MenuModule>.of();
}
