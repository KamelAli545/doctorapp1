import 'package:untitled/presentation/widgets/upper_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool toggle1=true;
  bool toggle2=true;
  bool toggle3=true;
  bool toggle4=true;
  bool toggle5=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: UpperBar(title: "Notification"),),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 327,
              height: 400,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Notification from DocNow",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),),
                      SizedBox(width: 80,),
                      IconButton(onPressed: (){
                        setState(() {
                          toggle1= !toggle1;
                        });
                      }, icon: Icon(toggle1?
                      Icons.toggle_off_outlined:
                      Icons.toggle_on,color: Color.fromRGBO(36, 124, 255, 1),size: 45,),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text("Special Offers",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),),
                      SizedBox(width: 165,),
                      IconButton(onPressed: (){
                        setState(() {
                          toggle2= !toggle2;
                        });
                      }, icon: Icon(toggle2?
                      Icons.toggle_off_outlined:
                      Icons.toggle_on,color: Color.fromRGBO(36, 124, 255, 1),size: 45,),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text("Sound",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),),
                      SizedBox(width: 220,),
                      IconButton(onPressed: (){
                        setState(() {
                          toggle3= !toggle3;
                        });
                      }, icon: Icon(toggle3?
                      Icons.toggle_off_outlined:
                      Icons.toggle_on,color: Color.fromRGBO(36, 124, 255, 1),size: 45,),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text("Vibrate",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),),
                      SizedBox(width: 215,),
                      IconButton(onPressed: (){
                        setState(() {
                          toggle4= !toggle4;
                        });
                      }, icon: Icon(toggle4?
                      Icons.toggle_off_outlined:
                      Icons.toggle_on,color: Color.fromRGBO(36, 124, 255, 1),size: 45,),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text("App Updates",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),),
                      SizedBox(width: 175,),
                      IconButton(onPressed: (){
                        setState(() {
                          toggle5= !toggle5;
                        });
                      }, icon: Icon(toggle5?
                      Icons.toggle_off_outlined:
                      Icons.toggle_on,color: Color.fromRGBO(36, 124, 255, 1),size: 45,),
                      ),
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
