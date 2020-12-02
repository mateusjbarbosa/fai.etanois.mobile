import 'package:flutter/material.dart';

class ChatEndButton extends StatelessWidget {
  final Function callback;

  const ChatEndButton({Key key, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      height: 80.0,
      color: Color(0xFFF7F7F7),
      child: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
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
                callback != null
                    ? callback()
                    : Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text(
                callback != null ? 'REALIZAR LOGIN' : 'FINALIZAR CHAT',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF7F7F7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
