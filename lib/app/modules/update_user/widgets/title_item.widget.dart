import 'package:flutter/material.dart';

class TitleItem extends StatelessWidget {
  final String text;

  const TitleItem({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Color(0xFFDEDEDE),
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
