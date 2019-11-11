import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skindetect/image_processor.dart';
import 'package:skindetect/payment/pay.dart';
import 'components/skin_detect_app_bar.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:skindetect/payment/pay.model.dart';

class DiagnosePage extends StatelessWidget {
  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkinDetectAppBar(hasHistoryBackButton: false),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: _buyCreditButton(context),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.camera_alt,
            color: Colors.white,
          ),
          onPressed: () async {
            File selected =
                await ImagePicker.pickImage(source: ImageSource.camera);
            if (selected != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageProcessor(selected)));
            }
          }),
    );
  }

  _buyCreditButton(BuildContext context) {
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PayPage()));
          },
          child: Text("Make Payment",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
