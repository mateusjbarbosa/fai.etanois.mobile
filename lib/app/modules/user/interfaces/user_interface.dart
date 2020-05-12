import 'package:etanois/app/modules/user/models/user.dart';

abstract class IUser {
  Future createUser(User user);
  Future readUser(int id);
  Future updateUser(User user);
  Future deleteUser(int id);
}
