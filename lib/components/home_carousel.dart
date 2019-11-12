import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<Map> slides = [
  {
    'image': 'assets/images/slide_01.jpg',
    'headline': 'Powered by AI',
    'subheading': 'Skin disease detection'
  },
  {
    'image': 'assets/images/slide_02.jpg',
    'headline': 'Advanced detection',
    'subheading': '10+ skin disease classifications'
  },
  {
    'image': 'assets/images/slide_03.jpg',
    'headline': 'Easy to use',
    'subheading': "Using your phone's camera."
  }
];

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

List<Widget> Function(double height) createChildren = (double height) {
  return map<Widget>(
    slides,
    (index, slide) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(children: <Widget>[
            Image.asset(slide['image'], fit: BoxFit.cover, height: height),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        slide['headline'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        slide['subheading'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  )),
            ),
          ]),
        ),
      );
    },
  ).toList();
};

class CarouselWithIndicator extends StatefulWidget {
  final double height;

  CarouselWithIndicator({Key key, @required this.height}) : super(key: key);

  @override
  _CarouselWithIndicatorState createState() =>
      _CarouselWithIndicatorState(height);
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  double height;
  int _current = 0;

  _CarouselWithIndicatorState(this.height);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: createChildren(height),
        height: height,
        autoPlay: false,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(
          slides,
          (index, url) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4)),
            );
          },
        ),
      ),
    ]);
  }
}
