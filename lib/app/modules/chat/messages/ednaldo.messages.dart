import 'package:etanois/app/modules/chat/chat_controller.dart';
import 'package:etanois/app/modules/chat/model/message.model.dart';

class EdnaldoMessages {
  static int _welcomeIndex = 0;
  static int _createAccountChatIndex = 0;
  static int _loginChatIndex = 0;
  static int _loginEmailChatIndex = 0;
  static int _loginUsernameChatIndex = 0;

  Message getNextMessage(ChatType chat, {String choose}) {
    Message message = Message();

    switch (chat) {
      case ChatType.WELCOME:
        message = _welcomeMessages[_welcomeIndex++];
        break;
      case ChatType.CREATE_ACCOUNT:
        message = _createAccountMessages[_createAccountChatIndex++];
        break;
      case ChatType.LOGIN:
        switch (choose) {
          case 'E-MAIL':
            message = _loginEmailMessages[_loginEmailChatIndex++];
            break;
          case 'APELIDO':
            message = _loginUsernameMessages[_loginUsernameChatIndex++];
            break;
          case 'ATIVEI':
            message = _loginMessages[_loginChatIndex];
            break;
          default:
            message = _loginMessages[_loginChatIndex++];
            break;
        }
        break;
      default:
        break;
    }

    return message;
  }

  List<Message> _welcomeMessages = [
    Message(
      sender: MessageSender.EDNALDO,
      text: 'Olá!',
      waitAction: false,
      chatAction: ChatActions.NONE,
      hintMessage: "Escreva uma mensagem...",
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text: 'É muito bom ter você aqui!',
      waitAction: false,
      chatAction: ChatActions.NONE,
      hintMessage: "Escreva uma mensagem...",
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text: 'Eu sou o Ednaldo, seu frentista particular!',
      waitAction: false,
      chatAction: ChatActions.NONE,
      hintMessage: "Escreva uma mensagem...",
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text: 'Para prosseguirmos, selecione uma das opções abaixo',
      waitAction: false,
      chatAction: ChatActions.NONE,
      hintMessage: "Escreva uma mensagem...",
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text:
          'Se você já possui conta no Etanóis, selecione a opção ACESSAR CONTA',
      waitAction: false,
      chatAction: ChatActions.NONE,
      hintMessage: "Escreva uma mensagem...",
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text: 'Se você é novo por aqui, selecione a opção CRIAR CONTA',
      waitAction: true,
      chatAction: ChatActions.SELECT,
      actions: ['ACESSAR CONTA', 'CRIAR CONTA'],
      hintMessage: 'Selecione uma das opções acima...',
    ),
  ];

  List<Message> _createAccountMessages = [
    Message(
      sender: MessageSender.EDNALDO,
      text: 'Para começar, pode me dizer o seu nome?',
      waitAction: true,
      chatAction: ChatActions.INPUT_NAME,
      hintMessage: 'Digite seu nome completo!',
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text: 'Muito bem!',
      waitAction: false,
      chatAction: ChatActions.NONE,
      hintMessage: "Escreva uma mensagem...",
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text:
          'Uma forma mais fácil de acessar seu perfil mais tarde é definindo um username (apelido). Como podemos te chamar?',
      waitAction: true,
      chatAction: ChatActions.INPUT_USERNAME,
      hintMessage: 'Digite um apelido bem bacana!',
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text:
          'Agora, pode nos informar seu e-mail? Ele também será uma forma de acesso ao seu perfil.',
      waitAction: true,
      chatAction: ChatActions.INPUT_EMAIL,
      hintMessage: 'Digite seu melhor e-mail!',
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text: 'Por fim, defina uma senha de acesso!',
      waitAction: true,
      chatAction: ChatActions.INPUT_PASSWORD,
      hintMessage: 'Digite uma senha forte!',
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text: 'Aguarde um instante, estamos registrando seus dados no sistema...',
      waitAction: true,
      chatAction: ChatActions.CREATE_USER,
      hintMessage: 'Escreva uma mensagem...',
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text: 'Muito bem, você já faz parte do Etanóis!',
      waitAction: false,
      chatAction: ChatActions.NONE,
      hintMessage: 'Escreva uma mensagem...',
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text:
          'Em alguns instantes, retornarei com algumas perguntas para melhorar ainda mais sua experiência conosco!',
      waitAction: false,
      chatAction: ChatActions.NONE,
      hintMessage: 'Escreva uma mensagem...',
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text: 'Enquanto isso, navegue pelo Etanóis!',
      waitAction: true,
      chatAction: ChatActions.GO_HOME,
      hintMessage: 'Escreva uma mensagem...',
    ),
  ];

  List<Message> _loginMessages = [
    Message(
      sender: MessageSender.EDNALDO,
      text: 'Certo, preciso que você me diga suas credenciais de acesso.',
      waitAction: false,
      chatAction: ChatActions.NONE,
      hintMessage: 'Escreva uma mensagem...',
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text:
          'Precisamos do e-mail cadastrado no Etanóis ou seu apelido. Qual você prefere?',
      waitAction: true,
      chatAction: ChatActions.SELECT,
      actions: ['E-MAIL', 'APELIDO'],
      hintMessage: 'Selecione uma das opções acima...',
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text: 'Vamos tentar uma nova conexão com seus dados, só um momento!',
      waitAction: true,
      chatAction: ChatActions.LOGIN,
      hintMessage: 'Escreva uma mensagem...',
    ),
  ];

  List<Message> _loginEmailMessages = [
    Message(
      sender: MessageSender.EDNALDO,
      text: 'Muito bem, pode digitar!',
      waitAction: true,
      chatAction: ChatActions.INPUT_EMAIL,
      hintMessage: 'Digite seu o e-mail cadastrado!',
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text: 'Agora precisamos da senha de acesso!',
      waitAction: true,
      chatAction: ChatActions.INPUT_PASSWORD,
      hintMessage: 'Digite sua senha de acesso!',
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text: 'Aguarde um instante, estou gerando seu acesso!',
      waitAction: true,
      chatAction: ChatActions.LOGIN,
      hintMessage: 'Escreva uma mensagem...',
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text:
          'Muito bem, acesso permitido. Seja bem vindo de volta, nomeUsuario! Finalize o chat para utilizar o Etanóis.',
      waitAction: true,
      chatAction: ChatActions.GO_HOME,
      hintMessage: 'Escreva uma mensagem...',
    ),
  ];

  List<Message> _loginUsernameMessages = [
    Message(
      sender: MessageSender.EDNALDO,
      text: 'Muito bem, pode digitar!',
      waitAction: true,
      chatAction: ChatActions.INPUT_USERNAME,
      hintMessage: 'Digite seu o apelido cadastrado!',
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text: 'Agora precisamos da senha de acesso!',
      waitAction: true,
      chatAction: ChatActions.INPUT_PASSWORD,
      hintMessage: 'Digite sua senha de acesso!',
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text: 'Aguarde um instante, estou gerando seu acesso!',
      waitAction: true,
      chatAction: ChatActions.LOGIN,
      hintMessage: 'Escreva uma mensagem...',
    ),
    Message(
      sender: MessageSender.EDNALDO,
      text:
          'Muito bem, acesso permitido. Seja bem vindo de volta, nomeUsuario! Finalize o chat para utilizar o Etanóis.',
      waitAction: true,
      chatAction: ChatActions.GO_HOME,
      hintMessage: 'Escreva uma mensagem...',
    ),
  ];
}
