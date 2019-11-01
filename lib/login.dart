import 'package:flutter/material.dart';
import 'components/skin_detect_app_bar.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageFormState createState() => LoginPageFormState();
}

class LoginPageFormState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkinDetectAppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            emailField,
            passwordField,
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  final emailField = Padding(
    padding: const EdgeInsets.all(16.0),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    ),
  );

  final passwordField = Padding(
    padding: const EdgeInsets.all(16.0),
    child: TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    ),
  );

  _loginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Processing Data'),
              ));
            }
          },
          child: Text("Login",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
