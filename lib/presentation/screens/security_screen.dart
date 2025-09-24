import 'package:untitled/presentation/widgets/upper_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool toggle1=false;
  bool toggle2=false;
  bool toggle3=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:           UpperBar(title: "Security"),),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 327,
              height: 300,
              child:
              Column(
                children: [
                  Row(
                    children: [
                      Text("Remember password",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),),
                      SizedBox(width: 115,),
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
                      Text("Face ID",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),),
                      SizedBox(width: 212,),
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
                      Text("PIN",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),),
                      SizedBox(width: 239,),
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
                      Text("Google Authenticator",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),),
                      SizedBox(width: 128,),
                      IconButton(
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SecurityScreen()));
                          },
                          icon: Icon(Icons.arrow_forward_ios))
                    ],
                  ),


                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
