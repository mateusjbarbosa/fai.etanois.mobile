import '../model/message_model.dart';

class InitChatController {
  Future<Map<String, dynamic>> verifyMessage(ActionType actionType) async {
    Map<String, dynamic> response = Map<String, dynamic>();

    switch (actionType) {
      case ActionType.SELECT:
        response['hintMessage'] = 'Selecione uma das opções acima...';
        response['getNextMessage'] = false;
        break;
      case ActionType.INPUT_NAME:
      case ActionType.INPUT_USERNAME:
      case ActionType.INPUT_EMAIL:
      case ActionType.INPUT_PASSWORD:
      case ActionType.CREATE_USER:
      case ActionType.LOGIN:
      case ActionType.GO_HOME:
      case ActionType.NONE:
        response['hintMessage'] = 'Escreva uma mensagem...';
        response['getNextMessage'] = true;
        break;
    }

    return response;
  }
}
