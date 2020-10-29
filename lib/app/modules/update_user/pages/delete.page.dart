import 'package:etanois/app/modules/user/user.controller.dart';
import 'package:etanois/core/utils/error.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DeletePage extends StatefulWidget {
  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  final UserController userController = GetIt.I.get<UserController>();

  bool _deleting = false;
  bool _sucessfulDelete = false;

  Widget _buildButton(
    String text,
    BuildContext context,
    bool delete,
  ) {
    return GestureDetector(
      onTap: delete
          ? () async {
              setState(() {
                _deleting = true;
              });

              Error errors = await userController.deleteUser();

              if (errors.code == null) {
                setState(() {
                  _deleting = false;
                  _sucessfulDelete = true;
                });

                await Future.delayed(Duration(seconds: 5), () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
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
        height: delete ? 45.0 : 65.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: delete ? Color.fromRGBO(255, 0, 0, .7) : Color(0xFFF7F7F7),
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
            color: delete ? Color(0xFFF7F7F7) : Theme.of(context).accentColor,
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'INATIVAR USUÁRIO',
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
      body: _deleting
          ? Center(
              child: Text(
                'Carregando...',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : _sucessfulDelete
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      'Usuário inativado com sucesso! É uma pena ver você deixar o Etanóis, mas esperamos que você retorne! Obrigado por utilizar o Etanóis!',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Você tem certeza que deseja inativar o seu usuário?',
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
                        _buildButton('INATIVAR MINHA CONTA', context, true),
                      ],
                    ),
                  ),
                ),
    );
  }
}
