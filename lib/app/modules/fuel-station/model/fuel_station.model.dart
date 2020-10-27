class FuelStation {
  int id;
  String cnpj;
  String phoneNumber;
  String name;
  String streetNumber;
  String street;
  String neighborhood;
  String city;
  String state;
  String cep;
  double lat;
  double lng;
  String flagOfFuelStation;
  bool restaurant;
  bool carWash;
  bool mechanical;
  String timeToOpen;
  String timeToClose;
  List<AvailableFuels> availableFuels;
  List<AvailableServices> availableServices;

  FuelStation({
    this.id,
    this.cnpj,
    this.phoneNumber,
    this.name,
    this.streetNumber,
    this.street,
    this.neighborhood,
    this.city,
    this.state,
    this.cep,
    this.lat,
    this.lng,
    this.flagOfFuelStation,
    this.restaurant,
    this.carWash,
    this.mechanical,
    this.timeToOpen,
    this.timeToClose,
    this.availableFuels,
    this.availableServices,
  });

  FuelStation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cnpj = json['cnpj'];
    phoneNumber = json['phone_number'];
    name = json['name'];
    streetNumber = json['street_number'];
    street = json['street'];
    neighborhood = json['neighborhood'];
    city = json['city'];
    state = json['state'];
    cep = json['cep'];
    lat = json['lat'];
    lng = json['lng'];
    flagOfFuelStation = json['flag_of_fuel_station'];
    restaurant = json['restaurant'];
    carWash = json['car_wash'];
    mechanical = json['mechanical'];
    timeToOpen = json['time_to_open'];
    timeToClose = json['time_to_close'];
    if (json['available_fuels'] != null) {
      availableFuels = new List<AvailableFuels>();
      json['available_fuels'].forEach((v) {
        availableFuels.add(new AvailableFuels.fromJson(v));
      });
    }
    if (json['available_services'] != null) {
      availableServices = new List<AvailableServices>();
      json['available_services'].forEach((v) {
        availableServices.add(new AvailableServices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cnpj'] = this.cnpj;
    data['phone_number'] = this.phoneNumber;
    data['name'] = this.name;
    data['street_number'] = this.streetNumber;
    data['street'] = this.street;
    data['neighborhood'] = this.neighborhood;
    data['city'] = this.city;
    data['state'] = this.state;
    data['cep'] = this.cep;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['flag_of_fuel_station'] = this.flagOfFuelStation;
    data['restaurant'] = this.restaurant;
    data['car_wash'] = this.carWash;
    data['mechanical'] = this.mechanical;
    data['time_to_open'] = this.timeToOpen;
    data['time_to_close'] = this.timeToClose;
    if (this.availableFuels != null) {
      data['available_fuels'] =
          this.availableFuels.map((v) => v.toJson()).toList();
    }
    if (this.availableServices != null) {
      data['available_services'] =
          this.availableServices.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AvailableFuels {
  double price;
  int fuelStationId;
  String fuel;

  AvailableFuels({
    this.price,
    this.fuelStationId,
    this.fuel,
  });

  AvailableFuels.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    fuelStationId = json['fuel_station_id'];
    fuel = json['fuel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['fuel_station_id'] = this.fuelStationId;
    data['fuel'] = this.fuel;
    return data;
  }
}

class AvailableServices {
  String serviceType;
  int fuelStationId;
  String timeToOpen;
  String timeToClose;
  bool service24Hours;

  AvailableServices({
    this.serviceType,
    this.fuelStationId,
    this.timeToOpen,
    this.timeToClose,
    this.service24Hours,
  });

  AvailableServices.fromJson(Map<String, dynamic> json) {
    serviceType = json['service_type'];
    fuelStationId = json['fuel_station_id'];
    timeToOpen = json['time_to_open'];
    timeToClose = json['time_to_close'];
    service24Hours = json['service_24_hours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_type'] = this.serviceType;
    data['fuel_station_id'] = this.fuelStationId;
    data['time_to_open'] = this.timeToOpen;
    data['time_to_close'] = this.timeToClose;
    data['service_24_hours'] = this.service24Hours;
    return data;
  }
}
