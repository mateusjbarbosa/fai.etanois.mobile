import 'package:dartz/dartz.dart';

import 'package:etanois/app/modules/user/models/user.dart';

abstract class IUser {
  Future<Either<dynamic, User>> createUser(User user);
  Future<Either<dynamic, User>> readUser(int id, String token);
  Future updateUser(User user);
  Future deleteUser(int id);
  Future<Either<dynamic, String>> generateUserToken({String email, String phoneNumber, String password});
}
