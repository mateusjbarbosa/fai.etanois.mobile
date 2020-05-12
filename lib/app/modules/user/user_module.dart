import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/modules/user/user_controller.dart';

class UserModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UserController(i.get())),
      ];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<UserModule>.of();
}
