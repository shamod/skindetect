import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class PayService {

  static const String LIVE_API_BASE = "https://api.stripe.com";
  static const String LIVE_API_PATH = LIVE_API_BASE + "/v1";


  static createToken(params, String publishableKey) async {
    final url = "$LIVE_API_PATH/tokens";

    final headers = { 'Authorization': 'Bearer ${publishableKey}', "Content-Type": "application/x-www-form-urlencoded" };
    final response = await http.post(url, headers: headers, body: params, encoding: convert.Encoding.getByName("utf-8"));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var jsonResponse = convert.jsonDecode(response.body);
    return jsonResponse;
  }

  static chargeStripe(String stripeToken) async {
    final url = 'http://10.0.0.198:5000/charge';
    Map<String, String> stripe = {
      'stripeToken': stripeToken
    };
    final headers = { "Content-Type": "application/json" };

    final response = await http.post(url, headers: headers, body: convert.json.encode(stripe));
    return convert.jsonDecode(response.body);
  }
}