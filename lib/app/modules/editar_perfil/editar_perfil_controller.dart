import 'package:mobx/mobx.dart';

import 'package:get_it/get_it.dart';

import 'package:etanois/app/modules/user/model/user_model.dart';

import 'package:etanois/app/modules/user/user_controller.dart';

part 'editar_perfil_controller.g.dart';

class EditarPerfilController = _EditarPerfilControllerBase with _$EditarPerfilController;

abstract class _EditarPerfilControllerBase with Store {
  UserController userController = GetIt.I.get<UserController>();

  UserModel editUser = UserModel();

  @observable
  bool saveChanges = false;

  @action
  void haveChanges(bool c) {
    saveChanges = c;
  }
}
