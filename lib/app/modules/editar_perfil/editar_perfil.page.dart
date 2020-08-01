import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/modules/editar_perfil/widgets/button_menu.widget.dart';
import 'package:etanois/app/modules/editar_perfil/widgets/content_item.widget.dart';
import 'package:etanois/app/modules/editar_perfil/widgets/title_item.widget.dart';

import 'editar_perfil.controller.dart';

class EditarPerfilPage extends StatefulWidget {
  @override
  _EditarPerfilPageState createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState
    extends ModularState<EditarPerfilPage, EditarPerfilController> {
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
            ButtonMenu(text: 'PREFERÊNCIAS', route: '', type: 'large'),
            Observer(
              builder: (context) {
                return ButtonMenu(
                  text: 'SALVAR ALTERAÇÕES',
                  route: '',
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
              route: '',
              type: 'small',
              colorButton: Theme.of(context).primaryColor,
            ),
            ButtonMenu(
              text: 'INATIVAR CONTA',
              route: '',
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
