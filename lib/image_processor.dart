import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'components/skin_detect_app_bar.dart';

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
  var result = [];

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
      appBar: SkinDetectAppBar(),
      body: ListView(
        children: <Widget>[
          if (this._imageFile != null) ...[
            Stack(
              children: <Widget>[
                Image.file(
                  this._imageFile,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height - 88,
                ),
                result.length > 0
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black.withAlpha(225),
                        child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Your results:",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${result[0]} ${result[1]}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                ),
                              ],
                            )),
                      )
                    : Container(),
                Container(
                  height: MediaQuery.of(context).size.height - 88,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: MaterialButton(
                              height: 64,
                              color: Theme.of(context).primaryColor,
                              minWidth: MediaQuery.of(context).size.width,
                              onPressed: _upload,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Perform Classification",
                                    textAlign: TextAlign.center,
                                    style: style.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      Icons.cloud_upload,
                                      size: 24.0,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
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
    Map responseObj = json.decode(responseString);
    var topResult = responseObj['probs'][0];
    setState(() {
      result = topResult;
    });
  }
}
