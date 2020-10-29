import 'package:flutter/material.dart';

class WorksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        title: Text('EM CONSTRUÇÃO!'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Aguarde!',
              style: TextStyle(
                fontSize: 36,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              'Estamos construindo essa funcionalidade ainda...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
