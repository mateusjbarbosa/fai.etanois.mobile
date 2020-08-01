import 'package:get_it/get_it.dart';

import 'package:etanois/core/utils/time.dart';
import 'package:etanois/core/utils/error.dart';

import 'package:etanois/app/modules/user/model/user.model.dart';
import 'package:etanois/app/modules/user/user.controller.dart';

import 'package:etanois/app/modules/chat/model/message.model.dart';

class LoginController {
  User user = User();

  UserController userController = GetIt.I.get<UserController>();

  Time time = Time();

  Future<Map<String, dynamic>> verifyMessage(Message message) async {
    Map<String, dynamic> response = Map<String, dynamic>();

    Message verifiedMessage = Message(
      text: '',
      time: time.generateTime(),
      sender: MessageSender.EDNALDO,
      waitAction: true,
    );

    switch (message.chatAction) {
      case ChatActions.GO_HOME:
        response['loginAccepted'] = true;
        break;

      case ChatActions.LOGIN:
        Error errors = await userController.generateUserToken(
          user.password,
          email: user.email,
          username: user.username,
        );

        if (errors.code == null) {
          errors = await userController.readUser();

          if (errors.code == null) {
            message.waitAction = false;
          }
        } else {
          switch (errors.code) {
            case 'E-000':
              verifiedMessage.text =
                  'Opa, verificamos que você ainda não ativou sua conta! Por favor, acesse seu e-mail e clique no botão CONFIRMAR CADASTRO!';
              verifiedMessage.chatAction = ChatActions.LOGIN;
              verifiedMessage.actions = ['ATIVEI'];
              response['verifiedMessage'] = verifiedMessage;
              break;
          }
        }
        break;
      case ChatActions.SELECT:
      case ChatActions.INPUT_USERNAME:
      case ChatActions.INPUT_EMAIL:
      case ChatActions.INPUT_PASSWORD:
      case ChatActions.INPUT_NAME:
      case ChatActions.CREATE_USER:
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
      case ChatActions.INPUT_USERNAME:
        if (message.length >= 3 && message.length <= 30) {
          bool status = await userController.findUserByUsername(message);

          if (!status) {
            user.username = message;

            userMessage.text = message;
            response['userMessage'] = userMessage;
          } else {
            userMessage.text = message;
            response['userMessage'] = userMessage;

            verifiedMessage.text =
                'Esse apelido não está cadastrado! Por favor, digite novamente';
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
          response['getNextMessage'] = false;
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

          if (!status) {
            user.email = message;

            userMessage.text = message;

            response['userMessage'] = userMessage;
          } else {
            userMessage.text = message;
            response['userMessage'] = userMessage;

            verifiedMessage.text =
                'Esse e-mail não está cadastrado! Por favor, digite novamente';
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

          userMessage.text = message;

          response['userMessage'] = userMessage;
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
