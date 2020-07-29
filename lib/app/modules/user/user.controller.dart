import 'package:dartz/dartz.dart';

import 'package:etanois/app/modules/user/repository/user.repository.dart';

import 'package:etanois/core/utils/error.dart';

import 'package:etanois/app/modules/user/model/user.model.dart';

class UserController {
  final UserRepository _repository;

  UserController(this._repository);

  User _user = User();

  User get user {
    return _user;
  }

  Future<Error> createUser(User u) async {
    Error errors = Error();
    Either<dynamic, User> response = await _repository.createUser(u);

    response.fold((err) => errors = Error.fromJson(err), (u) => _user = u);

    return errors;
  }

  Future<Error> readUser() async {
    Error errors = Error();

    Either<dynamic, User> response =
        await _repository.readUser(_user.id, _user.token);

    response.fold((err) => errors = Error.fromJson(err), (u) => _user = u);

    return errors;
  }

  Future<Error> updateUser() async {
    Error errors = Error();

    Either<dynamic, User> response = await _repository.updateUser(_user);

    response.fold((err) => errors = Error.fromJson(err), (u) => _user = u);

    return errors;
  }

  Future<Error> deleteUser() async {
    Error errors = Error();

    Either<dynamic, User> response =
        await _repository.deleteUser(_user.id, _user.token);

    response.fold((err) => errors = Error.fromJson(err), (u) => _user = u);

    return errors;
  }

  Future<Error> generateUserToken() async {
    Error errors = Error();

    Either<dynamic, Map<String, dynamic>> response = await _repository
        .generateUserToken(email: _user.email, password: _user.password);

    response.fold((err) => errors = Error.fromJson(err), (u) {
      _user.token = u['token'];
    });

    return errors;
  }

  Future<bool> findUserByEmail(String email) async {
    return await _repository.findUserByEmail(email);
  }

  Future<bool> findUserByUsername(String username) async {
    return await _repository.findUserByUsername(username);
  }
}
