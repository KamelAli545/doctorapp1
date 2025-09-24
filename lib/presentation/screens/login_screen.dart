import 'package:untitled/logic/login/cubit.dart';
import 'package:untitled/logic/login/state.dart';
import 'package:untitled/presentation/screens/forget_screen.dart';
import 'package:untitled/presentation/screens/home_screen.dart';
import 'package:untitled/presentation/screens/sign_up_screen.dart';
import 'package:untitled/presentation/widgets/social_media.dart';
import 'package:untitled/presentation/widgets/text_form_filled_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure= true;
  bool tick=false;
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController password= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, CreateLoginState>
          (
            listener: (context, state) {
              if (state is CreateLoginsSuccessState) {
                ScaffoldMessenger.of(context,).showSnackBar(
                    SnackBar(content: Text("Login is successful")));
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen())
                );
              } else if (state is CreateLoginErrorState) {
                ScaffoldMessenger.of(context,).showSnackBar(
                    SnackBar(content: Text(state.em)));
                SnackBar(
                  content: Text(state.em),
                  duration: (Duration(seconds: 3)),
                );
              }
            },
            builder: (context, state) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 38.0),
                        child: Text("Welcome Back",
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
                        child: Text(
                          "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                          style: TextStyle(
                              color: Color.fromRGBO(117, 117, 117, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                      SizedBox(height: 35,),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0),
                            child: TextFormFilledWidget(
                                controller: emailcontroller,
                                hintTxt: 'Email',
                                keyType: TextInputType.emailAddress),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0),
                            child: TextFormFilledWidget(
                              controller: password,
                              hintTxt: "Password",
                              keyType: TextInputType.visiblePassword,
                              obscureText: _isObscure,
                              suffxIcon: IconButton(onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }, icon: Icon(_isObscure ?
                              Icons.visibility_off :
                              Icons.visibility),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 16,),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    tick = !tick;
                                  });
                                }, icon: Icon(
                                tick ?
                                Icons.check_box_outline_blank :
                                Icons.check_box,
                                color: Color.fromRGBO(158, 158, 158, 1),
                              ),
                              ),
                              Text("Remember me",
                                style: TextStyle(
                                    color: Color.fromRGBO(158, 158, 158, 1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400
                                ),),

                              SizedBox(width: 115,),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) =>
                                          ForgetScreen()));
                                },
                                child: Text("Forgot Password?",
                                  style: TextStyle(
                                      color: Color.fromRGBO(36, 124, 255, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 30,),

                          (state is CreateLoginLoadingState)?CircularProgressIndicator():InkWell(
                            onTap: () {
                              context.read<LoginCubit>().logIn(
                                  email: emailcontroller.text,
                                  pass: password.text);
                            },
                            child: Container(width: 350,
                              height: 52,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(36, 124, 255, 1),
                              ),
                              child: Center(
                                child: Text("Login",
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
                              color: Colors.black45,
                              // Default color for normal text
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
                            InkWell(onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                      // Default color for normal text
                                      fontSize: 13,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: 'Already do not have an account yet? '),
                                      TextSpan(
                                        text: 'Sign Up',
                                        style: TextStyle(
                                          color: Color.fromRGBO(
                                              36, 124, 255, 1),
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
