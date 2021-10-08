

import 'package:flutter/material.dart';
import 'package:videodownloader/Screen_Size.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:typed_data';
import 'package:dio/dio.dart';



  




class Facebook extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return FacebookState();
  }

}

class FacebookState extends State<Facebook>{
  
 
  
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
                    onChanged: (text){
                      
                    },
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 50,
                    child:RaisedButton(
                      onPressed:() async {
    var response = await Dio().get(myController.text, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
  },
                      child:Center(
                        child:Text("Fetch Details",style:TextStyle(fontSize: 20,color: Colors.white),)
                      ),
                      color: Colors.brown,
                    )
                  ),
                  Container(
                    height: 400,
                    width: 400,
                    //color: Colors.red, 
                    child:Image.network("https://www.facebook.com/100001018353839/posts/2920864241290826/")                 
                    )
                 
                ]
              ),
            ),
          ),
        );
      });
    });
    
  }
  
   

}



 