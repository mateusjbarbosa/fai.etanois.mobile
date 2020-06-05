import 'package:mobx/mobx.dart';

import 'package:etanois/app/modules/chat/controllers/create_user_controller.dart';

import 'package:etanois/app/modules/chat/messages/ednaldo_messages.dart';

import 'package:etanois/app/modules/chat/model/message_model.dart';

import 'package:etanois/app/shared/utils/time.dart';

part 'chat_controller.g.dart';

class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {
  CreateUserController createUserController = CreateUserController();

  EdnaldoMessages messages = EdnaldoMessages();

  MessageModel currentMessage;

  Time time = Time();

  String currentChat = 'create_user_chat';

  @observable
  bool userCreated = false;

  @observable
  String hintMessage = '';

  @observable
  bool getNextMessage = true;

  @observable
  ObservableList<MessageModel> chatMessages = <MessageModel>[].asObservable();

  @action
  Future<void> manageChat() async {
    Map<String, dynamic> response = Map<String, dynamic>();

    while (getNextMessage) {
      await Future.delayed(Duration(seconds: 2));

      currentMessage = messages.getNextMessage(currentChat);

      currentMessage.time = time.generateTime();

      chatMessages.insert(0, currentMessage);

      if (currentMessage.waitAction) {
        switch (currentChat) {
          case 'init_chat':
            break;
          case 'create_user_chat':
            response = await createUserController.verifyMessage(currentMessage.actionType);

            hintMessage = response['hintMessage'];
            getNextMessage = response['getNextMessage'];

            if (response.containsKey('userCreated')) {
              userCreated = response['userCreated'];
            }
            break;
        }
      }
    }
  }

  @action
  Future<void> verifyUserMessage(String message) async {
    Map<String, dynamic> response = Map<String, dynamic>();

    switch (currentChat) {
      case 'init_chat':
        break;
      case 'create_user_chat':
        response = await createUserController.verifyUserMessage(message, currentMessage.actionType);

        if (response['userMessage'] != null) {
          currentMessage = response['userMessage'];
          currentMessage.time = time.generateTime();
          chatMessages.insert(0, currentMessage);
        }

        if (response['verifyMessage'] != null) {
          currentMessage = response['verifyMessage'];
          currentMessage.time = time.generateTime();
          chatMessages.insert(0, currentMessage);
        }

        getNextMessage = response['getNextMessage'];
        break;
    }

    manageChat();
  }
}
