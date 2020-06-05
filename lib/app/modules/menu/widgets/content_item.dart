import 'package:flutter/material.dart';

class ContentItem extends StatelessWidget {
  final String text;

  const ContentItem({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).accentColor,
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
