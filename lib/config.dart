import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {

  final String apiBaseURL;
  final String stripeURL;

  AppConfig({
    @required this.apiBaseURL,
    @required this.stripeURL,
    @required Widget child,
  }) : super(child: child);

  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

}