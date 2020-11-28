import 'package:etanois/app/modules/user/model/user.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'user_preferences.controller.dart';

class UserPreferencesPage extends StatefulWidget {
  @override
  _UserPreferencesPageState createState() => _UserPreferencesPageState();
}

class _UserPreferencesPageState
    extends ModularState<UserPreferencesPage, UserPreferencesController> {
  TextEditingController _radiusController = TextEditingController();
  User _user = User();

  @override
  void initState() {
    super.initState();

    _user = controller.userController.user;

    _radiusController.text =
        (controller.userController.user.searchDistanceWithoutRoute / 1000)
            .round()
            .toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          'PREFERÊNCIAS',
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'DISTÂNCIA DE BUSCA PELO RADAR',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Insira um valor entre 01 km e 10 km',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            TextField(
              controller: _radiusController,
              maxLength: 3,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Insira a distância do raio de buscas',
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            GestureDetector(
              onTap: () {
                _user.searchDistanceWithoutRoute =
                    (int.parse(_radiusController.text) * 1000);
                controller.userController.updateUser(_user);

                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 65.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFF7F7F7),
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
                  'SALVAR ALTERAÇÕES',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
