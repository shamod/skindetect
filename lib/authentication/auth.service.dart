import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skindetect/authentication/user.model.dart';

class AuthenticationService {

  static Future<http.Response> saveRegistrationDataToAPI(User body) async {
    var response ;
    var connected = true ;
    try{
      var url = 'http://10.0.0.198:5000/register';
      response = await http.post(url, body: json.encode(body.toJson()), headers: {"Content-type": "application/json", "Accept": "application/json"});
      return response;
    }
    catch(e){
      connected = false ;
    }

  }

  static Future<http.Response> verifyLogin(User body) async {
    var response ;
    var connected = true ;
    try{
      var url = 'http://10.0.0.198:5000/login';
      response = await http.post(url, body: json.encode(body.toJson()), headers: {"Content-type": "application/json", "Accept": "application/json"});
      return response;
    }
    catch(e){
      connected = false ;
    }
  }

}