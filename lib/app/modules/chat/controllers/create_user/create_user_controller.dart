import 'package:mobx/mobx.dart';

import 'package:etanois/app/modules/chat/controllers/ednaldo_messages.dart';
import 'package:etanois/app/modules/chat/model/message_model.dart';

import 'package:etanois/app/modules/user/model/user_model.dart';
import 'package:etanois/app/modules/user/user_controller.dart';

import 'package:etanois/app/shared/utils/error.dart';
import 'package:etanois/app/shared/utils/time.dart';

part 'create_user_controller.g.dart';

class CreateUserController = _CreateUserControllerBase with _$CreateUserController;

abstract class _CreateUserControllerBase with Store {
  EdnaldoMessages messages = EdnaldoMessages();

  int indexLastMessage = 0;

  MessageModel currentMessage;

  Time time = Time();

  UserModel user = UserModel();

  final UserController userController;

  _CreateUserControllerBase(this.userController);

  @observable
  bool getNextMessage = true;

  @observable
  bool userCreated = false;

  @observable
  ObservableList<MessageModel> createUserMessages = <MessageModel>[].asObservable();

  @observable
  String hintMessage = 'Escreva uma mensagem...';

  @action
  Future<void> manageMessages() async {
    while (getNextMessage) {
      await Future.delayed(Duration(seconds: 2));

      currentMessage = messages.createUserMessages[indexLastMessage++];

      currentMessage.time = time.generateTime();

      createUserMessages.insert(0, currentMessage);

      if (currentMessage.waitAction) {
        _verifyMessage();
      }
    }
  }

  @action
  Future<void> _verifyMessage() async {
    switch (currentMessage.actionType) {
      case ActionType.INPUT_NAME:
        hintMessage = 'Digite seu nome completo!';
        getNextMessage = false;
        break;
      case ActionType.INPUT_USERNAME:
        hintMessage = 'Digite um apelido bem bacana!';
        getNextMessage = false;
        break;
      case ActionType.INPUT_EMAIL:
        hintMessage = 'Digite seu melhor e-mail!';
        getNextMessage = false;
        break;
      case ActionType.INPUT_PASSWORD:
        hintMessage = 'Digite uma senha forte!';
        getNextMessage = false;
        break;
      case ActionType.CREATE_USER:
        Error errors = await userController.createUser(user);

        if (errors.code == null) {
          getNextMessage = true;
        }
        break;
      case ActionType.GO_HOME:
        userCreated = true;
        break;
      case ActionType.NONE:
        hintMessage = 'Escreva uma mensagem...';
        getNextMessage = false;
        break;
    }
  }

  @action
  Future<void> verifyUserMessage(String message) async {
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

    switch (currentMessage.actionType) {
      case ActionType.INPUT_NAME:
        if (message.length >= 6 && message.length <= 50) {
          user.name = message;

          userMessage.text = message;
          createUserMessages.insert(0, userMessage);
          getNextMessage = true;
        } else {
          verifyMessage.text = 'O nome deve possuir entre 6 e 50 letras! Por favor, digite novamente.';
          verifyMessage.actionType = ActionType.INPUT_NAME;
          createUserMessages.insert(0, verifyMessage);
        }
        break;
      case ActionType.INPUT_USERNAME:
        if (message.length >= 3 && message.length <= 30) {
          bool status = await userController.findUserByUsername(message);

          if (status) {
            user.username = message;

            userMessage.text = message;
            createUserMessages.insert(0, userMessage);
            getNextMessage = true;
          } else {
            userMessage.text = message;
            createUserMessages.insert(0, userMessage);
            verifyMessage.text = 'Infelizmente esse apelido já está em uso! Por favor, digite novamente';
            verifyMessage.actionType = ActionType.INPUT_USERNAME;
            createUserMessages.insert(0, verifyMessage);
          }
        } else {
          verifyMessage.text = 'O username deve possuir entre 3 e 30 letras! Por favor, digite novamente.';
          verifyMessage.actionType = ActionType.INPUT_USERNAME;
          createUserMessages.insert(0, verifyMessage);
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

          if (status) {
            user.email = message;

            userMessage.text = message;
            createUserMessages.insert(0, userMessage);
            getNextMessage = true;
          } else {
            userMessage.text = message;
            createUserMessages.insert(0, userMessage);
            verifyMessage.text = 'Infelizmente esse e-mail já está em uso! Por favor, digite novamente';
            verifyMessage.actionType = ActionType.INPUT_EMAIL;
            createUserMessages.insert(0, verifyMessage);
          }
        } else {
          verifyMessage.text = 'E-mail inválido! Por favor, digite novamente.';
          verifyMessage.actionType = ActionType.INPUT_EMAIL;
          createUserMessages.insert(0, verifyMessage);
        }
        break;
      case ActionType.INPUT_PASSWORD:
        if (message.length >= 6 && message.length <= 20) {
          user.password = message;

          userMessage.text = message;
          createUserMessages.insert(0, userMessage);
          getNextMessage = true;
        } else {
          verifyMessage.text = 'A senha deve possuir entre 6 e 20 caracteres! Por favor, digite novamente.';
          verifyMessage.actionType = ActionType.INPUT_PASSWORD;
          createUserMessages.insert(0, verifyMessage);
        }
        break;
      default:
        break;
    }

    manageMessages();
  }
}
