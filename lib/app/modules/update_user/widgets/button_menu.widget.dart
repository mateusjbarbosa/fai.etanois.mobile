import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget {
  final String text;
  final String route;
  final String type;
  final Color colorButton;
  final Color colorText;
  final bool active;

  const ButtonMenu({
    Key key,
    this.text,
    this.route,
    this.type,
    this.colorButton,
    this.colorText,
    this.active = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: active
          ? () {
              Navigator.pushNamed(context, route);
            }
          : () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: (type == 'large') ? 65.0 : 35.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: (colorButton != null) ? colorButton : Color(0xFFF7F7F7),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(3, 2),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: (colorText != null) ? colorText : Theme.of(context).accentColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
