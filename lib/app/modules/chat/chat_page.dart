import 'package:etanois/app/modules/chat/model/message_model.dart';
import 'package:etanois/app/modules/chat/widgets/chat_message.dart';
import 'package:etanois/app/modules/chat/widgets/message_composer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'chat_controller.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends ModularState<ChatPage, ChatController> {
  List<MessageModel> messages = [
    MessageModel(text: 'Opa', time: '12:00', sender: MessageSender.USER),
    MessageModel(text: 'Opa', time: '12:01', sender: MessageSender.EDNALDO),
    MessageModel(text: 'Opa', time: '12:02', sender: MessageSender.USER),
    MessageModel(text: 'Opa', time: '12:03', sender: MessageSender.USER),
    MessageModel(text: 'Opa', time: '12:04', sender: MessageSender.EDNALDO),
    MessageModel(text: 'Opa', time: '12:05', sender: MessageSender.USER),
    MessageModel(text: 'Opa', time: '12:06', sender: MessageSender.EDNALDO),
    MessageModel(text: 'Opa', time: '12:07', sender: MessageSender.EDNALDO),
    MessageModel(text: 'Opa', time: '12:08', sender: MessageSender.EDNALDO),
    MessageModel(text: 'Opa', time: '12:09', sender: MessageSender.USER),
    MessageModel(text: 'Opa', time: '12:10', sender: MessageSender.USER),
    MessageModel(text: 'Opa', time: '12:11', sender: MessageSender.EDNALDO),
    MessageModel(text: 'Opa', time: '12:12', sender: MessageSender.USER),
    MessageModel(text: 'Opa', time: '12:13', sender: MessageSender.USER),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text(
          'EDNALDO',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Color(0xFFF7F7F7),
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF7F7F7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChatMessage(message: messages[index]);
                  },
                ),
              ),
            ),
          ),
          MessageComposer(),
        ],
      ),
    );
  }
}
