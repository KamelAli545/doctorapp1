import 'package:untitled/presentation/widgets/button_widget.dart';
import 'package:untitled/presentation/widgets/upper_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LangScreen extends StatefulWidget {
  const LangScreen({super.key});

  @override
  State<LangScreen> createState() => _LangScreenState();
}

class _LangScreenState extends State<LangScreen> {
  String selectedLanguage = 'English';
  final List<Map<String, String>> languages = [
    {'name': 'English', 'code': 'en', 'flag': '🇺🇸'},
    {'name': 'Spanish', 'code': 'es', 'flag': '🇪🇸'},
    {'name': 'French', 'code': 'fr', 'flag': '🇫🇷'},
    {'name': 'German', 'code': 'de', 'flag': '🇩🇪'},
    {'name': 'Italian', 'code': 'it', 'flag': '🇮🇹'},
    {'name': 'Portuguese', 'code': 'pt', 'flag': '🇵🇹'},
    {'name': 'Russian', 'code': 'ru', 'flag': '🇷🇺'},
    {'name': 'Chinese', 'code': 'zh', 'flag': '🇨🇳'},
    {'name': 'Japanese', 'code': 'ja', 'flag': '🇯🇵'},
    {'name': 'Korean', 'code': 'ko', 'flag': '🇰🇷'},
    {'name': 'Arabic', 'code': 'ar', 'flag': '🇸🇦'},
    {'name': 'Hindi', 'code': 'hi', 'flag': '🇮🇳'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:             UpperBar(title: "Language"),
          ),
      body: Column(
          children: [
            Container(
              width: 343,
              height: 46,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),color: Color.fromRGBO(242, 244, 247, 1)),
              child: Row(
                children: [
                  Icon(Icons.search,color: Color.fromRGBO(158, 158, 158, 1),),
                  SizedBox(width: 8,),
                  Expanded(
                    child: TextFormField(
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black
                      ),
                      decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color.fromRGBO(158, 158, 158, 1)
                          ),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
height: 650,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    itemCount: languages.length,
                    itemBuilder: (context, index) {
                      final language = languages[index];
                      final isSelected = selectedLanguage == language['name'];

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedLanguage = language['name']!;
                          });
                        },
                        child: Container(
                          width: 100,
                          margin: EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: isSelected ? Color(0xFF247CFF) : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected ? Color(0xFF247CFF) : Colors.grey[300]!,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                language['flag']!,
                                style: TextStyle(fontSize: 32),
                              ),
                              SizedBox(height: 8),
                              Text(
                                language['name']!,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      bottomNavigationBar: ButtonWidget(title: "Save"),
    );
  }
}
