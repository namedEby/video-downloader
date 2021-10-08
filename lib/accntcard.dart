import 'package:flutter/material.dart';

class AccntCard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AccntCardState();
  }

}

class AccntCardState extends State<AccntCard>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 180,
      
      child:Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
                      child: Row(
              children:<Widget>[
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 30,
                ),
                SizedBox(width:30,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Text("Name"),
                    ),
                  StatefulStarRating(),
                  Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Text("Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut l\nabore et dolore magna aliqua. Ut enim ad m"),
                    ),

                  ],
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }

}

class StarRating extends StatelessWidget {
   final void Function(int index) onChanged;
  final int value;
  final IconData filledStar;
  final IconData unfilledStar;
  const StarRating({
    Key key,
    this.value = 0,
    this.filledStar,
    this.unfilledStar,
    this.onChanged
  })  : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = Colors.amber;
    final size =25.0;
    return Row(
     
      children: List.generate(5, (index) {
        return IconButton(
          onPressed:  onChanged != null?() {
            onChanged(value == index + 1 ? index : index + 1);
 
          }:null,
          color: index < value ? color : null,
          iconSize: size,
          icon: Icon(
            index < value 
               ? filledStar ?? Icons.star 
               : unfilledStar ?? Icons.star_border,
          ),
         
          tooltip: "${index + 1} of 5",
        );
      }),
    );
  }
}


class StatefulStarRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int rating = 0;
    return StatefulBuilder(
      builder: (context, setState) {
        return StarRating(
          onChanged: (index) {
            setState(() {
              rating = index;
            });
          },
          value: rating,
        );
      },
    );
  }
}