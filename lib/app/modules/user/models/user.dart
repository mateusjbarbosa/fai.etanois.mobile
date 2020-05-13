class User {
  int id;
  String name;
  String username;
  String email;

  String cep;
  String paymentMode;
  int searchDistanceWithRoute;
  int searchDistanceWithoutRoute;
  List<String> userPreferenceFuels;

  int etacoins;

  String role;
  String activate;

  String password;
  String token;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.cep,
    this.paymentMode,
    this.searchDistanceWithRoute,
    this.searchDistanceWithoutRoute,
    this.userPreferenceFuels,
    this.etacoins,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    cep = json['cep'];
    paymentMode = json['payment_mode'];
    searchDistanceWithRoute = json['search_distance_with_route'];
    searchDistanceWithoutRoute = json['search_distance_without_route'];
    userPreferenceFuels = json['user_preference_fuels'].cast<String>();
    etacoins = json['etacoins'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['cep'] = this.cep;
    data['payment_mode'] = this.paymentMode;
    data['search_distance_with_route'] = this.searchDistanceWithRoute;
    data['search_distance_without_route'] = this.searchDistanceWithoutRoute;
    data['user_preference_fuels'] = this.userPreferenceFuels;
    data['etacoins'] = this.etacoins;

    return data;
  }
}
