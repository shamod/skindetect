
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class DiagnosePage extends StatelessWidget {

  File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Diagnose'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              uploadTitleContainer,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: _choose,
                    child: Text('Choose Image'),
                  ),
                  SizedBox(width: 10.0),
                  RaisedButton(
                    onPressed: _upload,
                    child: Text('Upload Image'),
                  )
                ],
              ),
              file == null
                  ? Text('No Image Selected')
                  : Image.file(file)
            ],
          ),
        )
    );
  }

  var uploadTitleContainer = Container(
    child: Padding(
      padding: EdgeInsets.all(25.0),
      child: Text(
          'Upload your skin image below'
      ),
    ),
  );

  void _choose() async {
    file = await ImagePicker.pickImage(source: ImageSource.camera);
// file = await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  void _upload() {
    if (file == null) return;
    String base64Image = base64Encode(file.readAsBytesSync());
    String fileName = file.path.split("/").last;

    http.post('URL', body: {
      "image": base64Image,
      "name": fileName,
    }).then((res) {
      print(res.statusCode);
    }).catchError((err) {
      print(err);
    });
  }
}