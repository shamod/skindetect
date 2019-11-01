import 'package:flutter/material.dart';
import 'package:skindetect/diagnose.dart';
import 'package:skindetect/homepage.dart';
import 'package:skindetect/login.dart';
import 'package:skindetect/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Skin Detect',
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/diagnose': (context) => DiagnosePage(),
        },
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 255, 0, 59),
        ));
  }
}
