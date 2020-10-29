class Message {
  String text;
  MessageSender sender;
  String time;
  bool waitAction;
  ChatActions chatAction;
  List<String> actions;
  String hintMessage;

  Message({
    this.text,
    this.sender,
    this.time,
    this.waitAction,
    this.chatAction,
    this.actions,
    this.hintMessage,
  });
}

enum MessageSender {
  EDNALDO,
  USER,
}

enum ChatActions {
  INPUT_NAME,
  INPUT_USERNAME,
  INPUT_EMAIL,
  INPUT_PASSWORD,

  CREATE_USER,
  LOGIN,
  GO_HOME,
  SELECT,
  NONE,
}
