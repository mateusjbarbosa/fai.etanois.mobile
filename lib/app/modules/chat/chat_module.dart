import 'package:dio/dio.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/shared/custom_dio/custom_dio.dart';

import 'package:etanois/app/modules/chat/controllers/create_user/create_user_controller.dart';
import 'package:etanois/app/modules/chat/chat_controller.dart';
import 'package:etanois/app/modules/chat/chat_page.dart';

import 'package:etanois/app/modules/user/repository/user_repository.dart';
import 'package:etanois/app/modules/user/user_controller.dart';

class ChatModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ChatController(i.get())),
        Bind((i) => CreateUserController(i.get())),
        Bind((i) => UserController(i.get())),
        Bind((i) => UserRepository(i.get())),
        Bind((i) => CustomDio(i.get())),
        Bind((i) => Dio()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ChatPage()),
      ];

  static Inject get to => Inject<ChatModule>.of();
}
