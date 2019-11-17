import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skindetect/authentication/user.model.dart';
import 'package:skindetect/config.dart';

class AuthenticationService {

  static const Map<String, String> headers = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };


  static Future<http.Response> endpointPost(String endpointUrl, User user) {
    Future<http.Response> response;

    try {
      String body = json.encode(user.toJson());
      response = http.post(endpointUrl, body: body, headers: headers);
    } catch (err) {
      print(err);
    }

    return response;
  }
}
