import 'package:untitled/presentation/screens/home_screen.dart';
import 'package:untitled/presentation/screens/message_screen.dart';
import 'package:untitled/presentation/screens/my_appointment_screen.dart';
import 'package:untitled/presentation/screens/profile_screen.dart';
import 'package:untitled/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}
class _HomeWidgetState extends State<HomeWidget> {
int selectedindex=-1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Home Icon
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              setState(() {
selectedindex=0;
              });
            },
            icon: Icon(
              selectedindex==0
                  ? Icons.home_filled : Icons.home_outlined,
              color:  selectedindex==0
                  ?  Color.fromRGBO(36, 124, 255, 1):Colors.black,
              size: 28,
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MessageScreen()));
                  setState(() {
                   selectedindex=1;
                  });
                },
                icon: Icon(
                   selectedindex==1 ? Icons.message: Icons.message_outlined,
                    color: selectedindex==1 ?   Colors.black:Color.fromRGBO(36, 124, 255, 1),
                    size: 28, ),),
              Positioned(
                right: 8,
                top: 12,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
            ],
          ),
          FloatingActionButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
          },
            backgroundColor: Color.fromRGBO(36, 124, 255, 1),
            child: Icon(Icons.search,color: Colors.white,),
          ),
    IconButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyAppointmentScreen()));
                setState(() {
selectedindex=2;
                });
            },icon: Icon(
              selectedindex==2 ? Icons.calendar_month : Icons.calendar_month_outlined,
               color: selectedindex==2 ? Color.fromRGBO(36, 124, 255, 1) : Colors.black,
               size: 28, ),
            ),
          InkWell(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
            },
            child: CircleAvatar(
              radius: 16,
              backgroundImage:
              AssetImage('assets/images/WhatsApp Image 2025-07-04 at 18.21.05_3fbb69ff.jpg'), // Replace with your asset
            ),
          ),
        ],
      ),
    );
  }
}
