import 'package:flutter/material.dart';
import 'package:videodownloader/Screen_Size.dart';
import './card.dart';

class WhatsApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return WhatsAppState();
  }

}

class WhatsAppState extends State<WhatsApp>{
 
  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(builder:(context,constraints){
      return OrientationBuilder(builder: (context,orientation){
        SizeConfig().init(constraints, orientation);
        return Scaffold(
          body:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget>[
             
               Center(child: Text("Click On a Thumbanail",style:TextStyle(fontSize: 35,))),
               SizedBox(height:20),
               Container(
                 width: 110*SizeConfig.widthMultiplier,
                 height: 90.2*SizeConfig.heightMultiplier,
                 child: GridView.count(
                   crossAxisCount: 2,
                   mainAxisSpacing: 6,
                   crossAxisSpacing: 6,
                 children: <Widget>[
                   WatsCard(),
                   WatsCard(),
                   WatsCard(),
                   WatsCard(),
                    WatsCard(), WatsCard(), WatsCard(),
                 ],
                 ),
               ),
              
            ]
          ),
        );
      });
    });
  }

}