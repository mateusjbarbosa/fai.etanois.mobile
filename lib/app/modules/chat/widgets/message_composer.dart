import 'package:flutter/material.dart';

class MessageComposer extends StatefulWidget {
  final bool isEnable;
  final String hintMessage;
  final Function callback;

  const MessageComposer({Key key, this.isEnable, this.hintMessage, this.callback}) : super(key: key);

  @override
  _MessageComposerState createState() => _MessageComposerState();
}

class _MessageComposerState extends State<MessageComposer> {
  TextEditingController _messageComposerController = TextEditingController();

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
                onChanged: (value) {},
                decoration: InputDecoration.collapsed(
                  hintStyle: TextStyle(color: Color(0xFFABABAB)),
                  hintText: widget.hintMessage,
                ),
              ),
            ),
            GestureDetector(
              child: Image.asset(
                'assets/icons/send_message.png',
                height: 30.0,
                color: widget.isEnable ? Theme.of(context).accentColor : Color(0xFFABABAB),
              ),
              onTap: widget.isEnable
                  ? () {
                      widget.callback(_messageComposerController.text);
                      _messageComposerController.clear();
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
