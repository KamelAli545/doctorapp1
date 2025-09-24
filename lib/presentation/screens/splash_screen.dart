import 'package:untitled/presentation/screens/on_boarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OnBoarding()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      body: Stack(
        children: [
          Center(
            child: Image.asset("assets/images/Group@3x.png",
              fit: BoxFit.contain,),
          ),
          Center(
            child: Image.asset("assets/images/doctor.png").animate().flipV(duration: 2.seconds)
        ),
    ],
      )
    );







  }
}
