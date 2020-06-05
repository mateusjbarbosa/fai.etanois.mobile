import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/modules/chat/controllers/create_user/create_user_controller.dart';
import 'package:etanois/app/modules/chat/chat_controller.dart';
import 'package:etanois/app/modules/chat/chat_page.dart';

class ChatModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ChatController(i.get())),
        Bind((i) => CreateUserController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ChatPage()),
      ];

  static Inject get to => Inject<ChatModule>.of();
}
