import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/modules/editar_perfil/editar_perfil.controller.dart';
import 'package:etanois/app/modules/editar_perfil/editar_perfil.page.dart';

class EditarPerfilModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => EditarPerfilController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => EditarPerfilPage()),
      ];

  static Inject get to => Inject<EditarPerfilModule>.of();
}
