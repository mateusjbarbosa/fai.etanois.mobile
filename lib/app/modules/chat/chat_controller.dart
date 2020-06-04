import 'package:etanois/app/modules/chat/controllers/create_user/create_user_controller.dart';
import 'package:mobx/mobx.dart';

part 'chat_controller.g.dart';

class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {
  final CreateUserController createUserController;

  _ChatControllerBase(this.createUserController);
}
