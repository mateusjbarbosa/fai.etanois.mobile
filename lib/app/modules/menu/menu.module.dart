import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/modules/update_user/update_user.module.dart';

import 'package:etanois/app/modules/menu/menu.controller.dart';
import 'package:etanois/app/modules/menu/menu.page.dart';

class MenuModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MenuController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => MenuPage()),
        Router('/update-user', module: UpdateUserModule()),
      ];

  static Inject get to => Inject<MenuModule>.of();
}
