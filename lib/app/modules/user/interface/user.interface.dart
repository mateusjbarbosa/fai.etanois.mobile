import 'package:dartz/dartz.dart';
import 'package:etanois/app/modules/user/model/user.model.dart';

abstract class IUser {
  Future<Either<dynamic, User>> createUser(User user);
  Future<Either<dynamic, User>> readUser(int id, String token);
  Future<Either<dynamic, User>> updateUser(User user);
  Future<Either<dynamic, User>> deleteUser(int id, String token);

  Future<Either<dynamic, Map<String, dynamic>>> generateUserToken(
    String password, {
    String email,
    String username,
  });

  Future<bool> findUserByEmail(String email);
  Future<bool> findUserByUsername(String username);
}
