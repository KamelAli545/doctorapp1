import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewsWidget extends StatefulWidget {
  String name;
  String description;
  String imagePath;


   ReviewsWidget({super.key,
   required this.name,
     required this.description,
     required this.imagePath,
   });

  @override
  State<ReviewsWidget> createState() => _ReviewsWidgetState();
}

class _ReviewsWidgetState extends State<ReviewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0,vertical: 25),
      child: SizedBox(
        width: 327,
        height: 144,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Image.asset(widget.imagePath,
                  width:40 ,
                  height: 40,),
                ),
                SizedBox(width: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(widget.name,style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),),
                        Row(
                          children: [
                            Icon(Icons.star,color: Color.fromRGBO(255, 214, 0, 1),),
                            Icon(Icons.star,color: Color.fromRGBO(255, 214, 0, 1),),
                            Icon(Icons.star,color: Color.fromRGBO(255, 214, 0, 1),),
                            Icon(Icons.star,color: Color.fromRGBO(255, 214, 0, 1),),
                            Icon(Icons.star,color: Color.fromRGBO(255, 214, 0, 1),),

                          ],
                        ),

                      ],
                    ),
                    SizedBox(width: 120,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text("Today",
                      style: TextStyle(fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color.fromRGBO(158, 158, 158, 1)),),
                    )
                  ],
                )
              ],
            ),
            Text(widget.description,
            style: TextStyle(color: Color.fromRGBO(117, 117 , 117, 1),
            fontSize: 12,
            fontWeight: FontWeight.w400)
              ,)
          ],
        ),
      ),
    );
  }
}
