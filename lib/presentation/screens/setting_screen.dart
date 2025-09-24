import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/logic/login/cubit.dart';
import 'package:untitled/logic/login/state.dart';
import 'package:untitled/presentation/screens/FAQ_screen.dart';
import 'package:untitled/presentation/screens/lang_screen.dart';
import 'package:untitled/presentation/screens/login_screen.dart';
import 'package:untitled/presentation/screens/notification_page.dart';
import 'package:untitled/presentation/screens/security_screen.dart';
import 'package:untitled/presentation/widgets/upper_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: UpperBar(title: "Setting"),
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: 350,
              width: 327,
              child: Column(
                children: [
                  // Notifications
                  Row(
                    children: [
                      const Icon(Icons.notifications_none),
                      const SizedBox(width: 20),
                      const Text(
                        "Notification",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const NotificationPage()),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  const Divider(thickness: 0.25, color: Color.fromRGBO(158, 158, 158, 1)),

                  // FAQ
                  Row(
                    children: [
                      const Icon(Icons.question_answer),
                      const SizedBox(width: 20),
                      const Text(
                        "FAQ",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const FaqScreen()),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  const Divider(thickness: 0.25, color: Color.fromRGBO(158, 158, 158, 1)),

                  // Security
                  Row(
                    children: [
                      const Icon(Icons.lock),
                      const SizedBox(width: 20),
                      const Text(
                        "Security",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const SecurityScreen()),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  const Divider(thickness: 0.25, color: Color.fromRGBO(158, 158, 158, 1)),

                  // Language
                  Row(
                    children: [
                      const Icon(Icons.language),
                      const SizedBox(width: 20),
                      const Text(
                        "Language",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LangScreen()),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  const Divider(thickness: 0.25, color: Color.fromRGBO(158, 158, 158, 1)),

                  // Logout
                  Row(
                    children: [
                      const Icon(Icons.logout, color: Color.fromRGBO(255, 76, 94, 1)),
                      const SizedBox(width: 20),
                      const Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(255, 76, 94, 1),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      BlocProvider(
                        create: (context) => LoginCubit(),
                        child: BlocConsumer<LoginCubit, CreateLoginState>(
                          listener: (context, state) {
                            if (state is CreateLoginsSuccessState) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginScreen()),
                              );
                            } else if (state is CreateLoginErrorState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.em)),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is CreateLoginLoadingState) {
                              return const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              );
                            }
                            return IconButton(
                              onPressed: () {
                                context.read<LoginCubit>().logout();
                              },
                              icon: const Icon(Icons.arrow_forward_ios),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 0.25, color: Color.fromRGBO(158, 158, 158, 1)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
