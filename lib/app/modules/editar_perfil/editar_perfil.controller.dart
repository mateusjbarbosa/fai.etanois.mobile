import 'package:mobx/mobx.dart';

import 'package:get_it/get_it.dart';

import 'package:etanois/app/modules/user/model/user.model.dart';

import '../user/user.controller.dart';

part 'editar_perfil.controller.g.dart';

class EditarPerfilController = _EditarPerfilControllerBase
    with _$EditarPerfilController;

abstract class _EditarPerfilControllerBase with Store {
  UserController userController = GetIt.I.get<UserController>();

  User editUser = User();

  @observable
  bool saveChanges = false;

  @action
  void haveChanges(bool c) {
    saveChanges = c;
  }
}
