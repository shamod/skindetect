import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:skindetect/authentication/auth.service.dart';
import 'package:skindetect/authentication/user.model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageFormState createState() => LoginPageFormState();
}

class LoginPageFormState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final _formKey = GlobalKey<FormState>();
  final _user = User();

  @override
  void initState() {
    super.initState();
    _user.name = '';
  }

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
                                      Navigator.pushNamed(context, '/'))
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
                                                      return 'Email address required.';
                                                    }
                                                    return null;
                                                  },
                                                  onChanged: (val) => setState(
                                                      () => _user.email = val),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  decoration: InputDecoration(
                                                      errorStyle: TextStyle(color: Colors.white),
                                                      border: InputBorder.none,
                                                      labelText: 'Email',
                                                      hintText: 'Email',
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
                                                  obscureText: true,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Password required.';
                                                    }
                                                    return null;
                                                  },
                                                  onChanged: (val) => setState(
                                                      () =>
                                                          _user.password = val),
                                                  decoration: InputDecoration(
                                                      errorStyle: TextStyle(color: Colors.white),
                                                      border: InputBorder.none,
                                                      labelText: 'Password',
                                                      hintText: 'Password',
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
                                          onPressed: () {
                                            if (_formKey.currentState
                                                .validate()) {
                                              AuthenticationService
                                                      .endpointPost(
                                                          'login', _user)
                                                  .then((res) {
                                                try {
                                                  Map resObj =
                                                      json.decode(res.body);
                                                  if (resObj['status']
                                                          ['type'] ==
                                                      'success') {
                                                    Navigator.pushNamed(
                                                        context, '/diagnose');
                                                  }
                                                } catch (err) {
                                                  print(err);
                                                }
                                              });
                                            }
                                          },
                                          textColor: Colors.white,
                                          child: Padding(
                                            padding: EdgeInsets.all(16),
                                            child: Text("Sign in"),
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
                    Container(
                        height: 64,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 1.0,
                              color: Color.fromARGB(40, 255, 255, 255),
                            ),
                          ),
                          color: Color.fromARGB(40, 255, 255, 255),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: SizedBox.expand(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Need to create an account?',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        )),
                  ]))));
        })
      ]),
    );
  }
}
