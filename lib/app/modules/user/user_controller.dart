import 'package:dartz/dartz.dart';

import 'package:etanois/app/modules/user/model/user_model.dart';

import 'package:etanois/app/modules/user/repository/user_repository.dart';

import 'package:etanois/app/shared/utils/error.dart';

class UserController {
  final UserRepository _repository;

  UserController(this._repository);

  UserModel _user = UserModel();

  UserModel get user {
    return _user;
  }

  String getFirstName() {
    return _user.name.split(' ')[0];
  }

  Future<Error> createUser(UserModel u) async {
    Error errors = Error();
    Either<dynamic, UserModel> response = await _repository.createUser(u);

    response.fold((err) => errors = Error.fromJson(err), (u) => _user = u);

    return errors;
  }

  Future<Error> readUser() async {
    Error errors = Error();

    Either<dynamic, UserModel> response = await _repository.readUser(_user.id, _user.token);

    response.fold((err) => errors = Error.fromJson(err), (u) => _user = u);

    return errors;
  }

  Future<Error> updateUser() async {
    Error errors = Error();

    Either<dynamic, UserModel> response = await _repository.updateUser(_user);

    response.fold((err) => errors = Error.fromJson(err), (u) => _user = u);

    return errors;
  }

  Future<Error> deleteUser() async {
    Error errors = Error();

    Either<dynamic, UserModel> response = await _repository.deleteUser(_user.id, _user.token);

    response.fold((err) => errors = Error.fromJson(err), (u) => _user = u);

    return errors;
  }

  Future<Error> generateUserToken(String password) async {
    Error errors = Error();

    Either<dynamic, String> response = await _repository.generateUserToken(email: _user.email, password: password);

    response.fold((err) => errors = Error.fromJson(err), (t) => _user.token);

    return errors;
  }

  Future<bool> findUserByEmail(String email) async {
    return await _repository.findUserByEmail(email);
  }

  Future<bool> findUserByUsername(String username) async {
    return await _repository.findUserByUsername(username);
  }
}
