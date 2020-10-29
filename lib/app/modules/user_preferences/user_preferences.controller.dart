import 'package:etanois/app/modules/user/user.controller.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'user_preferences.controller.g.dart';

@Injectable()
class UserPreferencesController = _UserPreferencesControllerBase
    with _$UserPreferencesController;

abstract class _UserPreferencesControllerBase with Store {
  UserController userController = GetIt.I<UserController>();
}
