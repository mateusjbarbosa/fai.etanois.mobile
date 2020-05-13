import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:etanois/app/shared/custom_dio/custom_dio.dart';

import 'package:etanois/app/modules/user/models/user.dart';

import 'package:etanois/app/modules/user/interfaces/user_interface.dart';

class UserRepository implements IUser {
  final CustomDio _dio;
  final String _userRequests = '/user';
  final String _authRequests = '/auth/token';

  UserRepository(this._dio);

  @override
  Future<Either<dynamic, User>> createUser(User user) async {
    try {
      Response _response = await _dio.client.post('$_userRequests/new', data: user.toJson());

      return Right(User.fromJson(_response.data['payload']));
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
  Future updateUser(User user) {
    return null;
  }

  @override
  Future deleteUser(int id) {
    return null;
  }

  @override
  Future<Either<dynamic, String>> generateUserToken({String email, String phoneNumber, String password}) async {
    try {
      Response _response = await _dio.client
          .post('$_authRequests', data: {'email': email, 'phone_number': phoneNumber, 'password': password});

      return Right(_response.data['token']);
    } on DioError catch (e) {
      return Left(e.response.data);
    }
  }
}
