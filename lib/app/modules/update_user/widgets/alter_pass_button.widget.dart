import 'package:flutter/material.dart';

import 'package:etanois/app/modules/update_user/widgets/update_password_dialog.widget.dart';

class AlterPassButton extends StatelessWidget {
  final String currentPass;
  final Function callbackNewPass;

  const AlterPassButton({Key key, this.currentPass, this.callbackNewPass})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => UpdatePasswordDialogWidget(
            currentPass,
            callbackNewPass,
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 35.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
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
          'ALTERAR SENHA',
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
}
