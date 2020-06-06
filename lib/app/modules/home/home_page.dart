import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  Widget _buttonMenu(String route, String icon) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Container(
        width: 70.0,
        height: 70.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          color: Theme.of(context).accentColor,
        ),
        child: Image.asset(
          icon,
          height: 35.0,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    controller.setMapStyle();

    controller.onInitPosition();
    controller.recoverUserLocation();
    controller.onListenerUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: controller.userPosition,
            onMapCreated: controller.onMapCreated,
            zoomControlsEnabled: false,
            buildingsEnabled: false,
            myLocationEnabled: true,
          ),
          Positioned(
            bottom: 30.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buttonMenu(
                    '/radar',
                    'assets/icons/radar.png',
                  ),
                  _buttonMenu(
                    '/route',
                    'assets/icons/route.png',
                  ),
                  _buttonMenu(
                    '/menu',
                    'assets/icons/menu.png',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
