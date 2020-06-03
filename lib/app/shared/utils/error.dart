class Error {
  String code;
  List<dynamic> messages;

  Error({this.code, this.messages});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    messages = json['msg'];
  }

  @override
  String toString() {
    return 'code: $code, messages: $messages';
  }
}
