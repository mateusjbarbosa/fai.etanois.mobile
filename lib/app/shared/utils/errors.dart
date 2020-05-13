class Errors {
  String code;
  List<dynamic> errors;

  Errors({this.code, this.errors});

  Errors.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    errors = json['menssage'];
  }

  @override
  String toString() {
    return 'code: $code, errors: $errors';
  }
}
