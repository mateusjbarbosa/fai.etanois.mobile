import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/modules/home/widgets/item_menu.widget.dart';
import 'package:etanois/app/modules/home/home.controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    controller.loadUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Observer(
            builder: (context) {
              return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(-22.260182, -45.702649),
                  zoom: 16,
                ),
                markers: controller.markers,
                zoomControlsEnabled: false,
                buildingsEnabled: false,
                circles: controller.circles,
                onMapCreated: (GoogleMapController c) {
                  controller.mapController.complete(c);
                },
              );
            },
          ),
          Positioned(
            bottom: 30.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ItemMenu(
                    route: '/radar',
                    icon: 'assets/icons/radar.png',
                  ),
                  ItemMenu(
                    route: '/route',
                    icon: 'assets/icons/route.png',
                  ),
                  ItemMenu(
                    route: '/menu',
                    icon: 'assets/icons/menu.png',
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
