import 'package:untitled/presentation/screens/verification_screen.dart';
import 'package:untitled/presentation/widgets/text_form_filled_widget.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({super.key});

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  TextEditingController phonecontroller= TextEditingController();
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController namecontroller= TextEditingController();
  DateTime? selectedDate;
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
                child: Text("Fill Your Profile",
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
                child: Text("Please take a few minutes to fill out your profile with as much detail as possible.",
                  style:  TextStyle(
                      color: Color.fromRGBO(117, 117, 117 , 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              SizedBox(height: 32,),
              Stack(
                children: [
                 Center(
                  child: CircleAvatar(
                   radius: 56,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person,size: 75,color: Color.fromRGBO(225, 225, 225, 1),),
                  ),
                 ),
                  Positioned(
                    bottom:6,
                    right: 150,
                    child:
                    CircleAvatar(radius: 16,
                    backgroundColor: Colors.white,
                      child: Icon(Icons.edit,color:Color.fromRGBO(117, 117  , 117, 1) ,),
                    ),
                  ),
              ],
            ),
              SizedBox(height: 30,),
              Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child:  TextFormFilledWidget(
                          controller: namecontroller,
                          hintTxt: 'Full Name',
                          keyType: TextInputType.name),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child:  TextFormFilledWidget(
                          controller: emailcontroller,
                          hintTxt: 'Email',
                          keyType: TextInputType.emailAddress),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: DateTimeField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(194, 194, 194, 1),
                          ),
                          hintText: "Birthday",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          )
                        ),
                          //selectedDate: selectedDate,
                          mode: DateTimeFieldPickerMode.date,
                          //onDateSelected: (DateTime value){
                         // },
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
                    SizedBox(height: 110,),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>VerificationScreen()));
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
