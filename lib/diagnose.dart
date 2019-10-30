
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:skindetect/image_processor.dart';

class DiagnosePage extends StatelessWidget {

  File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Diagnose'),
        ),
        body: Stack(
          children: <Widget>[],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.camera_alt,
            color: Colors.white,
          ),
          onPressed: ()  async {
            File selected = await ImagePicker.pickImage(source: ImageSource.camera);
            if (selected != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageProcessor(selected)));
            }
          }
        ),
    );
  }

}