import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class PayService {

  static const Map<String, String> headers = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };


  static generateToken(params, String publishableKey, String stripeURL) async {

    final headers = { 'Authorization': 'Bearer ${publishableKey}', "Content-Type": "application/x-www-form-urlencoded" };
    final response = await http.post(stripeURL, headers: headers, body: params, encoding: convert.Encoding.getByName("utf-8"));

    var jsonResponse = convert.jsonDecode(response.body);
    return jsonResponse;
  }

  static postCharge(String stripeToken, String chargeURL) async {
    Map<String, String> stripe = {
      'stripeToken': stripeToken
    };
    final headers = { "Content-Type": "application/json" };

    final response = await http.post(chargeURL, headers: headers, body: convert.json.encode(stripe));
    return convert.jsonDecode(response.body);
  }
}