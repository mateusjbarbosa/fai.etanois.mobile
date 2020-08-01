import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  final String route;
  final String icon;

  const ItemMenu({Key key, this.route, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Container(
        width: 70.0,
        height: 70.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          color: Theme.of(context).accentColor,
        ),
        child: Image.asset(
          icon,
          height: 35.0,
        ),
      ),
    );
  }
}
