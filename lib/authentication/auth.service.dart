import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skindetect/authentication/user.model.dart';

class AuthenticationService {
  static const String authServerBaseUrl = 'http://192.168.0.140:5000';
  static const Map<String, String> headers = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };


  static Future<http.Response> endpointPost(String endpoint, User user) {
    Future<http.Response> response;

    try {
      String url = '$authServerBaseUrl/$endpoint';
      String body = json.encode(user.toJson());
      response = http.post(url, body: body, headers: headers);
    } catch (err) {
      print(err);
    }

    return response;
  }
}
