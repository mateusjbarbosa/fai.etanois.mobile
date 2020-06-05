import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:etanois/app/modules/user/user_controller.dart';

part 'menu_controller.g.dart';

class MenuController = _MenuControllerBase with _$MenuController;

abstract class _MenuControllerBase with Store {
  UserController userController = GetIt.I.get<UserController>();
}
