import 'package:flutter/material.dart';
import 'package:videodownloader/Screen_Size.dart';

class Instagram extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return InstagramState();
  }

}

class InstagramState extends State<Instagram>{
  final _listoptions=[
    'image',
    'Video'
  ];
  var _currentItem = "image";
 
  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(builder:(context,constraints){
      return OrientationBuilder(builder: (context,orientation){
        SizeConfig().init(constraints, orientation);
        return Scaffold(
          body:Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children:<Widget>[
                Text("Enter the Download Link",style:TextStyle(fontSize: 35,)),
                SizedBox(height: 30,),
                TextField(
                  decoration: InputDecoration(hintText: "paste your link"),
                ),
                SizedBox(height: 30,),
                Row(
                  
                  children:<Widget>[
                  Text("Download Type",style:TextStyle(fontSize: 18),),
                  SizedBox(width:150),
                   Container(
                     width: 100,
                     child: new DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                             
                              
                                // isExpanded: true,
                                 // value:selected,
                                  
                                  items: _listoptions.map((String dropDownStringItem){
                                    return DropdownMenuItem(
                                      
                                       value: dropDownStringItem,
                                        child:Row(
                  children: <Widget>[
                     
                      Text(dropDownStringItem),
                  ],
                ),
                                    );
                                  }).toList(),
                                  
                                 
                                  
                                  
                                
                                  onChanged: (String newValueSelected){
                                    setState(() {
                                      this._currentItem =newValueSelected;
                                    });
                              },
                                 value:_currentItem
                                
                                
                            
                                ),
                           ),
                   )  
                  ]
                ),
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
        );
      });
    });
  }

}