import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:etanois/core/utils/time.dart';

import 'package:etanois/app/modules/chat/controllers/create_user.controller.dart';
import 'package:etanois/app/modules/chat/controllers/login.controller.dart';

import 'package:etanois/app/modules/chat/messages/ednaldo.messages.dart';

import 'package:etanois/app/modules/chat/model/message.model.dart';

part 'chat_controller.g.dart';

class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {
  CreateUserController createUserController = CreateUserController();
  LoginController loginChatController = LoginController();

  EdnaldoMessages messages = EdnaldoMessages();

  Message currentMessage = Message(waitAction: false);

  Time time = Time();

  ChatType currentChat = ChatType.WELCOME;

  @observable
  bool userCreated = false;

  @observable
  bool loginAccepted = false;

  @observable
  bool haveActions = false;

  @observable
  String hintMessage = "";

  @observable
  bool getNextMessage = true;

  @observable
  ObservableList<Message> chatMessages = <Message>[].asObservable();

  @observable
  GlobalKey<AnimatedListState> messageKey = GlobalKey();

  @action
  void insertMessageAnimation() {
    messageKey.currentState.insertItem(
      0,
      duration: Duration(seconds: 1),
    );
  }

  @action
  Future<void> manageChat() async {
    Map<String, dynamic> response = Map<String, dynamic>();

    while (getNextMessage) {
      await Future.delayed(Duration(seconds: 2));

      currentMessage = messages.getNextMessage(currentChat);
      hintMessage = currentMessage.hintMessage;

      currentMessage.time = time.generateTime();

      chatMessages.insert(0, currentMessage);

      insertMessageAnimation();

      if (currentMessage.waitAction) {
        switch (currentChat) {
          case ChatType.WELCOME:
            getNextMessage = !currentMessage.waitAction;
            break;
          case ChatType.CREATE_ACCOUNT:
            response = await createUserController.verifyMessage(currentMessage);

            getNextMessage = !currentMessage.waitAction;

            if (response.containsKey('userCreated')) {
              userCreated = response['userCreated'];
            }
            break;
          case ChatType.LOGIN:
            response = await loginChatController
                .verifyMessage(currentMessage.chatAction);

            getNextMessage = !currentMessage.waitAction;

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
      case ChatType.WELCOME:
        break;
      case ChatType.CREATE_ACCOUNT:
        response = await createUserController.verifyUserMessage(
            message, currentMessage.chatAction);

        if (response['userMessage'] != null) {
          currentMessage = response['userMessage'];
          currentMessage.time = time.generateTime();
          chatMessages.insert(0, currentMessage);
        }

        if (response['verifiedMessage'] != null) {
          currentMessage = response['verifiedMessage'];
          currentMessage.time = time.generateTime();
          chatMessages.insert(0, currentMessage);
        }

        getNextMessage = !currentMessage.waitAction;
        break;
      case ChatType.LOGIN:
        response = await loginChatController.verifyUserMessage(
            message, currentMessage.chatAction);

        if (response['userMessage'] != null) {
          currentMessage = response['userMessage'];
          currentMessage.time = time.generateTime();
          chatMessages.insert(0, currentMessage);
        }

        if (response['verifiedMessage'] != null) {
          currentMessage = response['verifiedMessage'];
          currentMessage.time = time.generateTime();
          chatMessages.insert(0, currentMessage);
        }

        getNextMessage = !currentMessage.waitAction;
        break;
      default:
        break;
    }

    manageChat();
  }

  void setChosenOptions(String option) async {
    Message message = Message();

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

        currentMessage.chatAction = ChatActions.INPUT_USERNAME;

        chatMessages.insert(0, currentMessage);

        manageChat();
        break;
    }

    getNextMessage = true;
    haveActions = false;

    manageChat();
  }
}

enum ChatType {
  WELCOME,
  CREATE_ACCOUNT,
  LOGIN,
  UPDATE_ACCOUNT,
}
