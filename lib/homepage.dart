import 'package:flutter/material.dart';
import 'components/skin_detect_app_bar.dart';
import 'components/home_carousel.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({this.title}) : super();

  @override
  Widget build(BuildContext context) {
    final signinButton = Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(16),
            textColor: Colors.white,
            child: Text("I already have an account."),
            onPressed: () => Navigator.pushNamed(context, '/login'),
          ),
        )
      ],
    );

    final signupButton = Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            color: Color.fromARGB(255, 240, 240, 242),
            padding: EdgeInsets.all(16),
            child: Text("I'm a new Skin Detect user."),
            onPressed: () => Navigator.pushNamed(context, '/register'),
          ),
        )
      ],
    );

    return Scaffold(
        appBar: SkinDetectAppBar(),
        body: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: CarouselWithIndicator(
                              height: constraint.maxHeight - 180)),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: <Widget>[
                              signinButton,
                              Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: signupButton)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
