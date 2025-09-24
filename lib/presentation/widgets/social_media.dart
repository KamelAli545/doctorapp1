import 'package:flutter/cupertino.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  @override
  Widget build(BuildContext context) {
    return Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
Padding(padding: EdgeInsets.symmetric(horizontal: 40))  ,
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color.fromRGBO(245, 245 , 245, 1)
          ),
          child: Center(
            child: Image.asset("assets/logos/google.png",
            width: 30,
            height: 30,),
          ),
        ),
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color.fromRGBO(245, 245 , 245, 1)
          ),
          child: Center(
            child: Image.asset("assets/logos/facebook.png",
              width: 30,
              height: 30,),
          ),
        ),
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color.fromRGBO(245, 245 , 245, 1)
          ),
          child: Center(
            child: Image.asset("assets/logos/apple.png",
              width: 30,
              height: 30,),
          ),
        ),
        SizedBox(width: 90,)
      ],
    );
  }
}
