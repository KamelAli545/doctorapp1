import 'package:untitled/presentation/screens/search_screen.dart';
import 'package:untitled/presentation/widgets/upper_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:
        UpperBar(
          title: "FAQ",trailing: InkWell(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
            },
            child: Icon(Icons.search)),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              title: Text("What should I expect during a doctor's appointment?",style: TextStyle(
              fontSize: 14,fontWeight: FontWeight.w400
            ),),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("During a doctor's appointment, you can expect to discuss your medical history, current symptoms or concerns, and any medications or treatments you are taking. The doctor will likely perform a physical exam and may order additional tests or procedures if necessary.",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: Color.fromRGBO(117, 117, 117, 1)
                ),),
              )
            ],
            ),
            Divider(),
            ExpansionTile(
              title: Text("What should I expect during a doctor's appointment?",style: TextStyle(
                fontSize: 14,fontWeight: FontWeight.w400
            ),),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("During a doctor's appointment, you can expect to discuss your medical history, current symptoms or concerns, and any medications or treatments you are taking. The doctor will likely perform a physical exam and may order additional tests or procedures if necessary.",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Color.fromRGBO(117, 117, 117, 1)
                    ),),
                )
              ],
            ),
            Divider(),
            ExpansionTile(
              title: Text("What should I expect during a doctor's appointment?",style: TextStyle(
                fontSize: 14,fontWeight: FontWeight.w400
            ),),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("During a doctor's appointment, you can expect to discuss your medical history, current symptoms or concerns, and any medications or treatments you are taking. The doctor will likely perform a physical exam and may order additional tests or procedures if necessary.",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Color.fromRGBO(117, 117, 117, 1)
                    ),),
                )
              ],
            ),
            Divider(),
            ExpansionTile(
              title: Text("What should I expect during a doctor's appointment?",style: TextStyle(
                fontSize: 14,fontWeight: FontWeight.w400
            ),),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("During a doctor's appointment, you can expect to discuss your medical history, current symptoms or concerns, and any medications or treatments you are taking. The doctor will likely perform a physical exam and may order additional tests or procedures if necessary.",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Color.fromRGBO(117, 117, 117, 1)
                    ),),
                )
              ],
            ),
            Divider(),
            ExpansionTile(
              title: Text("What should I expect during a doctor's appointment?",style: TextStyle(
                fontSize: 14,fontWeight: FontWeight.w400
            ),),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("During a doctor's appointment, you can expect to discuss your medical history, current symptoms or concerns, and any medications or treatments you are taking. The doctor will likely perform a physical exam and may order additional tests or procedures if necessary.",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Color.fromRGBO(117, 117, 117, 1)
                    ),),
                )
              ],
            ),
            Divider(),
            ExpansionTile(
              title: Text("What should I expect during a doctor's appointment?",style: TextStyle(
                  fontSize: 14,fontWeight: FontWeight.w400
              ),),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("During a doctor's appointment, you can expect to discuss your medical history, current symptoms or concerns, and any medications or treatments you are taking. The doctor will likely perform a physical exam and may order additional tests or procedures if necessary.",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Color.fromRGBO(117, 117, 117, 1)
                    ),),
                )
              ],
            ),
            Divider(),
            ExpansionTile(
              title: Text("What should I expect during a doctor's appointment?",style: TextStyle(
                  fontSize: 14,fontWeight: FontWeight.w400
              ),),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("During a doctor's appointment, you can expect to discuss your medical history, current symptoms or concerns, and any medications or treatments you are taking. The doctor will likely perform a physical exam and may order additional tests or procedures if necessary.",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Color.fromRGBO(117, 117, 117, 1)
                    ),),
                )
              ],
            ),
            Divider(),
            ExpansionTile(
              title: Text("What should I expect during a doctor's appointment?",style: TextStyle(
                  fontSize: 14,fontWeight: FontWeight.w400
              ),),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("During a doctor's appointment, you can expect to discuss your medical history, current symptoms or concerns, and any medications or treatments you are taking. The doctor will likely perform a physical exam and may order additional tests or procedures if necessary.",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Color.fromRGBO(117, 117, 117, 1)
                    ),),
                )
              ],
            ),
            Divider(),
            ExpansionTile(
              title: Text("What should I expect during a doctor's appointment?",style: TextStyle(
                  fontSize: 14,fontWeight: FontWeight.w400
              ),),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("During a doctor's appointment, you can expect to discuss your medical history, current symptoms or concerns, and any medications or treatments you are taking. The doctor will likely perform a physical exam and may order additional tests or procedures if necessary.",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Color.fromRGBO(117, 117, 117, 1)
                    ),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
