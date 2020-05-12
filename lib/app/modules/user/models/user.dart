class User {
  int id;
  String name;
  String email;
  String password;
  String paymentMode;
  String cep;
  String role;

  User({this.id, this.name, this.email, this.password, this.paymentMode, this.cep, this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    paymentMode = json['payment_mode'];
    cep = json['cep'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['payment_mode'] = this.paymentMode;
    data['cep'] = this.cep;

    return data;
  }

  @override
  String toString() {
    return 'name: $name, email: $email, pass: $password, payment: $paymentMode, cep: $cep';
  }
}
