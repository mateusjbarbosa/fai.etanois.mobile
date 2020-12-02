import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:etanois/app/modules/fuel_station/model/fuel_station.model.dart';
import 'package:etanois/app/modules/radar/widgets/fuel_station_item.widget.dart';

import 'radar.controller.dart';

class RadarPage extends StatefulWidget {
  @override
  _RadarPageState createState() => _RadarPageState();
}

class _RadarPageState extends ModularState<RadarPage, RadarController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        title: Text(
          'RADAR',
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
        child: controller.fuelStationController.fuelStations.length > 0
            ? ListView.builder(
                itemCount: controller.fuelStationController.fuelStations.length,
                itemBuilder: (context, index) {
                  FuelStation _fs =
                      controller.fuelStationController.fuelStations[index];
                  return Column(
                    children: <Widget>[
                      FuelStationItem(
                        fuelStation: _fs,
                        distance:
                            controller.distanceInKmBetweenEarthCoordinates(
                          _fs.lat,
                          _fs.lng,
                          controller.userController.user.userLocation.latitude,
                          controller.userController.user.userLocation.longitude,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'NÃO HÁ POSTOS DE COMBUSTÍVEL NA REGIÃO!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.7,
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      'AUMENTE O RAIO DE BUSCAS OU CONTINUE DIRIGINDO.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.7,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
