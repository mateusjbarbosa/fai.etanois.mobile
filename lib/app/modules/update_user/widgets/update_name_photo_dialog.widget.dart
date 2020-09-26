import 'dart:typed_data';

import 'package:flutter/material.dart';

class UpdateNamePhotoDialogWidget extends StatelessWidget {
  final String title, description;
  final TextEditingController name;
  final Uint8List image;
  final Function(String) callbackName;
  final Function(String) callbackImage;

  UpdateNamePhotoDialogWidget({
    this.title,
    this.description,
    this.image,
    this.name,
    this.callbackName,
    this.callbackImage,
  });

  Widget _card(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: Consts.avatarRadius + Consts.padding,
          bottom: Consts.padding,
          left: Consts.padding,
          right: Consts.padding,
        ),
        margin: EdgeInsets.only(top: Consts.avatarRadius),
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(Consts.padding),
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
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            TextField(
              controller: name,
              textAlign: TextAlign.center,
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
                    callbackName(name.text);

                    // TODO: Create decode/encode image and callback image
                    // callbackImage(image);

                    Navigator.of(context).pop();
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

  Widget _image(BuildContext context) {
    return Positioned(
      left: Consts.padding,
      right: Consts.padding,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: Consts.avatarRadius,
            child: ClipOval(
              child: Image.memory(image),
            ),
          ),
          RaisedButton(
            onPressed: () {},
            child: Icon(
              Icons.camera_alt,
              color: Color(0xFF1A1A1A).withOpacity(0.5),
            ),
            elevation: 0.0,
            color: Color(0xFFFAFAFA).withOpacity(0.3),
          ),
        ],
      ),
    );
  }

  Widget _dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        _card(context),
        _image(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: _dialogContent(context),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
