import 'package:mobx/mobx.dart';

import 'package:dartz/dartz.dart';

import 'package:etanois/app/modules/user/models/user.dart';

import 'package:etanois/app/modules/user/repositories/user_repository.dart';

import 'package:etanois/app/shared/utils/errors.dart';

part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  final UserRepository _repository;

  _UserControllerBase(this._repository);

  @observable
  User user = User();

  @action
  setUser(User u) => user = u;

  Future<Errors> createUser(User u) async {
    Errors errors = Errors();
    Either<dynamic, User> response = await _repository.createUser(u);

    response.fold((err) => errors = Errors.fromJson(err), (user) => user = u);

    return errors;
  }
}
