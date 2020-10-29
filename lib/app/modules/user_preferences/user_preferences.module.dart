import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/modules/user_preferences/user_preferences.controller.dart';

import 'user_preferences.page.dart';

class UserPreferencesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UserPreferencesController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => UserPreferencesPage()),
      ];

  static Inject get to => Inject<UserPreferencesModule>.of();
}
