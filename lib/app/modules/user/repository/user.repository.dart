import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:etanois/core/custom_dio/custom_dio.dart';

import 'package:etanois/app/modules/user/interface/user.interface.dart';

import 'package:etanois/app/modules/user/model/user.model.dart';

class UserRepository implements IUser {
  final CustomDio _dio;

  final String _userRequests = '/user';
  final String _authRequests = '/auth/token';

  UserRepository(this._dio);

  @override
  Future<Either<dynamic, User>> createUser(User user) async {
    try {
      Response _response =
          await _dio.client.post('$_userRequests/new', data: user.toJson());

      return Right(User.fromJson(_response.data['payload']['user']));
    } on DioError catch (e) {
      return Left(e.response.data);
    }
  }

  @override
  Future<Either<dynamic, User>> readUser(int id, String token) async {
    try {
      Response _response = await _dio.client.get(
        '$_userRequests/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return Right(User.fromJson(_response.data['payload']));
    } on DioError catch (e) {
      return Left(e.response.data);
    }
  }

  @override
  Future<Either<dynamic, User>> updateUser(User oldUser, User newUser) async {
    Map<String, dynamic> userJson = oldUser.toJson();

    userJson['name'] = newUser.name ?? oldUser.name;
    userJson['old_password'] = oldUser.password;
    userJson['new_password'] = newUser.password ?? oldUser.password;

    userJson.remove('id');
    userJson.remove('password');

    try {
      Response _response = await _dio.client.patch(
        '$_userRequests/${oldUser.id}',
        data: userJson,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${oldUser.token}',
          },
        ),
      );

      return Right(
        User.fromJson(
          _response.data['payload']['user'],
          newPassword: userJson['new_password'],
        ),
      );
    } on DioError catch (e) {
      return Left(e.response.data);
    }
  }

  @override
  Future<Either<dynamic, User>> deleteUser(int id, String token) async {
    try {
      Response _response = await _dio.client.delete(
        '$_userRequests/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return Right(User.fromJson(_response.data['payload']));
    } on DioError catch (e) {
      return Left(e.response.data);
    }
  }

  @override
  Future<Either<dynamic, Map<String, dynamic>>> generateUserToken(
    String password, {
    String email,
    String username,
  }) async {
    try {
      Response _response = await _dio.client.post('$_authRequests',
          data: {'email': email, 'username': username, 'password': password});

      return Right(_response.data['payload']);
    } on DioError catch (e) {
      return Left(e.response.data);
    }
  }

  @override
  Future<bool> findUserByEmail(String email) async {
    try {
      bool isFree = false;

      Response _response = await _dio.client.post(
          '$_userRequests/verify_use_of_credentials',
          data: {'email': email});

      String status = _response.data['payload']['use_of_credentials']['email'];

      if (status == 'free-to-use')
        isFree = true;
      else
        isFree = false;

      return isFree;
    } on DioError catch (e) {
      return e.response.data;
    }
  }

  @override
  Future<bool> findUserByUsername(String username) async {
    try {
      bool isFree = false;

      Response _response = await _dio.client.post(
          '$_userRequests/verify_use_of_credentials',
          data: {'username': username});

      String status =
          _response.data['payload']['use_of_credentials']['username'];

      if (status == 'free-to-use')
        isFree = true;
      else
        isFree = false;

      return isFree;
    } on DioError catch (e) {
      return e.response.data;
    }
  }
}
