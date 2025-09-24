import 'package:untitled/presentation/screens/fill_profile_screen.dart';
import 'package:untitled/presentation/widgets/text_form_filled_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  TextEditingController phonecontroller= TextEditingController();
  TextEditingController emailcontroller= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38.0),
              child: Text("Forgot Password",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color.fromRGBO(36, 124, 255, 1),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38.0),
              child: Text("At our app, we take the security of your information seriously.",
                style:  TextStyle(
                    color: Color.fromRGBO(117, 117, 117 , 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(height: 35,),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child:  TextFormFilledWidget(
                    controller: emailcontroller,
                    hintTxt: 'Email or Phone Number',
                    keyType: TextInputType.emailAddress),
                  ),

                SizedBox(height: 500,),
                InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FillProfileScreen()));
                  },
                  child: Container(width: 350,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(36, 124, 255, 1),
                    ),
                    child: Center(
                      child: Text("Reset Password",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                    ),
                  ),
                ),
                SizedBox(height: 50,),

  ]
            ),
    ]
        ),
    ),
    );
  }
}
