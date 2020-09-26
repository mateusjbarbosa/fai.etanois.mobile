import 'package:flutter/material.dart';

class UpdatePasswordDialogWidget extends StatefulWidget {
  final String currentPass;
  final Function callbackNewPass;

  UpdatePasswordDialogWidget(this.currentPass, this.callbackNewPass);

  @override
  _UpdatePasswordDialogWidget createState() => _UpdatePasswordDialogWidget();
}

class _UpdatePasswordDialogWidget extends State<UpdatePasswordDialogWidget> {
  TextEditingController controllerOldPass = TextEditingController();
  TextEditingController controllerNewPass = TextEditingController();

  bool _validateOldPass = false;
  bool _validateNewPass = false;

  Widget _card(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        margin: EdgeInsets.only(top: 8.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: <Widget>[
            Text(
              'ALTERAR SUA SENHA',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Primeiramente insira sua senha atual e logo abaixo, a nova, por favor.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: controllerOldPass,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Senha atual',
                errorText:
                    _validateOldPass ? 'Senha atual não corresponde!' : null,
              ),
              onChanged: (text) {
                setState(() {
                  _validateOldPass = false;
                });
              },
            ),
            SizedBox(height: 24.0),
            TextField(
              controller: controllerNewPass,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Senha nova',
                errorText: _validateNewPass
                    ? 'A senha deve possuir entre 6 e 20 caracteres!'
                    : null,
              ),
              onChanged: (text) {
                setState(() {
                  _validateNewPass = false;
                });
              },
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancelar'),
                ),
                SizedBox(
                  width: 8.0,
                ),
                RaisedButton(
                  onPressed: () {
                    if ((controllerOldPass.text == widget.currentPass) &&
                        (controllerNewPass.text.length >= 6 &&
                            controllerNewPass.text.length <= 20)) {
                      widget.callbackNewPass(controllerNewPass.text);
                      Navigator.of(context).pop();
                    } else if (controllerOldPass.text == widget.currentPass) {
                      setState(() {
                        _validateNewPass = true;
                      });
                    } else {
                      setState(() {
                        _validateNewPass = true;
                        _validateOldPass = true;
                      });
                    }
                  },
                  child: Text(
                    'SALVAR',
                    style: TextStyle(color: Color(0xFFFAFAFA)),
                  ),
                  elevation: 0.0,
                  color: Theme.of(context).accentColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        _card(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: _dialogContent(context),
    );
  }
}
