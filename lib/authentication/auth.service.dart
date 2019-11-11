import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skindetect/authentication/user.model.dart';

class AuthenticationService {
  static const String url = 'http://192.168.0.140:5000';
  static const Map headers = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };

  static Future<http.Response> endpointPost(String endpoint, User user) async {
    Future<http.Response> res;
    String body = json.encode(user.toJson());
    try {
      res = http.post("$url/$endpoint", headers: headers, body: body);
    } catch (err) {
      print(err);
    }

    return res;
  }
}
