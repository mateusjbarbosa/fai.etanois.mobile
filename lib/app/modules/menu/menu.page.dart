import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/modules/menu/widgets/button_menu.widget.dart';
import 'package:etanois/app/modules/menu/widgets/content_item.widget.dart';
import 'package:etanois/app/modules/menu/widgets/title_item.widget.dart';

import 'menu.controller.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends ModularState<MenuPage, MenuController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        title: Text(
          'OLÁ, ${controller.userController.getFirstName()}'.toUpperCase(),
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
            TitleItem(text: 'ETACOINS'),
            ContentItem(
              text: 'e\$ ${controller.userController.user.etacoins}',
            ),
            TitleItem(text: 'GASTOS NO MÊS'),
            ContentItem(
              text: 'Em breve...',
            ),
            TitleItem(text: 'CONSUMO MÉDIO'),
            ContentItem(
              text: 'Em breve...',
            ),
            ButtonMenu(
                text: 'ADICIONE ETANOIS', route: '/works', type: 'large'),
            ButtonMenu(
                text: 'EDITAR PERFIL',
                route: '/menu/update-user',
                type: 'large'),
            ButtonMenu(
                text: 'ÁREA DO FRENTISTA', route: '/works', type: 'large'),
            ButtonMenu(text: 'AJUDA', route: '/works', type: 'small'),
            ButtonMenu(text: 'SAIR', route: '/works', type: 'small'),
          ],
        ),
      ),
    );
  }
}
