import 'package:untitled/core&colors/helper/helper.dart';
import 'package:untitled/logic/login/cubit.dart';
import 'package:untitled/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  final loggedIn = await LoginCubit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      home: SplashScreen(),

    );
  }
}
