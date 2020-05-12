import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:etanois/app/shared/custom_dio/custom_dio.dart';

import 'package:etanois/app/modules/user/models/user.dart';

import 'package:etanois/app/modules/user/interfaces/user_interface.dart';

class UserRepository implements IUser {
  final CustomDio _dio;
  final String _userRequests = '/user';

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
  Future deleteUser(int id) {
    return null;
  }

  @override
  Future readUser(int id) {
    return null;
  }

  @override
  Future updateUser(User user) {
    return null;
  }
}
