

import 'package:flutter/material.dart';
import 'package:videodownloader/Screen_Size.dart';
import 'dart:async';
import 'dart:io';


import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

class Facebook extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return FacebookState();
  }

}

class FacebookState extends State<Facebook>{
  String _message = "";
  String _path = "";
  String _size = "";
  String _mimeType = "";
  File _imageFile;
  int _progress = 0;
  
  final myController =TextEditingController();

  @override
  void dispose() {
    
    myController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
  
    return LayoutBuilder(builder:(context,constraints){
      return OrientationBuilder(builder: (context,orientation){
        SizeConfig().init(constraints, orientation);
        return Scaffold(
          body:Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
                          child: Column(
                children:<Widget>[
                  Text("Enter the Download Link",style:TextStyle(fontSize: 35,)),
                  SizedBox(height: 30,),
                  TextField(
                    controller: myController,
                    decoration: InputDecoration(hintText: "paste your link"),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 50,
                    child:RaisedButton(
                      onPressed:(){
                         _downloadImage(
                           myController.text,
                      destination: AndroidDestinationType.directoryPictures
                        ..inExternalFilesDir()
                        ..subDirectory("sample.jpg"),
                         );
                      },
                      child:Center(
                        child:Text("Fetch Details",style:TextStyle(fontSize: 20,color: Colors.white),)
                      ),
                      color: Colors.brown,
                    )
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                    child:Image.network(myController.text == null?null:myController.text),
                  )
                 
                ]
              ),
            ),
          ),
        );
      });
    });
    
  }
   Future<void> _downloadImage(String url, {AndroidDestinationType destination, bool whenError = false}) async {
    String fileName;
    String path;
    int size;
    String mimeType;
    try {
      String imageId;

      if (whenError) {
        imageId = await ImageDownloader.downloadImage(url).catchError((error) {
          if (error is PlatformException) {
            var path = "";
            if (error.code == "404") {
              print("Not Found Error.");
            } else if (error.code == "unsupported_file") {
              print("UnSupported FIle Error.");
              path = error.details["unsupported_file_path"];
            }
            setState(() {
              _message = error.toString();
              _path = path;
            });
          }

          print(error);
        }).timeout(Duration(seconds: 10), onTimeout: () {
          print("timeout");
        });
      } else {
        if (destination == null) {
          imageId = await ImageDownloader.downloadImage(url);
        } else {
          imageId = await ImageDownloader.downloadImage(
            url,
            destination: destination,
          );
        }
      }

      if (imageId == null) {
        return;
      }
      fileName = await ImageDownloader.findName(imageId);
      path = await ImageDownloader.findPath(imageId);
      size = await ImageDownloader.findByteSize(imageId);
      mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      setState(() {
        _message = error.message;
      });
      return;
    }

    if (!mounted) return;

    setState(() {
      var location = Platform.isAndroid ? "Directory" : "Photo Library";
      _message = 'Saved as "$fileName" in $location.\n';
      _size = 'size:     $size';
      _mimeType = 'mimeType: $mimeType';
      _path = path;

      if (!_mimeType.contains("video")) {
        _imageFile = File(path);
      }
    });
  }
  

}

 