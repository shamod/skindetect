import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkinDetectAppBar extends StatelessWidget with PreferredSizeWidget {
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
        height: 104.0,
        child: Stack(
          children: <Widget>[
            Navigator.canPop(context)
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
                  height: 72,
                  semanticsLabel: 'SkinDetect Logo'),
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(140.0);
}
