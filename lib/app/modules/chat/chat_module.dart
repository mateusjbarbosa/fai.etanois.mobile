import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/modules/chat/chat_controller.dart';
import 'package:etanois/app/modules/chat/chat_page.dart';

class ChatModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ChatController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ChatPage()),
      ];

  static Inject get to => Inject<ChatModule>.of();
}
