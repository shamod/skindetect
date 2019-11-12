import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skindetect/payment/pay.model.dart';
import 'package:skindetect/payment/pay.service.dart';
//import 'package:stripe_payment/stripe_payment.dart';

import '../components/skin_detect_app_bar.dart';

class PayPage extends StatefulWidget {

  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static var _pay = Pay();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SkinDetectAppBar(),
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _creditCardNumberField(),
            _expirationMonthField(),
            _expirationYearField(),
            _CVCField(),
            _payButton(context),
          ],
        ),
      ),
    ),
    );
  }

  _creditCardNumberField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Credit Card Number',
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Credit Card Number",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onChanged: (val) => setState(() => _pay.number = val),
      ),
    );
  }

  _expirationMonthField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Expiration Month',
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Expiration Month",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onChanged: (val) => setState(() => _pay.expMonth = val),
      ),
    );
  }

  _expirationYearField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Expiration Year',
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Expiration Year",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onChanged: (val) => setState(() => _pay.expYear = val),
      ),
    );
  }

  _CVCField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'CVC',
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "CVC",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onChanged: (val) => setState(() => _pay.cvc = val),
      ),
    );
  }

  _payButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () async {
            if(_formKey.currentState.validate()) {
              Pay creditCardInfo = Pay();
              creditCardInfo.number = _pay.number;
              creditCardInfo.expMonth = _pay.expMonth;
              creditCardInfo.expYear = _pay.expYear;
              creditCardInfo.cvc = _pay.cvc;

              var card = creditCardInfo.toForm();
              var token = await PayService.createToken(card, 'pk_test_4f6xxU4M7IJpjubbYsfgaJqH');
              if(token['id'] != null) {
                var response = await PayService.chargeStripe(token['id']);
                print(response);
              }
            }
          },
          child: Text("Submit Payment",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}