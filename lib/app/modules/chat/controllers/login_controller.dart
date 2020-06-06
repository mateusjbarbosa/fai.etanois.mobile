import 'package:get_it/get_it.dart';

import '../../../shared/utils/error.dart';
import '../../../shared/utils/time.dart';
import '../../user/model/user_model.dart';
import '../../user/user_controller.dart';
import '../model/message_model.dart';

class LoginController {
  UserModel user = UserModel();

  UserController userController = GetIt.I.get<UserController>();

  Time time = Time();

  Future<Map<String, dynamic>> verifyMessage(ActionType actionType) async {
    Map<String, dynamic> response = Map<String, dynamic>();

    switch (actionType) {
      case ActionType.INPUT_USERNAME:
        response['hintMessage'] = 'Digite o apelido cadastrado!';
        response['getNextMessage'] = false;
        break;
      case ActionType.INPUT_EMAIL:
        response['hintMessage'] = 'Digite seu o e-mail cadastrado!';
        response['getNextMessage'] = false;
        break;
      case ActionType.INPUT_PASSWORD:
        response['hintMessage'] = 'Digite sua senha de acesso!';
        response['getNextMessage'] = false;
        break;
      case ActionType.GO_HOME:
        response['hintMessage'] = 'Escreva uma mensagem...';
        response['loginAccepted'] = true;
        response['getNextMessage'] = false;
        break;
      case ActionType.SELECT:
        response['hintMessage'] = 'Selecione uma das opções acima...';
        response['getNextMessage'] = false;
        break;

      case ActionType.LOGIN:
        Error errors = await userController.generateUserToken(user.email, user.password);

        if (errors.code == null) {
          Error errors = await userController.readUser();

          if (errors.code == null) {
            response['hintMessage'] = 'Escreva uma mensagem...';
            response['getNextMessage'] = true;
          }
        }
        break;
      case ActionType.INPUT_NAME:
      case ActionType.CREATE_USER:
      case ActionType.NONE:
        response['hintMessage'] = 'Escreva uma mensagem...';
        response['getNextMessage'] = true;
        break;
    }

    return response;
  }

  Future<Map<String, dynamic>> verifyUserMessage(String message, ActionType actionType) async {
    Map<String, dynamic> response = Map<String, dynamic>();

    MessageModel verifyMessage = MessageModel(
      text: '',
      time: time.generateTime(),
      sender: MessageSender.EDNALDO,
      waitAction: true,
    );

    MessageModel userMessage = MessageModel(
      text: '',
      time: time.generateTime(),
      sender: MessageSender.USER,
      waitAction: false,
    );

    switch (actionType) {
      case ActionType.INPUT_NAME:
      case ActionType.INPUT_USERNAME:
        if (message.length >= 3 && message.length <= 30) {
          bool status = await userController.findUserByUsername(message);

          if (!status) {
            user.username = message;

            userMessage.text = message;
            response['userMessage'] = userMessage;
            response['getNextMessage'] = true;
          } else {
            userMessage.text = message;
            response['userMessage'] = userMessage;

            verifyMessage.text = 'Esse apelido não está cadastrado! Por favor, digite novamente';
            verifyMessage.actionType = ActionType.INPUT_USERNAME;
            response['verifyMessage'] = verifyMessage;
            response['getNextMessage'] = false;
          }
        } else {
          verifyMessage.text = 'O username deve possuir entre 3 e 30 letras! Por favor, digite novamente.';
          verifyMessage.actionType = ActionType.INPUT_USERNAME;
          response['verifyMessage'] = verifyMessage;
          response['getNextMessage'] = false;
        }
        break;
      case ActionType.INPUT_EMAIL:
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
            response['getNextMessage'] = true;
          } else {
            userMessage.text = message;
            response['userMessage'] = userMessage;

            verifyMessage.text = 'Esse e-mail não está cadastrado! Por favor, digite novamente';
            verifyMessage.actionType = ActionType.INPUT_EMAIL;
            response['verifyMessage'] = verifyMessage;
            response['getNextMessage'] = false;
          }
        } else {
          verifyMessage.text = 'E-mail inválido! Por favor, digite novamente.';
          verifyMessage.actionType = ActionType.INPUT_EMAIL;
          response['verifyMessage'] = verifyMessage;
          response['getNextMessage'] = false;
        }
        break;
      case ActionType.INPUT_PASSWORD:
        if (message.length >= 6 && message.length <= 20) {
          user.password = message;

          userMessage.text = message;

          response['userMessage'] = userMessage;
          response['getNextMessage'] = true;
        } else {
          verifyMessage.text = 'A senha deve possuir entre 6 e 20 caracteres! Por favor, digite novamente.';
          verifyMessage.actionType = ActionType.INPUT_PASSWORD;
          response['verifyMessage'] = verifyMessage;
          response['getNextMessage'] = false;
        }
        break;
      default:
        break;
    }

    return response;
  }
}
