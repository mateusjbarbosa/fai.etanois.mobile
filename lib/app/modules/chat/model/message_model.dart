class MessageModel {
  String text;
  MessageSender sender;
  String time;

  MessageModel({
    this.text,
    this.sender,
    this.time,
  });
}

enum MessageSender { EDNALDO, USER }
