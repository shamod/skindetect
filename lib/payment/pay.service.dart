import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class PayService {

  static const String LIVE_API_BASE = "https://api.stripe.com";
  static const String LIVE_API_PATH = LIVE_API_BASE + "/v1";

  static const String serverBaseUrl = 'http://10.0.0.198:5000';
  static const Map<String, String> headers = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };


  static generateToken(params, String publishableKey) async {
    final url = "$LIVE_API_PATH/tokens";

    final headers = { 'Authorization': 'Bearer ${publishableKey}', "Content-Type": "application/x-www-form-urlencoded" };
    final response = await http.post(url, headers: headers, body: params, encoding: convert.Encoding.getByName("utf-8"));

    var jsonResponse = convert.jsonDecode(response.body);
    return jsonResponse;
  }

  static postCharge(String stripeToken) async {
    final String chargeUrl = serverBaseUrl + '/charge';
    Map<String, String> stripe = {
      'stripeToken': stripeToken
    };
    final headers = { "Content-Type": "application/json" };

    final response = await http.post(chargeUrl, headers: headers, body: convert.json.encode(stripe));
    return convert.jsonDecode(response.body);
  }
}