import 'package:dartz/dartz.dart';

import 'package:etanois/app/modules/user/model/user_model.dart';

abstract class IUser {
  Future<Either<dynamic, UserModel>> createUser(UserModel user);
  Future<Either<dynamic, UserModel>> readUser(int id, String token);
  Future<Either<dynamic, UserModel>> updateUser(UserModel user);
  Future<Either<dynamic, UserModel>> deleteUser(int id, String token);

  Future<Either<dynamic, Map<String, dynamic>>> generateUserToken({String email, String password});

  Future<bool> findUserByEmail(String email);
  Future<bool> findUserByUsername(String username);
}
