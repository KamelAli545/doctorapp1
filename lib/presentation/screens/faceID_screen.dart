import 'package:untitled/logic/faceID/cubit.dart';
import 'package:untitled/logic/faceID/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/presentation/screens/login_screen.dart';

class FaceidScreen extends StatefulWidget {
  const FaceidScreen({super.key});

  @override
  State<FaceidScreen> createState() => _FaceidScreenState();
}

class _FaceidScreenState extends State<FaceidScreen> {
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   // create: (context)=>FaceCubit(),
    //   // child:BlocConsumer<FaceCubit,FaceID>
    //   //   (listener: (context,state){
    //   //     if(state is FaceSuccessState){
    //   //       ScaffoldMessenger.of(context,).showSnackBar(
    //   //           SnackBar(
    //   //           content: Text("Face ID enabled!")));
    //   //     }else if (state is FaceErrorState){
    //   //       ScaffoldMessenger.of(context,).showSnackBar(SnackBar(content: Text(state.em)));
    //   //       SnackBar (
    //   //         content: Text(state.em),
    //   //         duration: (Duration(seconds: 3)),
    //   //       );
    //   //
    //   //     }
    //   // },
    //   //   builder: (context,state){
           return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38.0),
              child: Text(
                "Face ID",
                  style: TextStyle(
                    color: Color.fromRGBO(36, 124, 255, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
              ),
            ),
          SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38.0),
              child: Text(
            "Add a Face ID to make your account more secure and easy to sign in.",
            style: TextStyle(
              color: Color.fromRGBO(117, 117, 117 , 1),
              fontSize: 15,
            ),
            ),
          ),
          SizedBox(height: 60),
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
              color: Color(0xFFF5F8FF),
              shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                Icons.tag_faces_outlined,
                color: Color(0xFF247CFF),
                size: 80,
                ),
              ),
            ),
          ),
          const Spacer(),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
              child: Container(width: 350,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(36, 124, 255, 1),
                ),
                child: Center(
                  child: Text("Submit",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],),
          ),
            ),
           );

  }
}
