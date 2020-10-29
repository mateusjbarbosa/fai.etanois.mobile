import 'package:etanois/app/modules/user/model/user.model.dart';
import 'package:etanois/app/modules/user/user.controller.dart';
import 'package:etanois/core/utils/error.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final UserController userController = GetIt.I.get<UserController>();

  bool _updating = false;
  bool _sucessfulUpdate = false;

  Widget _buildButton(String text, BuildContext context, bool update,
      {User user}) {
    return GestureDetector(
      onTap: update
          ? () async {
              setState(() {
                _updating = true;
              });

              Error errors = await userController.updateUser(user);

              if (errors.code == null) {
                setState(() {
                  _updating = false;
                  _sucessfulUpdate = true;
                });

                await Future.delayed(Duration(seconds: 2), () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (route) => false,
                  );
                });
              }
            }
          : () {
              Navigator.pop(context);
            },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: update ? 45.0 : 65.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: update ? Theme.of(context).primaryColor : Color(0xFFF7F7F7),
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
            color: Theme.of(context).accentColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final User _user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CONFIRMAR ALTERAÇÕES',
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: _updating
          ? Center(
              child: Text(
                'Carregando...',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : _sucessfulUpdate
              ? Center(
                  child: Text(
                    'Alterações realizadas com sucesso!',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Você tem certeza que deseja realizar as alterações?',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        _buildButton('CANCELAR', context, false),
                        SizedBox(
                          height: 16.0,
                        ),
                        _buildButton(
                          'CONFIRMAR ALTERAÇÕES',
                          context,
                          true,
                          user: _user,
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
