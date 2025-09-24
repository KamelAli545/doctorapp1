import 'package:untitled/presentation/screens/setting_screen.dart';
import 'package:untitled/presentation/widgets/home_widget.dart';
import 'package:untitled/presentation/widgets/upper_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(36, 124, 255, 1),
        title: UpperBar(
          title: "Profile",
          trailing: InkWell(onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SettingScreen()));
      },
          child: Icon(Icons.settings)),),),
      backgroundColor: Color.fromRGBO(36, 124, 255, 1),
      body:  Column(
          children: [
            SizedBox(height: 66,),
                  Container(
                  width: 416,
                  height: 609,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24)),
                    color: Colors.white
                  ),
                   child:Column(
                     children: [
                       Stack(
                         children:[
                           Padding(
                             padding: const EdgeInsets.only(left: 15.0),
                             child: CircleAvatar(
                               radius: 60,
                               backgroundColor: Colors.white,
                               child: CircleAvatar(
                                 radius: 54,
                                 backgroundImage: AssetImage("assets/images/Randy.png"),
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 100.0,top: 90),
                             child: Container(
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   shape: BoxShape.circle,
                                   border:Border.all(color: Colors.white,width: 2)
                                 ),
                                 child: Icon(Icons.edit_outlined,color: Color.fromRGBO(36, 124, 255, 1),size: 18,),
                               ),
                           ),
                         ]
                       ),
                       SizedBox(height: 15,),
                       Center(
                           child: Text("Omar Ahmed",
                             style: TextStyle(
                                 fontWeight: FontWeight.w600,
                                 fontSize: 20
                             ),),

                       ),
                       SizedBox(height: 10,),
                    Center(
                           child: Text("omarahmed14@gmail.com",
                             style: TextStyle(
                                 color: Color.fromRGBO(158, 158, 158, 1),
                                 fontWeight: FontWeight.w400,
                                 fontSize: 14
                             ),),
                         ),
                       SizedBox(height: 20,),
                       Container(
                         height: 59,
                         width: 327,
                         decoration: BoxDecoration(
                           color: Color.fromRGBO(248, 248, 248, 1),
                             borderRadius: BorderRadius.circular(16)
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                              Text("My Appointment",
                               style: TextStyle(
                                   fontWeight: FontWeight.w400,
                                   fontSize: 12
                               ),),

                              VerticalDivider(width: 3,) ,
                                Text("Medical records",
                                 style: TextStyle(
                                     fontWeight: FontWeight.w400,
                                     fontSize: 12
                                 ),),
                           ],
                         ),
                       ),
                       SizedBox(height: 30,),
                      SizedBox(height: 200,
                      width: 327,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color.fromRGBO(234, 242, 255, 1),
                               child: Icon(Icons.person,color: Color.fromRGBO(36, 124, 255, 1),),
                              ),
                              SizedBox(width: 20,),
                              Text("Personal Information",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                              ),),
                            ],
                          ),
                          Divider(thickness: 0.25,
                            color: Color.fromRGBO(158, 158, 158, 1),),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color.fromRGBO(233, 250, 239, 1),
                                child: Icon(Icons.list_alt_sharp,color: Color.fromRGBO(34, 197, 94, 1),),
                              ),
                              SizedBox(width: 20,),
                              Text("My Test & Diagnostic",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
                                ),),
                            ],
                          ),
                          Divider(thickness: 0.25,
                            color: Color.fromRGBO(158, 158, 158, 1),),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color.fromRGBO(255, 238, 239, 1),
                                child: Icon(Icons.payment,color: Color.fromRGBO(255, 76, 94, 1),),
                              ),
                              SizedBox(width: 20,),
                              Text("Payment",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
                                ),),
                            ],
                          ),

                          Divider(thickness: 0.25,
                            color: Color.fromRGBO(158, 158, 158, 1),)

                        ],
                      ),),

                     ],
                   ),
                 ),
          ]
            ),
      bottomNavigationBar: HomeWidget(),
      );
  }
}
