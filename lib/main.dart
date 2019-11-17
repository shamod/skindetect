import 'package:flutter/material.dart';
import 'package:skindetect/config.dart';
import 'package:skindetect/diagnosis/diagnose.dart';
import 'package:skindetect/homepage.dart';
import 'package:skindetect/authentication/login.dart';
import 'package:skindetect/authentication/register.dart';

void main() {
  var configuredApp = new AppConfig(
      apiBaseURL: 'http://10.0.0.198:5000',
      stripeURL: 'https://api.stripe.com/v1',
      child: MyApp(),
  );

  runApp(configuredApp);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
        )
      );
  }
}
