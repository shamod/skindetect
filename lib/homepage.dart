
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final String title;

  HomePage({this.title}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            children: <Widget>[
              mainContainer,
              loginContainer(context),
              registerContainer(context),
              diagnoseContainer(context),
            ]
        ),
      ),
    );
  }

  var mainContainer = Container(
    child: Padding(
      padding: EdgeInsets.only(top: 25.0),
      child: Text(
        'Skin Cure',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 32,
          color: Colors.black87,
        ),
      ),
    ),
  );

  Container loginContainer(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text('Login'),
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
      ),
    );
  }

  Container registerContainer(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text('Register'),
        onPressed: () {
          Navigator.pushNamed(context, '/register');
        },
      ),
    );
  }

  Container diagnoseContainer(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text('Diagnose'),
        onPressed: () {
          Navigator.pushNamed(context, '/diagnose');
        },
      ),
    );
  }
}