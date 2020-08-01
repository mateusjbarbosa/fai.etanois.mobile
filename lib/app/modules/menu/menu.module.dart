import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/modules/editar_perfil/editar_perfil.module.dart';

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
        Router('/editar-perfil', module: EditarPerfilModule()),
      ];

  static Inject get to => Inject<MenuModule>.of();
}
