import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Color(0xFFF7F7F7),
          ),
          Positioned(
            bottom: 30.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 70.0,
                    height: 70.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Theme.of(context).accentColor,
                    ),
                    child: Text(
                      'R',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: 70.0,
                    height: 70.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Theme.of(context).accentColor,
                    ),
                    child: Text(
                      'RT',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Modular.to.pushNamed('/menu');
                    },
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        color: Theme.of(context).accentColor,
                      ),
                      child: Text(
                        'M',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
