import 'package:mobx/mobx.dart';

import 'package:etanois/app/modules/chat/controllers/create_user_controller.dart';
import 'package:etanois/app/modules/chat/controllers/login_controller.dart';
import 'controllers/init_chat_controller.dart';

import 'package:etanois/app/modules/chat/messages/ednaldo_messages.dart';

import 'package:etanois/app/modules/chat/model/message_model.dart';

import 'package:etanois/app/shared/utils/time.dart';

import 'model/message_model.dart';

part 'chat_controller.g.dart';

class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {
  CreateUserController createUserController = CreateUserController();
  InitChatController initChatController = InitChatController();
  LoginController loginChatController = LoginController();

  EdnaldoMessages messages = EdnaldoMessages();

  MessageModel currentMessage = MessageModel(waitAction: false);

  Time time = Time();

  ChatType currentChat = ChatType.INIT;

  void setChosenOptions(String option) async {
    MessageModel message = MessageModel();

    message.sender = MessageSender.USER;
    message.waitAction = false;

    switch (option) {
      case 'ACESSAR CONTA':
        message.text = option;
        message.time = time.generateTime();

        chatMessages.insert(0, message);

        currentChat = ChatType.LOGIN;
        currentMessage.waitAction = false;
        break;
      case 'CRIAR CONTA':
        message.text = option;
        message.time = time.generateTime();

        chatMessages.insert(0, message);

        currentChat = ChatType.CREATE_ACCOUNT;
        currentMessage.waitAction = false;

        break;

      case 'E-MAIL':
        message.text = option;
        message.time = time.generateTime();

        chatMessages.insert(0, message);
        currentMessage.waitAction = false;
        break;

      case 'APELIDO':
        message.text = option;
        message.time = time.generateTime();

        chatMessages.insert(0, message);

        currentMessage = messages.getNextMessage(currentChat);

        currentMessage.time = time.generateTime();

        currentMessage.actionType = ActionType.INPUT_USERNAME;

        chatMessages.insert(0, currentMessage);

        manageChat();
        break;
    }

    getNextMessage = true;
    haveActions = false;

    manageChat();
  }

  @observable
  bool userCreated = false;

  @observable
  bool loginAccepted = false;

  @observable
  bool haveActions = false;

  @observable
  String hintMessage = 'Escreva uma mensagem...';

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
          case ChatType.INIT:
            response = await initChatController.verifyMessage(currentMessage.actionType);

            hintMessage = response['hintMessage'];
            getNextMessage = response['getNextMessage'];
            break;
          case ChatType.CREATE_ACCOUNT:
            response = await createUserController.verifyMessage(currentMessage.actionType);

            hintMessage = response['hintMessage'];
            getNextMessage = response['getNextMessage'];

            if (response.containsKey('userCreated')) {
              userCreated = response['userCreated'];
            }
            break;
          case ChatType.LOGIN:
            print(currentMessage.actionType);

            response = await loginChatController.verifyMessage(currentMessage.actionType);

            hintMessage = response['hintMessage'];
            getNextMessage = response['getNextMessage'];

            if (response.containsKey('loginAccepted')) {
              loginAccepted = response['loginAccepted'];
            }
            break;
          default:
            break;
        }
      }

      if (currentMessage.actions != null) {
        haveActions = true;
      }
    }
  }

  @action
  Future<void> verifyUserMessage(String message) async {
    Map<String, dynamic> response = Map<String, dynamic>();

    switch (currentChat) {
      case ChatType.INIT:
        break;
      case ChatType.CREATE_ACCOUNT:
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
      case ChatType.LOGIN:
        response = await loginChatController.verifyUserMessage(message, currentMessage.actionType);

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
      default:
        break;
    }

    manageChat();
  }
}

enum ChatType { INIT, LOGIN, CREATE_ACCOUNT }
