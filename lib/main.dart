import 'package:flutter/material.dart';
import 'package:videodownloader/Screen_Size.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
  

import './facebook.dart';
import './instagram.dart';
import './whatsapp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
  
}

class MyHomePageState extends State<MyHomePage>{
   int _selectedPage =0;
  final _page =[
   Facebook(),
   Instagram(),
   WhatsApp()
    
  ];
  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(builder:(context,constraints){
      return OrientationBuilder(builder: (context,orientation){
        SizeConfig().init(constraints, orientation);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Video DownLoader",style:TextStyle(fontSize: 25,color: Colors.white)),
                Icon(Icons.account_circle,size: 40,)
              ],
            ),

          ),
           body:_page[_selectedPage],
          bottomNavigationBar: FancyBottomNavigation(
            textColor: Colors.white,
            circleColor: Colors.black,
            inactiveIconColor: Colors.white,
            barBackgroundColor: Colors.black,
            onTabChangedListener: (int index){
              setState(() {
                _selectedPage =index;
              });
            },
            
            tabs: [
              TabData(
                 iconData:FontAwesomeIcons.facebookF,
                title:"Facebook"),
              TabData(
                 iconData:Icons.account_circle,
                title:"Facebook"),
               TabData(
                 iconData:Icons.account_circle,
                title:"Facebook"),
          ]),
        );
      });
    });
  }

}

