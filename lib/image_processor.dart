import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:tflite/tflite.dart';

class ImageProcessor extends StatefulWidget {


  final File _imageFile;


  ImageProcessor(this._imageFile);

  @override
  _ImageProcessorState createState() => _ImageProcessorState();
}

class _ImageProcessorState extends State<ImageProcessor> {
  File _imageFile;
  bool _busy = false;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  void initState() {
    super.initState();
    _busy = true;

    setState(() {
      this._imageFile = widget._imageFile;
    });

    _loadModel().then((val) {
      setState(() {
        _busy = false;
      });
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
                  child: Icon(Icons.crop),
                  onPressed: null,
                ),
                FlatButton(
                  child: Icon(Icons.refresh),
                  onPressed: null,
                ),
              ],
            ),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              onPressed: _predictImage,
              child: Text(
                "Diagnose",
                textAlign: TextAlign.center,
                style: style.copyWith(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ],
      ),
    );
  }

  _loadModel() async {
    Tflite.close();

    try {
      String res = await Tflite.loadModel(
                            model: "assets/model/skinmodel.tflite",
                          );
      print(res);
    } on PlatformException catch(e) {
      print(e);
    }
  }

  _predictImage() async {
    if (_imageFile != null) {
      var recognitions = await Tflite.runModelOnImage(
          path: _imageFile.path,
      );
      print(recognitions);
    }
  }
}
