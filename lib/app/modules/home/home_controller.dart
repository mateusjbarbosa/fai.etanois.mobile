import 'package:mobx/mobx.dart';

import 'package:etanois/app/modules/user/models/user.dart';

import 'package:etanois/app/modules/user/user_controller.dart';

import 'package:etanois/app/shared/utils/errors.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final UserController _userController;

  _HomeControllerBase(this._userController);

  void create() async {
    Errors errors = await _userController.createUser(
      User(
          name: 'Teste1234',
          email: 'teste@teste.com',
          password: '12345678',
          paymentMode: 'credit_card',
          cep: '12345678'),
    );

    print(errors.errors);
  }
}
