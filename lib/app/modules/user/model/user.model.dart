import 'package:google_maps_flutter/google_maps_flutter.dart';

class User {
  int id;

  String name;
  String username;
  String email;
  String password;

  String cep;
  String paymentMode;
  int searchDistanceWithRoute;
  int searchDistanceWithoutRoute;
  List<String> userPreferenceFuels;

  int etacoins;

  String image;

  LatLng userLocation;

  String token;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.password,
    this.cep,
    this.paymentMode,
    this.searchDistanceWithRoute,
    this.searchDistanceWithoutRoute,
    this.userPreferenceFuels,
    this.etacoins,
    this.image,
    this.token,
  });

  User.fromJson(Map<String, dynamic> json, {String newPassword}) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    password = json['password'] ?? newPassword;
    cep = json['cep'];
    paymentMode = json['payment_mode'];
    searchDistanceWithRoute = json['search_distance_with_route'];
    searchDistanceWithoutRoute = json['search_distance_without_route'];
    userPreferenceFuels = json['user_preference_fuels'].cast<String>();
    etacoins = json['etacoins'];
    image = json['image'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['cep'] = this.cep;
    data['payment_mode'] = this.paymentMode;
    data['search_distance_with_route'] = this.searchDistanceWithRoute;
    data['search_distance_without_route'] = this.searchDistanceWithoutRoute;
    data['user_preference_fuels'] = this.userPreferenceFuels;
    data['etacoins'] = this.etacoins;

    return data;
  }

  @override
  String toString() {
    return '$id | $name | $username | $email | $password | $cep | $paymentMode | $searchDistanceWithRoute | $searchDistanceWithoutRoute | $userPreferenceFuels | $etacoins | $token';
  }
}
