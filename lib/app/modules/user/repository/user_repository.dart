import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:etanois/app/modules/user/inteface/user_interface.dart';
import 'package:etanois/app/modules/user/model/user_model.dart';

import 'package:etanois/app/shared/custom_dio/custom_dio.dart';

class UserRepository implements IUser {
  final CustomDio _dio;

  final String _userRequests = '/user';
  final String _authRequests = '/auth/token';

  UserRepository(this._dio);

  @override
  Future<Either<dynamic, UserModel>> createUser(UserModel user) async {
    try {
      Response _response = await _dio.client.post('$_userRequests/new', data: user.toJson());

      return Right(UserModel.fromJson(_response.data['payload']['user']));
    } on DioError catch (e) {
      return Left(e.response.data);
    }
  }

  @override
  Future<Either<dynamic, UserModel>> readUser(int id, String token) async {
    try {
      Response _response = await _dio.client.get(
        '$_userRequests/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return Right(UserModel.fromJson(_response.data['payload']['user']));
    } on DioError catch (e) {
      return Left(e.response.data);
    }
  }

  @override
  Future<Either<dynamic, UserModel>> updateUser(UserModel user) async {
    try {
      Response _response = await _dio.client.put(
        '$_userRequests/$id',
        data: user.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer ${user.token}',
          },
        ),
      );

      return Right(UserModel.fromJson(_response.data['payload']['user']));
    } on DioError catch (e) {
      return Left(e.response.data);
    }
  }

  @override
  Future<Either<dynamic, UserModel>> deleteUser(int id, String token) async {
    try {
      Response _response = await _dio.client.delete(
        '$_userRequests/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return Right(_response.data['payload']);
    } on DioError catch (e) {
      return Left(e.response.data);
    }
  }

  @override
  Future<Either<dynamic, String>> generateUserToken({String email, String password}) async {
    try {
      Response _response = await _dio.client.post('$_authRequests', data: {'email': email, 'password': password});

      return Right(_response.data['token']);
    } on DioError catch (e) {
      return Left(e.response.data);
    }
  }

  @override
  Future<bool> findUserByEmail(String email) async {
    try {
      bool isFree = false;

      Response _response = await _dio.client.post('$_userRequests/verify_use_of_credentials', data: {'email': email});

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

      Response _response =
          await _dio.client.post('$_userRequests/verify_use_of_credentials', data: {'username': username});

      String status = _response.data['payload']['use_of_credentials']['username'];

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
