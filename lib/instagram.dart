import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_html_parser/insta_html_parser.dart';
import 'package:image_downloader/image_downloader.dart';





void main() {
  runApp(Instagram());
}

class Instagram extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  Instagram({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _InstagramState createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _profileUrlController = TextEditingController();
  TextEditingController _postUrlController = TextEditingController();
  TextStyle _textStyleBold = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
  TextStyle _textStyleUrl = TextStyle(fontSize: 16.0);
  List<Widget> _parsedWidgets = [];
  
  
  


   void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  @override
  void initState() {
    super.initState();
    _profileUrlController.text = 'https://www.instagram.com/contreirasgustavo/';
    _postUrlController.text = 'https://www.instagram.com/p/BQQrPauBgvn/';
  }

  @override
  Widget build(BuildContext context) {

   

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        
       
        body: Center(
          child: ListView(
            children: [
              
             Center(
               child: Text("Enter The Download Link",style: TextStyle(fontSize: 35)),
               ),

            
              Container( // Post url input field
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                child: Form(
                  child: TextFormField(
                    controller: _postUrlController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                       
                      labelStyle: _textStyleUrl,
                      hintText: 'Paste Your Link',
                      hintStyle: TextStyle(color: Colors.grey[500], fontSize: 13)
                    )
                  )
                )
              ),

              Row( // Photos and video submit button 
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Container( // Parse photos
                    width: 160,
                    padding: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 16.0),
                    child: RaisedButton(
                      child: Text('Get photos', style: _textStyleUrl,),
                      onPressed: () async {

                        

                        List<Widget> _widgetsList = [];
                        Map<String, String> photosUrls = await InstaParser.photoUrlsFromPost('${_postUrlController.text}');

                        // Divider
                        _widgetsList.add(
                          Container(padding: EdgeInsets.only(top: 8.0, bottom: 8.0), 
                            child: Divider(height: 0.0, color: Colors.black)
                          )
                        );

                        // Small photo URL 
                        _widgetsList.add(Text('Small photo:', style: _textStyleBold));
                        _widgetsList.add(
                          GestureDetector(
                            child: Text('${photosUrls['small'] != null ? photosUrls['small'] : ''}', style: _textStyleUrl,),
                            onTap: () async {
                              try {
  // Saved with this method.
  var imageId = await ImageDownloader.downloadImage(photosUrls['small']);
  if (imageId == null) {
    return;
  }

  // Below is a method of obtaining saved image information.
 
} on PlatformException catch (error) {
  print(error);
}
                            }
                          )
                        );
                        if (photosUrls['small'] != null) {
                          _widgetsList.add(
                            Image.network(photosUrls['small'])
                          );
                        }

                        // Divider
                        _widgetsList.add(
                          Container(padding: EdgeInsets.only(top: 8.0, bottom: 8.0), 
                            child: Divider(height: 0.0, color: Colors.black)
                          )
                        );

                        // Medium photo URL
                        _widgetsList.add(Text('Medium photo:', style: _textStyleBold));
                        _widgetsList.add(
                          GestureDetector(
                            child: Text('${photosUrls['medium'] != null ? photosUrls['medium'] : ''}', style: _textStyleUrl,),
                            onTap: () async {
                              try {
  // Saved with this method.
  var imageId = await ImageDownloader.downloadImage(photosUrls['medium']);
  if (imageId == null) {
    return;
  }

  // Below is a method of obtaining saved image information.
 
} on PlatformException catch (error) {
  print(error);
}
                            }
                          )
                        );
                        if (photosUrls['medium'] != null) {
                          _widgetsList.add(
                            Image.network(photosUrls['medium'])
                          );
                        }

                        // Divider
                        _widgetsList.add(
                          Container(padding: EdgeInsets.only(top: 8.0, bottom: 8.0), 
                            child: Divider(height: 0.0, color: Colors.black)
                          )
                        );

                        // Large photo URL
                        _widgetsList.add(Text('Large photo:', style: _textStyleBold));
                        _widgetsList.add(
                          GestureDetector(
                            child: Text('${photosUrls['large'] != null ? photosUrls['large'] : ''}', style: _textStyleUrl,),
                            onTap: () async {
                              try {
  // Saved with this method.
  var imageId = await ImageDownloader.downloadImage(photosUrls['large']);
  if (imageId == null) {
    return;
  }

  // Below is a method of obtaining saved image information.
 
} on PlatformException catch (error) {
  print(error);
}
                            }
                          )
                        );
                        if (photosUrls['large'] != null) {
                          _widgetsList.add(
                            Image.network(photosUrls['large'])
                          );
                        }

                        setState(() => _parsedWidgets = _widgetsList);                   
                      },
                    ),
                  ),

                  Container( // Parse video
                    width: 128,
                    padding: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 16.0),
                    child: RaisedButton(
                      child: Text('Get video', style: _textStyleUrl,),
                      onPressed: () async {
                        List<Widget> _widgetsList = [];
                        String _videoUrl = await InstaParser.videoUrlFromPost('${_postUrlController.text}');
                        print("video");

                        // Divider
                        _widgetsList.add(
                          Container(padding: EdgeInsets.only(top: 8.0, bottom: 8.0), 
                            child: Divider(height: 0.0, color: Colors.black)
                          )
                        );

                        // Video URL
                        _widgetsList.add(Text('Video:', style: _textStyleBold));
                        _widgetsList.add(
                          GestureDetector(
                            child: Text('$_videoUrl\n', style: _textStyleUrl,),
                            onTap: () async {
                              setState(() {});
                              Clipboard.setData(ClipboardData(text: '$_videoUrl'));
                              _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Copied video url")));
                            }
                          )
                        );

                        setState(() => _parsedWidgets = _widgetsList);                           
                      },
                    ),
                  ),
                ],
              ),          

              Column(children: _parsedWidgets),
            ]
          ),
        ) ,
      )
    );
  }

}