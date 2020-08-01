import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/modules/update_user/widgets/button_menu.widget.dart';
import 'package:etanois/app/modules/update_user/widgets/content_item.widget.dart';
import 'package:etanois/app/modules/update_user/widgets/title_item.widget.dart';

import 'update_user.controller.dart';

class UpdateUserPage extends StatefulWidget {
  @override
  _UpdateUserPageState createState() => _UpdateUserPageState();
}

class _UpdateUserPageState
    extends ModularState<UpdateUserPage, UpdateUserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          'EDITAR PERFIL',
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TitleItem(text: 'NOME COMPLETO'),
            Row(
              children: <Widget>[
                Expanded(
                    child: ContentItem(
                  text: '${controller.userController.user.name}',
                )),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                )
              ],
            ),
            TitleItem(text: 'USERNAME'),
            ContentItem(
              text: '${controller.userController.user.username}',
            ),
            TitleItem(text: 'E-MAIL'),
            ContentItem(
              text: '${controller.userController.user.email}',
            ),
            ButtonMenu(text: 'PREFERÊNCIAS', route: '/works', type: 'large'),
            Observer(
              builder: (context) {
                return ButtonMenu(
                  text: 'SALVAR ALTERAÇÕES',
                  route: '/works',
                  type: 'large',
                  colorButton: controller.saveChanges
                      ? Theme.of(context).accentColor
                      : Color.fromRGBO(32, 43, 48, 0.3),
                  colorText: Color(0xFFF7F7F7),
                  active: controller.saveChanges,
                );
              },
            ),
            TitleItem(text: 'CUIDADO'),
            ButtonMenu(
              text: 'ALTERAR SENHA',
              route: '/works',
              type: 'small',
              colorButton: Theme.of(context).primaryColor,
            ),
            ButtonMenu(
              text: 'INATIVAR CONTA',
              route: '/works',
              type: 'small',
              colorButton: Color.fromRGBO(255, 0, 0, .7),
              colorText: Color(0xFFF7F7F7),
            ),
          ],
        ),
      ),
    );
  }
}
