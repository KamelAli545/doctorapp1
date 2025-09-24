import 'package:untitled/presentation/widgets/home_widget.dart';
import 'package:untitled/presentation/widgets/messahe_widget.dart';
import 'package:untitled/presentation/widgets/recom_widget.dart';
import 'package:untitled/presentation/widgets/search_widget.dart';
import 'package:untitled/presentation/widgets/upper_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:   AppBar(
      automaticallyImplyLeading: false,
      title:
    UpperBar(title: "Messages",trailing: Icon(Icons.add),),
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchWidget(hintTxt: "Search Messages"),
            MessaheWidget(
                name: "Dr. Randy Wigham",
                description: "General Doctor",
                hostpial: "RSUD Gatot Subroto",
                imagePath: "assets/images/Randy.png",
                time: "7:11 PM",
                message: "Fine, I'll do a check. Does the \n patient have a history of certain \ndiseases?",
                ),
            Divider(),
            MessaheWidget(
              name: "Dr. Jack Sulivan",
              description: "General Doctor",
              hostpial: "RSUD Gatot Subroto",
              imagePath: "assets/images/Susan.png",
              time: "7:11 PM",
              message: "Fine, I'll do a check. Does the \n patient have a history of certain \ndiseases?",
            ),
            Divider(),
            MessaheWidget(
              name: "Drg. Hanna Stanton",
              description: "General Doctor",
              hostpial: "RSUD Gatot Subroto",
              imagePath: "assets/images/Image (4).png",
              time: "7:11 PM",
              message: "Fine, I'll do a check. Does the \n patient have a history of certain \ndiseases?",
            ),
            Divider(),
            MessaheWidget(
              name: "Dr. Emery Lubin",
              description: "General Doctor",
              hostpial: "RSUD Gatot Subroto",
              imagePath: "assets/images/Image (5).png",
              time: "7:11 PM",
              message: "Fine, I'll do a check. Does the \n patient have a history of certain \ndiseases?",
            ),
            Divider(),
            MessaheWidget(
              name: "Dr. Randy Wigham",
              description: "General Doctor",
              hostpial: "RSUD Gatot Subroto",
              imagePath: "assets/images/Randy.png",
              time: "7:11 PM",
              message: "Fine, I'll do a check. Does the \n patient have a history of certain \ndiseases?",
            ),
          ],
              ),
            ),
      bottomNavigationBar: HomeWidget(),
    );

  }
}
