import 'package:untitled/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Column(
          children: [
          Padding(
            padding: const EdgeInsets.only(top: 45.0),
            child: Image.asset("assets/images/doctor.png",
            height: 38,),
          ),
        SizedBox(height: 10,),
        Stack(
          children: [
          Image.asset("assets/images/Group@3x.png",
          fit: BoxFit.contain,),
            Image.asset("assets/images/doctor2.png")

],
    ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Text("Best Doctor\nAppointment App ",
                     textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(36, 124, 255, 1),
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),),
                  ),
                  Text("Manage and schedule all of your medical appointments easily ",
                    style: TextStyle(fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: Color.fromRGBO(117, 117, 117, 1),
                    ),
                  ),
                  Text("with Docdoc to get a new experience.",
                    style: TextStyle(fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: Color.fromRGBO(117, 117, 117, 1),
                    ),),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                    child: Container(width: 311,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color.fromRGBO(36, 124, 255, 1),
                      ),
                      child: Center(
                        child: Text("Get Started",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                      ),
                    ),
                  ),
                ],
              ),
            )
],


      )
        );

  }
}
