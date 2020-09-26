import 'dart:convert';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import 'package:etanois/app/modules/user/repository/user.repository.dart';

import 'package:etanois/core/utils/error.dart';

import 'package:etanois/app/modules/user/model/user.model.dart';

import 'package:flutter/services.dart';

class UserController {
  final UserRepository _repository;

  UserController(this._repository);

  User _user = User();

  User get user {
    return _user;
  }

  String getFirstName() {
    return _user.name.split(' ')[0];
  }

  Uint8List getImage() {
    return base64.decode(_user.image);
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

    String password = _user.password;
    String token = _user.token;

    response.fold((err) => errors = Error.fromJson(err), (u) {
      _user = u;
      _user.password = password;
      _user.token = token;
    });

    // TODO: Remove
    ByteData bytes =
        await rootBundle.load('assets/icons/default_user_photo.png');
    ByteBuffer buffer = bytes.buffer;
    _user.image = base64.encode(Uint8List.view(buffer));

    return errors;
  }

  Future<Error> updateUser(User user) async {
    Error errors = Error();

    Either<dynamic, User> response = await _repository.updateUser(_user, user);

    response.fold((err) => errors = Error.fromJson(err), (u) => _user = u);

    // TODO: Remove
    ByteData bytes =
        await rootBundle.load('assets/icons/default_user_photo.png');
    ByteBuffer buffer = bytes.buffer;
    _user.image = base64.encode(Uint8List.view(buffer));

    return errors;
  }

  Future<Error> deleteUser() async {
    Error errors = Error();

    Either<dynamic, User> response =
        await _repository.deleteUser(_user.id, _user.token);

    response.fold((err) => errors = Error.fromJson(err), (u) => _user = u);

    // TODO: Remove
    ByteData bytes =
        await rootBundle.load('assets/icons/default_user_photo.png');
    ByteBuffer buffer = bytes.buffer;
    _user.image = base64.encode(Uint8List.view(buffer));

    return errors;
  }

  Future<Error> generateUserToken(
    String password, {
    String email,
    String username,
  }) async {
    Error errors = Error();

    Either<dynamic, Map<String, dynamic>> response = await _repository
        .generateUserToken(password, email: email, username: username);

    response.fold((err) {
      errors.code = 'E-000';
      errors.messages = [
        {'status': err}
      ];
    }, (u) {
      _user.id = u['id'];
      _user.token = u['token'];
      _user.password = password;
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
