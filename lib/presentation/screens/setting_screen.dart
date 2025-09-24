import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/presentation/screens/FAQ_screen.dart';
import 'package:untitled/presentation/screens/lang_screen.dart';
import 'package:untitled/presentation/screens/login_screen.dart';
import 'package:untitled/presentation/screens/notification_page.dart';
import 'package:untitled/presentation/screens/security_screen.dart';
import 'package:untitled/presentation/widgets/upper_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:   UpperBar(title: "Setting"),),
      body: Column(
        children: [
          Center(
            child: SizedBox(
            height: 350,
            width: 327,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.notifications_none),
                    SizedBox(width: 20,),
                    Text("Notification",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),),
                    SizedBox(width: 151,),
                    IconButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NotificationPage()));
                    }, icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
                Divider(thickness: 0.25,
                  color: Color.fromRGBO(158, 158, 158, 1),),
                Row(
                  children: [
                    Icon(Icons.question_answer),
                    SizedBox(width: 20,),
                    Text("FAQ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),),
                    SizedBox(width: 206),
                    IconButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FaqScreen()));
                    }, icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
                Divider(thickness: 0.25,
                  color: Color.fromRGBO(158, 158, 158, 1),),
                Row(
                  children: [
                    Icon(Icons.lock),
                    SizedBox(width: 20,),
                    Text("Security",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),),
                    SizedBox(width: 176,),
                    IconButton(
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SecurityScreen()));
                        },
                        icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
                Divider(thickness: 0.25,
                  color: Color.fromRGBO(158, 158, 158, 1),),
                Row(
                  children: [
                    Icon(Icons.language),
                    SizedBox(width: 20,),
                    Text("Language",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),),
                    SizedBox(width: 164,),
                    IconButton(
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LangScreen()));
                        },
                        icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
                Divider(thickness: 0.25,
                  color: Color.fromRGBO(158, 158, 158, 1),),
                Row(
                  children: [
                    Icon(Icons.logout,color: Color.fromRGBO(255, 76, 94, 1),),
                    SizedBox(width: 20,),
                    Text("Logout",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(255, 76, 94, 1),
                          fontWeight: FontWeight.w400
                      ),),
                    SizedBox(width: 185,),
              IconButton(
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  final token = prefs.getString("token");

                  Dio dio = Dio();

                  try {
                    final response = await dio.post(
                      'https://vcare.integration25.com/api/auth/logout',
                      options: Options(
                        headers: {
                          "Accept": "application/json",
                          "Authorization": "Bearer $token",
                        },
                      ),
                    );

                    print("Logout response: ${response.data}");

                    // Clear local session
                    await prefs.remove("token");

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  } catch (e) {
    if (e is DioException) {
    print("Logout failed with status: ${e.response?.statusCode}");
    print("Response data: ${e.response?.data}");
    } else {
    print("Logout failed: $e");
    }
    }

    },
                      icon: Icon(Icons.arrow_forward_ios)),
                    Divider(thickness: 0.25,
                      color: Color.fromRGBO(158, 158, 158, 1),),
                  ],
                ),
              ],
            ),
            ),
          )
        ],
      ),
      
    );
  }
}
