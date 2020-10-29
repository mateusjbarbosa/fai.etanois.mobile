import 'package:etanois/app/modules/chat/model/message.model.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final Message message;

  const MessageWidget({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: (message.sender == MessageSender.USER) ? 80.0 : 25.0,
        right: (message.sender == MessageSender.USER) ? 25.0 : 80.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      decoration: (message.sender == MessageSender.USER)
          ? BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
                topRight: Radius.circular(3.0),
                bottomRight: Radius.circular(15.0),
              ),
            )
          : BoxDecoration(
              color: Color(0xFFF7F7F7),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(1, 2),
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3.0),
                bottomLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 10.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            message.text,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
