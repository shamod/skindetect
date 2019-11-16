import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
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
  bool _busy = false;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  void initState() {
    super.initState();
    _busy = true;

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
              onPressed: _upload,
              child: Text(
                "Perform Classification",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ],
      ),
    );
  }

  _upload() async {
    if (_imageFile == null) return null;
    const String serverBaseUrl = 'http://192.168.0.140:5000';
    final url = '$serverBaseUrl/upload';
    const Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };

    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest("POST", Uri.parse(url));

    //create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath("file_field", _imageFile.path);

    //add multipart to request
    request.files.add(pic);
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
  }
}
