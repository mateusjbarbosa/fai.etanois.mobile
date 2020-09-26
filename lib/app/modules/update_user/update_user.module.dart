import 'package:etanois/app/modules/update_user/pages/delete.page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/modules/update_user/update_user.page.dart';
import 'package:etanois/app/modules/update_user/pages/update.page.dart';
import 'package:etanois/app/modules/update_user/update_user.controller.dart';

class UpdateUserModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UpdateUserController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => UpdateUserPage()),
        Router('/update', child: (_, args) => UpdatePage()),
        Router('/delete', child: (_, args) => DeletePage()),
      ];

  static Inject get to => Inject<UpdateUserModule>.of();
}
