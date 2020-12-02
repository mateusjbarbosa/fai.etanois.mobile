import 'package:etanois/app/modules/chat/model/message.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageComposer extends StatefulWidget {
  final bool isEnable;
  final String hintMessage;
  final ChatActions keyboardType;
  final Function callback;

  const MessageComposer({
    Key key,
    this.isEnable,
    this.hintMessage,
    this.keyboardType,
    this.callback,
  }) : super(key: key);

  @override
  _MessageComposerState createState() => _MessageComposerState();
}

class _MessageComposerState extends State<MessageComposer> {
  TextEditingController _messageComposerController = TextEditingController();
  bool visiblePassword = false;

  TextInputType _verifyKeyboardType() {
    TextInputType type;

    switch (widget.keyboardType) {
      case ChatActions.INPUT_EMAIL:
        type = TextInputType.emailAddress;
        break;
      case ChatActions.INPUT_PASSWORD:
        type = TextInputType.visiblePassword;
        break;
      case ChatActions.INPUT_NAME:
      case ChatActions.INPUT_USERNAME:
      case ChatActions.CREATE_USER:
      case ChatActions.LOGIN:
      case ChatActions.GO_HOME:
      case ChatActions.SELECT:
      case ChatActions.NONE:
      default:
        type = TextInputType.text;
        break;
    }

    return type;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      height: 80.0,
      color: Color(0xFFF7F7F7),
      child: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          color: Color(0xFFE0E0E0),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _messageComposerController,
                enabled: widget.isEnable,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: _verifyKeyboardType(),
                obscureText: widget.keyboardType == ChatActions.INPUT_PASSWORD
                    ? visiblePassword ? false : true
                    : false,
                enableSuggestions:
                    widget.keyboardType == ChatActions.INPUT_PASSWORD
                        ? false
                        : true,
                autocorrect: widget.keyboardType == ChatActions.INPUT_PASSWORD
                    ? false
                    : true,
                decoration: InputDecoration.collapsed(
                  hintStyle: TextStyle(color: Color(0xFFABABAB)),
                  hintText: widget.hintMessage,
                ),
              ),
            ),
            widget.keyboardType == ChatActions.INPUT_PASSWORD
                ? GestureDetector(
                    child: visiblePassword
                        ? Image.asset(
                            'assets/icons/opened_eye.png',
                            height: 30.0,
                            color: widget.isEnable
                                ? Theme.of(context).accentColor
                                : Color(0xFFABABAB),
                          )
                        : Image.asset(
                            'assets/icons/closed_eye.png',
                            height: 30.0,
                            color: widget.isEnable
                                ? Theme.of(context).accentColor
                                : Color(0xFFABABAB),
                          ),
                    onTap: () {
                      setState(() {
                        visiblePassword = !visiblePassword;
                      });
                    },
                  )
                : Container(),
            SizedBox(
              width: 8.0,
            ),
            GestureDetector(
              child: Image.asset(
                'assets/icons/send_message.png',
                height: 30.0,
                color: widget.isEnable
                    ? Theme.of(context).accentColor
                    : Color(0xFFABABAB),
              ),
              onTap: widget.isEnable
                  ? () {
                      widget.callback(_messageComposerController.text);
                      _messageComposerController.clear();
                    }
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
