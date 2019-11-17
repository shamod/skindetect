import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skindetect/config.dart';
import 'package:skindetect/payment/pay.model.dart';
import 'package:skindetect/payment/pay.service.dart';

class PayPage extends StatefulWidget {
  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static var _pay = Pay();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: <Widget>[
        Image.asset('assets/images/auth_background.jpg',
            fit: BoxFit.cover, width: MediaQuery.of(context).size.width),
        LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                      child: Column(children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 64,
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.navigate_before),
                                color: Colors.white,
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/diagnose'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Expanded(
                        child: Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          SvgPicture.asset('assets/images/logo.svg',
                              color: Colors.white,
                              height: 128,
                              semanticsLabel: 'SkinDetect Logo'),
                          Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.all(8),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 10.0, sigmaY: 10.0),
                                          child: Container(
                                              child: TextFormField(
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Please enter some text';
                                                    }
                                                    return null;
                                                  },
                                                  onChanged: (val) => setState(() => _pay.creditCardNumber = val),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  decoration: InputDecoration(
                                                      errorStyle: TextStyle(color: Colors.white),
                                                      border: InputBorder.none,
                                                      labelText: 'Credit Card Number',
                                                      hintText: 'Credit Card Number',
                                                      hintStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              127,
                                                              255,
                                                              255,
                                                              255)),
                                                      labelStyle: TextStyle(
                                                          color: Colors.white),
                                                      filled: true,
                                                      fillColor: Color.fromARGB(
                                                          64, 0, 0, 0)))),
                                        ),
                                      )),
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 10.0, sigmaY: 10.0),
                                          child: Container(
                                              child: TextFormField(
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Please enter some text';
                                                    }
                                                    return null;
                                                  },
                                                  onChanged: (val) => setState(() => _pay.expirationMonth = val),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  decoration: InputDecoration(
                                                      errorStyle: TextStyle(color: Colors.white),
                                                      border: InputBorder.none,
                                                      labelText: 'Expiration Month',
                                                      hintText: 'Expiration Month',
                                                      hintStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              127,
                                                              255,
                                                              255,
                                                              255)),
                                                      labelStyle: TextStyle(
                                                          color: Colors.white),
                                                      filled: true,
                                                      fillColor: Color.fromARGB(
                                                          64, 0, 0, 0)))),
                                        ),
                                      )),
                                      Padding(
                                      padding: EdgeInsets.all(8),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 10.0, sigmaY: 10.0),
                                          child: Container(
                                              child: TextFormField(
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Please enter some text';
                                                    }
                                                    return null;
                                                  },
                                                  onChanged: (val) => setState(() => _pay.expirationYear = val),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  decoration: InputDecoration(
                                                      errorStyle: TextStyle(color: Colors.white),
                                                      border: InputBorder.none,
                                                      labelText: 'Expiration Year',
                                                      hintText: 'Expiration Year',
                                                      hintStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              127,
                                                              255,
                                                              255,
                                                              255)),
                                                      labelStyle: TextStyle(
                                                          color: Colors.white),
                                                      filled: true,
                                                      fillColor: Color.fromARGB(
                                                          64, 0, 0, 0)))),
                                        ),
                                      )),

                                      Padding(
                                      padding: EdgeInsets.all(8),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 10.0, sigmaY: 10.0),
                                          child: Container(
                                              child: TextFormField(
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Please enter some text';
                                                    }
                                                    return null;
                                                  },
                                                  onChanged: (val) => setState(() => _pay.cardVerificationCode = val),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  decoration: InputDecoration(
                                                      errorStyle: TextStyle(color: Colors.white),
                                                      border: InputBorder.none,
                                                      labelText: 'CVC',
                                                      hintText: 'CVC',
                                                      hintStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              127,
                                                              255,
                                                              255,
                                                              255)),
                                                      labelStyle: TextStyle(
                                                          color: Colors.white),
                                                      filled: true,
                                                      fillColor: Color.fromARGB(
                                                          64, 0, 0, 0)))),
                                        ),
                                      )),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: OutlineButton(
                                          onPressed: () async {
                                            if(_formKey.currentState.validate()) {
                                              var card = _pay.toForm();
                                              var token = await PayService.generateToken(card, 'pk_test_4f6xxU4M7IJpjubbYsfgaJqH', AppConfig.of(context).stripeURL + '/tokens');
                                              if(token['id'] != null) {
                                                var response = await PayService.postCharge(token['id'], AppConfig.of(context).apiBaseURL + '/charge');
                                                print(response);
                                              }
                                            }
                                          },
                                          textColor: Colors.white,
                                          child: Padding(
                                            padding: EdgeInsets.all(16),
                                            child: Text("Submit Purchase"),
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            style: BorderStyle.solid,
                                            width: 0.8,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ))
                        ]))),
                  ]))));
        })
      ]),
    );
  }
}
