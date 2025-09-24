import 'package:untitled/presentation/screens/faceID_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController otpController = TextEditingController();

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
                child: Text("OTP Verification",
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
                child: Text("Add a PIN number to make your account more secure and easy to sign in.",
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
                      child:  PinCodeTextField(
                        appContext: context,
                          length: 4,
                          controller: otpController,
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape:  PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(16),
                          fieldHeight: 64,
                          fieldWidth: 64,
                          activeFillColor: Colors.grey,
                          selectedFillColor: Colors.grey,
                          inactiveColor: Colors.grey,
                          inactiveFillColor: Colors.white,
                          activeColor: Colors.transparent,
                          selectedColor: Colors.transparent,
                          borderWidth: 1,
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        enableActiveFill: true,
                        onChanged: (value){
                        },
                    ),
                    ),
                    SizedBox(height: 470,),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FaceidScreen()));
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
                    SizedBox(height: 50,),

                  ]
              ),
            ]
        ),
      ),
    );
  }
}
