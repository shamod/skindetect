import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skindetect/image_processor.dart';
import 'package:skindetect/payment/pay.dart';
import 'components/skin_detect_app_bar.dart';

class DiagnosePage extends StatelessWidget {
  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final int creditsRemaining = 2;

  @override
  Widget build(BuildContext context) {
    void handlePurchase() async {
      File selected = await ImagePicker.pickImage(source: ImageSource.camera);
      if (selected != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ImageProcessor(selected)));
      }
    }

    return Scaffold(
        appBar: SkinDetectAppBar(hasHistoryBackButton: false),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(top: 16),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        "Account Balance",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        "You have $creditsRemaining credit${creditsRemaining == 1 ? "" : "s"} remaining.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                creditsRemaining == 0 ? _buyCreditButton(context) : Container(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: creditsRemaining > 0
                ? Theme.of(context).primaryColor
                : Colors.grey,
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
            onPressed: creditsRemaining > 0 ? handlePurchase : null));
  }

  _buyCreditButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(4.0),
        color: Theme.of(context).primaryColor,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PayPage()));
          },
          child: Text("Purchase 1 credit",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
