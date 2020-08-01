import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/modules/update_user/update_user.page.dart';
import 'package:etanois/app/modules/update_user/update_user.controller.dart';

class UpdateUserModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UpdateUserController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => UpdateUserPage()),
      ];

  static Inject get to => Inject<UpdateUserModule>.of();
}
