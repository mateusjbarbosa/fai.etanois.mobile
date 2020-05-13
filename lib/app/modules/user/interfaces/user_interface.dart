import 'package:dartz/dartz.dart';

import 'package:etanois/app/modules/user/models/user.dart';

abstract class IUser {
  Future<Either<dynamic, User>> createUser(User user);
  Future<Either<dynamic, User>> readUser(int id, String token);
  Future<Either<dynamic, User>> updateUser(User user);
  Future<Either<dynamic, User>> deleteUser(int id, String token);
  Future<Either<dynamic, String>> generateUserToken({String email, String phoneNumber, String password});
}
