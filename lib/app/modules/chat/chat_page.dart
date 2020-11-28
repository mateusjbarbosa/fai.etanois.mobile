import 'package:etanois/app/modules/chat/model/message.model.dart';
import 'package:etanois/app/modules/chat/widgets/chat_end_button.widget.dart';
import 'package:etanois/app/modules/chat/widgets/message_composer.widget.dart';
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
  bool _verifyMessageComposerState() {
    bool state;

    switch (controller.currentMessage.chatAction) {
      case ChatActions.INPUT_NAME:
      case ChatActions.INPUT_USERNAME:
      case ChatActions.INPUT_EMAIL:
      case ChatActions.INPUT_PASSWORD:
        state = true;
        break;
      case ChatActions.CREATE_USER:
      case ChatActions.LOGIN:
      case ChatActions.GO_HOME:
      case ChatActions.SELECT:
      case ChatActions.NONE:
      default:
        state = false;
        break;
    }

    return state;
  }

  @override
  void initState() {
    controller.resetMessagesCount();
    controller.manageChat();

    super.initState();
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
                    return AnimatedList(
                      key: controller.messageKey,
                      reverse: true,
                      initialItemCount: controller.chatMessages.length,
                      itemBuilder:
                          (BuildContext context, int i, Animation animation) {
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
            ),
          ),
          Observer(builder: (context) {
            return controller.haveActions
                ? Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    height: 60.0,
                    color: Color(0xFFF7F7F7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.currentMessage.actions.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Container(
                                  padding:
                                      EdgeInsets.only(left: 15.0, right: 15.0),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          controller.setChosenOptions(controller
                                              .currentMessage.actions[index]);
                                        },
                                        child: Text(
                                          controller
                                              .currentMessage.actions[index],
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFF7F7F7),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                : Container();
          }),
          Observer(
            builder: (BuildContext context) {
              return (controller.userCreated || controller.loginAccepted)
                  ? ChatEndButton()
                  : MessageComposer(
                      isEnable: _verifyMessageComposerState(),
                      hintMessage: controller.hintMessage,
                      keyboardType: controller.currentMessage.chatAction,
                      callback: (message) {
                        controller.verifyUserMessage(message);
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}
