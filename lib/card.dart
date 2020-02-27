import 'package:flutter/material.dart';
import 'package:videodownloader/Screen_Size.dart';

class WatsCard extends StatelessWidget{
  String imagename;
  WatsCard({this.imagename});
  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(builder:(context,constraints){
      return OrientationBuilder(builder: (context,orientation){
        SizeConfig().init(constraints, orientation);
        return Container(
          height: 44.5*SizeConfig.heightMultiplier,
          width: 12.5*SizeConfig.widthMultiplier,
          child: Card(
            color: Colors.black,
           // child:Image(image: AssetImage(imagename),)
          ),
        );
      });
    });
  }

}