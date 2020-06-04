import 'package:flutter/material.dart';

class MessageComposer extends StatefulWidget {
  @override
  _MessageComposerState createState() => _MessageComposerState();
}

class _MessageComposerState extends State<MessageComposer> {
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
                textCapitalization: TextCapitalization.sentences,
                onChanged: (value) {},
                decoration: InputDecoration.collapsed(
                  hintStyle: TextStyle(color: Color(0xFFABABAB)),
                  hintText: 'Escreva uma mensagem...',
                ),
              ),
            ),
            GestureDetector(
              child: Image.asset(
                'assets/icons/send_message.png',
                height: 30.0,
                color: Color(0xFFABABAB),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
