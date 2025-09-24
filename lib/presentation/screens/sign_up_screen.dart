import 'package:untitled/logic/sign_up/cubit.dart';
import 'package:untitled/logic/sign_up/state.dart';
import 'package:untitled/presentation/screens/fill_profile_screen.dart';
import 'package:untitled/presentation/screens/forget_screen.dart';
import 'package:untitled/presentation/screens/home_screen.dart';
import 'package:untitled/presentation/screens/login_screen.dart';
import 'package:untitled/presentation/widgets/home_widget.dart';
import 'package:untitled/presentation/widgets/social_media.dart';
import 'package:untitled/presentation/widgets/text_form_filled_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isObscure= true;
  bool tick=false;
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController password= TextEditingController();
  TextEditingController phonecontroller= TextEditingController();
  TextEditingController password_confirmation= TextEditingController();
  TextEditingController gender= TextEditingController();
  TextEditingController name= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>SignUpCubit(),
        child: BlocConsumer<SignUpCubit,SignUpState>
        (
        listener: (context,state){
      if (state is SignUpStatSuccessState){
        ScaffoldMessenger.of(context,).showSnackBar(SnackBar(content: Text("Sign Up is successful")));
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>HomeScreen())
        );

      }else if (state is SignUpStatErrorState){
        ScaffoldMessenger.of(context,).showSnackBar(SnackBar(content: Text(state.em)));
        SnackBar (
          content: Text(state.em),
          duration: (Duration(seconds: 3)),
        );
      }
    },
    builder: (context, state) {
    return Scaffold(
    body:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38.0),
                  child: Text("Create Account",
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
                  child: Text("Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
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
                      child: TextFormFilledWidget(
                          controller: emailcontroller,
                          hintTxt: 'Email',
                          keyType: TextInputType.emailAddress),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextFormFilledWidget(
                        controller: password,
                        hintTxt: "Password",
                        keyType: TextInputType.visiblePassword,
                        obscureText: _isObscure,
                        suffxIcon: IconButton(onPressed: (){
                          setState(() {
                            _isObscure= !_isObscure;
                          });
                        }, icon: Icon(_isObscure?
                        Icons.visibility_off:
                        Icons.visibility),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: IntlPhoneField(
                            
                          controller: phonecontroller,
                          initialCountryCode: "EG",
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            hintText: "Your number",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(194, 194, 194, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextFormFilledWidget(
                          controller: gender,
                          hintTxt: 'Gender',
                          keyType: TextInputType.text),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextFormFilledWidget(
                          controller: password_confirmation,
                          hintTxt: 'Password Confirmation',
                          keyType: TextInputType.visiblePassword),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextFormFilledWidget(
                          controller: name,
                          hintTxt: 'Name',
                          keyType: TextInputType.name),
                    ),
                    SizedBox(height: 20,),

                    SizedBox(height: 35,),
                    InkWell(
                      onTap: (){
                      context.read<SignUpCubit>().signUp(
                          email: emailcontroller.text,
                          password: password.text,
                          password_confirmation: password_confirmation.text,
                          gender: gender.text,
                          phone: phonecontroller.text,
                          name: name.text);
                      },
                      child: Container(width: 350,
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(36, 124, 255, 1),
                        ),
                        child: Center(
                          child: Text("Create Account",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),),
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 118.2,
                          height: 1,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(224, 224, 224, 1)
                          ),
                        ),
                        Text("Or sign in with",
                          style: TextStyle(
                              color: Color.fromRGBO(158, 158, 158, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 12
                          ),),
                        Container(
                          width: 118.2,
                          height: 1,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(224, 224, 224, 1)
                          ),
                        ),
                        SizedBox(width: 20,),
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
                SizedBox(height: 25,),
                SocialMedia(),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 49.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black45, // Default color for normal text
                        fontSize: 13,
                      ),
                      children: [
                        TextSpan(text: 'By logging, you agree to our '),
                        TextSpan(
                          text: 'Terms & Conditions',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: ' and\n'),
                        TextSpan(
                          text: 'PrivacyPolicy.',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Row(
                    children: [
                      SizedBox(width: 100,),
                      InkWell(onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                        child: RichText(

                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black, // Default color for normal text
                                fontSize: 13,
                              ),
                              children: [
                                TextSpan(text: 'Already have an account ? '),
                                TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    color: Color.fromRGBO(36, 124, 255, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                        ),
                      )
                    ]
                )
              ],

            ),
          ),
        );
    }
    )
    );
  }
}
