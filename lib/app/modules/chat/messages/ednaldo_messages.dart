import 'package:etanois/app/modules/chat/model/message_model.dart';

class EdnaldoMessages {
  static int _initChatIndex = 0;
  static int _createUserChatIndex = 0;

  MessageModel getNextMessage(String chat) {
    MessageModel message = MessageModel();

    switch (chat) {
      case 'init_chat':
        message = _initChatMessages[_initChatIndex++];
        break;
      case 'create_user_chat':
        message = _createUserMessages[_createUserChatIndex++];
        break;
      default:
        break;
    }

    return message;
  }

  List<MessageModel> _initChatMessages = [
    MessageModel(
      sender: MessageSender.EDNALDO,
      text: 'Olá!',
      waitAction: false,
      actionType: ActionType.NONE,
    ),
    MessageModel(
      sender: MessageSender.EDNALDO,
      text: 'É muito bom ter você aqui!',
      waitAction: false,
      actionType: ActionType.NONE,
    ),
    MessageModel(
      sender: MessageSender.EDNALDO,
      text: 'Eu sou o Ednaldo, seu frentista particular!',
      waitAction: false,
      actionType: ActionType.NONE,
    ),
    MessageModel(
      sender: MessageSender.EDNALDO,
      text: 'Para prosseguirmos, selecione uma das opções abaixo',
      waitAction: false,
      actionType: ActionType.NONE,
    ),
    MessageModel(
      sender: MessageSender.EDNALDO,
      text: 'Se você já possui conta no Etanóis, selecione a opção ACESSAR CONTA',
      waitAction: false,
      actionType: ActionType.NONE,
    ),
    MessageModel(
      sender: MessageSender.EDNALDO,
      text: 'Se você é novo por aqui, selecione a opção CRIAR CONTA',
      waitAction: true,
      actionType: ActionType.SELECT,
      actions: ['ACESSAR CONTA', 'CRIAR CONTA'],
    ),
  ];

  List<MessageModel> _createUserMessages = [
    MessageModel(
      sender: MessageSender.EDNALDO,
      text: 'Para começar, pode me dizer o seu nome?',
      waitAction: true,
      actionType: ActionType.INPUT_NAME,
    ),
    MessageModel(
      sender: MessageSender.EDNALDO,
      text: 'Muito bem!',
      waitAction: false,
      actionType: ActionType.NONE,
    ),
    MessageModel(
      sender: MessageSender.EDNALDO,
      text:
          'Uma forma mais fácil de acessar seu perfil mais tarde é definindo um username (apelido). Como podemos te chamar?',
      waitAction: true,
      actionType: ActionType.INPUT_USERNAME,
    ),
    MessageModel(
      sender: MessageSender.EDNALDO,
      text: 'Agora, pode nos informar seu e-mail? Ele também será uma forma de acesso ao seu perfil.',
      waitAction: true,
      actionType: ActionType.INPUT_EMAIL,
    ),
    MessageModel(
      sender: MessageSender.EDNALDO,
      text: 'Por fim, defina uma senha de acesso!',
      waitAction: true,
      actionType: ActionType.INPUT_PASSWORD,
    ),
    MessageModel(
      sender: MessageSender.EDNALDO,
      text: 'Aguarde um instante, estamos registrando seus dados no sistema...',
      waitAction: true,
      actionType: ActionType.CREATE_USER,
    ),
    MessageModel(
      sender: MessageSender.EDNALDO,
      text: 'Muito bem, você já faz parte do Etanóis!',
      waitAction: false,
      actionType: ActionType.NONE,
    ),
    MessageModel(
      sender: MessageSender.EDNALDO,
      text: 'Em alguns instantes, retornarei com algumas perguntas para melhorar ainda mais sua experiência conosco!',
      waitAction: false,
      actionType: ActionType.NONE,
    ),
    MessageModel(
      sender: MessageSender.EDNALDO,
      text: 'Enquanto isso, navegue pelo Etanóis!',
      waitAction: true,
      actionType: ActionType.GO_HOME,
    ),
  ];
}
