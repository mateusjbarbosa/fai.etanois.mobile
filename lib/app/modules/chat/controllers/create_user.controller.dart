import 'package:get_it/get_it.dart';

import 'package:etanois/core/utils/time.dart';
import 'package:etanois/core/utils/error.dart';

import 'package:etanois/app/modules/user/model/user.model.dart';
import 'package:etanois/app/modules/user/user.controller.dart';

import 'package:etanois/app/modules/chat/model/message.model.dart';

class CreateUserController {
  User user = User();

  UserController userController = GetIt.I.get<UserController>();

  Time time = Time();

  Future<Map<String, dynamic>> verifyMessage(Message message) async {
    Map<String, dynamic> response = Map<String, dynamic>();

    switch (message.chatAction) {
      case ChatActions.CREATE_USER:
        Error errors = await userController.createUser(user);

        if (errors.code == null) {
          message.waitAction = false;
        }
        break;
      case ChatActions.GO_HOME:
        response['userCreated'] = true;
        break;
      case ChatActions.INPUT_NAME:
      case ChatActions.INPUT_USERNAME:
      case ChatActions.INPUT_EMAIL:
      case ChatActions.INPUT_PASSWORD:
      case ChatActions.SELECT:
      case ChatActions.LOGIN:
      case ChatActions.NONE:
        break;
    }

    return response;
  }

  Future<Map<String, dynamic>> verifyUserMessage(
      String message, ChatActions chatAction) async {
    Map<String, dynamic> response = Map<String, dynamic>();

    Message verifiedMessage = Message(
      text: '',
      time: time.generateTime(),
      sender: MessageSender.EDNALDO,
      waitAction: true,
    );

    Message userMessage = Message(
      text: '',
      time: time.generateTime(),
      sender: MessageSender.USER,
      waitAction: false,
    );

    switch (chatAction) {
      case ChatActions.INPUT_NAME:
        if (message.length >= 6 && message.length <= 50) {
          user.name = message;

          userMessage.text = message;

          response['userMessage'] = userMessage;
        } else {
          userMessage.text = message;
          response['userMessage'] = userMessage;

          verifiedMessage.text =
              'O nome deve possuir entre 6 e 50 letras! Por favor, digite novamente.';
          verifiedMessage.chatAction = ChatActions.INPUT_NAME;
          response['verifiedMessage'] = verifiedMessage;
        }
        break;
      case ChatActions.INPUT_USERNAME:
        if (message.length >= 3 && message.length <= 30) {
          bool status = await userController.findUserByUsername(message);

          if (status) {
            user.username = message;

            userMessage.text = message;
            response['userMessage'] = userMessage;
          } else {
            userMessage.text = message;
            response['userMessage'] = userMessage;

            verifiedMessage.text =
                'Infelizmente esse apelido já está em uso! Por favor, digite novamente';
            verifiedMessage.chatAction = ChatActions.INPUT_USERNAME;
            response['verifiedMessage'] = verifiedMessage;
          }
        } else {
          userMessage.text = message;
          response['userMessage'] = userMessage;
          verifiedMessage.text =
              'O username deve possuir entre 3 e 30 letras! Por favor, digite novamente.';
          verifiedMessage.chatAction = ChatActions.INPUT_USERNAME;
          response['verifiedMessage'] = verifiedMessage;
        }
        break;
      case ChatActions.INPUT_EMAIL:
        List<String> email = message.split('@');

        if ((email.length > 1) &&
            (email[0].length >= 1) &&
            (email[1].length >= 3) &&
            (!email[0].contains(' ')) &&
            (!email[1].contains(' ')) &&
            (email[1].contains('.')) &&
            (email[1].indexOf('.') < email[1].length - 1)) {
          bool status = await userController.findUserByEmail(message);

          if (status) {
            user.email = message;

            userMessage.text = message;

            response['userMessage'] = userMessage;
          } else {
            userMessage.text = message;
            response['userMessage'] = userMessage;

            verifiedMessage.text =
                'Infelizmente esse e-mail já está em uso! Por favor, digite novamente';
            verifiedMessage.chatAction = ChatActions.INPUT_EMAIL;
            response['verifiedMessage'] = verifiedMessage;
          }
        } else {
          userMessage.text = message;
          response['userMessage'] = userMessage;
          verifiedMessage.text =
              'E-mail inválido! Por favor, digite novamente.';
          verifiedMessage.chatAction = ChatActions.INPUT_EMAIL;
          response['verifiedMessage'] = verifiedMessage;
        }
        break;
      case ChatActions.INPUT_PASSWORD:
        if (message.length >= 6 && message.length <= 20) {
          user.password = message;

          userMessage.text = message.replaceAll(RegExp(r"."), "•");

          response['userMessage'] = userMessage;
          response['getNextMessage'] = true;
        } else {
          userMessage.text = message;
          response['userMessage'] = userMessage;

          verifiedMessage.text =
              'A senha deve possuir entre 6 e 20 caracteres! Por favor, digite novamente.';
          verifiedMessage.chatAction = ChatActions.INPUT_PASSWORD;
          response['verifiedMessage'] = verifiedMessage;
        }
        break;
      default:
        break;
    }

    return response;
  }
}
