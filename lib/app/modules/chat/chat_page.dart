import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/modules/chat/widgets/message.widget.dart';

import 'package:etanois/app/modules/chat/chat_controller.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends ModularState<ChatPage, ChatController> {
  @override
  void initState() {
    controller.manageChat();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (context) {
            return AnimatedList(
              key: controller.messageKey,
              reverse: true,
              initialItemCount: controller.chatMessages.length,
              itemBuilder: (BuildContext context, int i, Animation animation) {
                return FadeTransition(
                  opacity: animation,
                  child: MessageWidget(
                    message: controller.chatMessages[i],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
