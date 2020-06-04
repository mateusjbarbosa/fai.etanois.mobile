import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/modules/chat/widgets/chat_message.dart';
import 'package:etanois/app/modules/chat/widgets/message_composer.dart';
import 'package:etanois/app/modules/chat/widgets/chat_end_button.dart';

import 'chat_controller.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends ModularState<ChatPage, ChatController> {
  @override
  void initState() {
    super.initState();

    controller.createUserController.manageMessages();
  }

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
                child: Observer(
                  builder: (context) {
                    return ListView.builder(
                      reverse: true,
                      itemCount: controller.createUserController.createUserMessages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ChatMessage(message: controller.createUserController.createUserMessages[index]);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          Observer(
            builder: (BuildContext context) {
              return controller.createUserController.userCreated
                  ? ChatEndButton()
                  : MessageComposer(
                      isEnable: !controller.createUserController.getNextMessage,
                      hintMessage: controller.createUserController.hintMessage,
                      callback: (message) {
                        controller.createUserController.verifyUserMessage(message);
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}
