class MessageModel {
  String text;
  MessageSender sender;
  String time;
  bool waitAction;
  ActionType actionType;

  MessageModel({
    this.text,
    this.sender,
    this.time,
    this.waitAction,
    this.actionType,
  });
}

enum MessageSender { EDNALDO, USER }

enum ActionType { INPUT_NAME, INPUT_USERNAME, INPUT_EMAIL, INPUT_PASSWORD, CREATE_USER, GO_HOME }
