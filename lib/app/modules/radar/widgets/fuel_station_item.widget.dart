import 'package:flutter/material.dart';

import 'package:etanois/app/modules/fuel-station/model/fuel_station.model.dart';

class FuelStationItem extends StatefulWidget {
  final FuelStation fuelStation;
  final String distance;

  FuelStationItem({
    Key key,
    this.fuelStation,
    this.distance,
  }) : super(key: key);

  @override
  _FuelStationItemState createState() => _FuelStationItemState();
}

class _FuelStationItemState extends State<FuelStationItem> {
  bool _viewFuelStationDetails = false;

  Widget _buildFuelStationService(AvailableServices service) {
    String response;

    switch (service.serviceType) {
      case 'car_wash':
        response = 'LAVA RÁPIDO';
        break;
      case 'convenience_store':
        response = 'LOJA DE CONVENIÊNCIA';
        break;
      case 'mechanical':
        response = 'MECÂNICO';
        break;
      case 'restaurant':
        response = 'RESTAURANTE';
        break;
      case 'tire_repair_shop':
        response = 'BORRACHARIA';
        break;
    }
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.asset(
              'assets/icons/check.png',
              height: 16.0,
            ),
            SizedBox(
              width: 8.0,
            ),
            service.timeToOpen != null
                ? Text(
                    '$response (${service.timeToOpen} | ${service.timeToClose})',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.7,
                    ),
                  )
                : Text(
                    '$response (24 horas)',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.7,
                    ),
                  ),
          ],
        ),
        SizedBox(
          height: 16.0,
        ),
      ],
    );
  }

  Widget _buildFuelStationDetail(String asset, String text) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.asset(
              asset,
              height: 20.0,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              text,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.7,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.0,
        ),
      ],
    );
  }

  Widget _buildFuelStationDetails(FuelStation fs) {
    AvailableFuels _mostExpansiveFuel;
    AvailableFuels _cheaperFuel;
    String _correspondencePrice;

    if (fs.availableFuels[0].price > fs.availableFuels[1].price) {
      _mostExpansiveFuel = fs.availableFuels[0];
      _cheaperFuel = fs.availableFuels[1];
    } else {
      _mostExpansiveFuel = fs.availableFuels[1];
      _cheaperFuel = fs.availableFuels[0];
    }

    _correspondencePrice =
        ((_cheaperFuel.price / _mostExpansiveFuel.price) * 100)
            .toStringAsFixed(1)
            .toString();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFFF7F7F7),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'AVALIAÇÃO DOS PREÇOS',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.7,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'O litro do(a) ${_cheaperFuel.fuel} corresponde a $_correspondencePrice% do litro do(a) ${_mostExpansiveFuel.fuel}.'
                .toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.7,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'INFORMAÇÕES DO POSTO',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.7,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          _buildFuelStationDetail(
            'assets/icons/star.png',
            'Sem avaliações',
          ),
          _buildFuelStationDetail(
            'assets/icons/clock.png',
            '${fs.timeToOpen} | ${fs.timeToClose}',
          ),
          for (AvailableServices service in fs.availableServices)
            _buildFuelStationService(service),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              _viewFuelStationDetails = !_viewFuelStationDetails;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFF7F7F7),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.fuelStation.name.toUpperCase(),
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.fuelStation.flagOfFuelStation.toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.7,
                      ),
                    ),
                    Text(
                      '${widget.distance} km',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.7,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.fuelStation.availableFuels[0].fuel
                              .toUpperCase(),
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.7,
                          ),
                        ),
                        Text(
                          'R\$ ${widget.fuelStation.availableFuels[0].price.toStringAsFixed(2).toString()}9',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.7,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.fuelStation.availableFuels[1].fuel
                              .toUpperCase(),
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.7,
                          ),
                        ),
                        Text(
                          'R\$ ${widget.fuelStation.availableFuels[1].price.toStringAsFixed(2).toString()}9',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.7,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        _viewFuelStationDetails
            ? _buildFuelStationDetails(
                widget.fuelStation,
              )
            : Container(),
      ],
    );
  }
}
