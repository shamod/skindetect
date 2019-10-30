
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageProcessor extends StatefulWidget {
  final File _imageFile;
  ImageProcessor(this._imageFile);

  @override
  _ImageProcessorState createState() => _ImageProcessorState();
}

class _ImageProcessorState extends State<ImageProcessor> {
  File _imageFile;

  void initState() {
    super.initState();
    setState(() {
      this._imageFile = widget._imageFile;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Processor'),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: <Widget>[
          if (this._imageFile != null) ...[
            Image.file(this._imageFile),
            Row(
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.cloud_upload),
                ),
                FlatButton(
                  child: Icon(Icons.crop),
                  onPressed: null,
                ),
                FlatButton(
                  child: Icon(Icons.refresh),
                  onPressed: null,
                ),
              ],
            )
          ]
        ],
      )
    );
  }
}