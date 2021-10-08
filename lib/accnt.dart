import 'package:flutter/material.dart';
import 'package:videodownloader/accntcard.dart';
 

import './Screen_Size.dart';

class Account extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccountState();
  }
}

class AccountState extends State<Account> {
  var _options2 = ['option 1', 'option 2', 'option 3'];

  var _currentItem;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return Scaffold(
          body:Container(
            margin: EdgeInsets.only(top:100,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget>[

                Padding(
                  padding: const EdgeInsets.only(top:50,bottom: 30,left: 75,right: 75),
                  child: Text("MY ACCOUNT",style: TextStyle(fontSize: 30),),
                ),
                Center(
                                  child: Container(
                                    width:30*SizeConfig.heightMultiplier,
                                    height:30*SizeConfig.heightMultiplier,
                                   
                                    child: CircleAvatar(
                                     
                                      child: ClipOval(
                                        
                                        child :new SizedBox(
                                          height: 33.4*SizeConfig.heightMultiplier,
                                          width:33.4*SizeConfig.heightMultiplier,
                                          child:null,
                            
                                        )

                                      ),
                                      backgroundColor: Colors.blue,
                                    ),
                                  ),
                ),
                               Container(
                                  height:300,
                                  width:420,
                      margin: EdgeInsets.only(
                          top: 3.3 * SizeConfig.heightMultiplier,
                         ),
                      child: GridView.count(
                        childAspectRatio:2,
                        crossAxisCount: 1,
                        children: List.generate(8, (index) {
                          return Center(
                                child: Container(child:AccntCard() ));
                        }),
                      ),
                    ),
                            
              ]
            ),
          ),
        );
      });
    });
  }
}
