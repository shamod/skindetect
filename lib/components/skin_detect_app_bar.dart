import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkinDetectAppBar extends StatelessWidget with PreferredSizeWidget {
  final double _height = 120.0;
  final bool hasHistoryBackButton;

  SkinDetectAppBar({this.hasHistoryBackButton = true}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
                center: Alignment.topRight,
                radius: 5.0,
                colors: [
              Color.fromARGB(255, 235, 131, 100),
              Color.fromARGB(255, 216, 0, 170)
            ])),
        height: _height - 32,
        child: Stack(
          children: <Widget>[
            (Navigator.canPop(context) && hasHistoryBackButton)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.navigate_before),
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  )
                : Container(),
            Center(
              child: SvgPicture.asset('assets/images/logo.svg',
                  color: Colors.white,
                  height: _height / 2,
                  semanticsLabel: 'SkinDetect Logo'),
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(_height);
}
