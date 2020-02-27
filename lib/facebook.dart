import 'package:flutter/material.dart';
import 'package:videodownloader/Screen_Size.dart';

class Facebook extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return FacebookState();
  }

}

class FacebookState extends State<Facebook>{
 
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
                    decoration: InputDecoration(hintText: "paste your link"),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 50,
                    child:RaisedButton(
                      onPressed:(){},
                      child:Center(
                        child:Text("Fetch Details",style:TextStyle(fontSize: 20,color: Colors.white),)
                      ),
                      color: Colors.brown,
                    )
                  ),
                ]
              ),
            ),
          ),
        );
      });
    });
  }

}