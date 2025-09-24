import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboWidget extends StatefulWidget {
  AboWidget({super.key});

  @override
  State<AboWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboWidget> {
  bool isAbout=true;
  bool isLocation=false;
  bool isReviews=false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 44,
      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    isAbout=true;
                    isLocation=false;
                    isReviews=false;
                    setState(() {
                    });
                  },
                  child:Container(
                    width: 96,
                    height: 43,
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(12),
                        color:isAbout==true?Colors.white: Colors.white,
                        border: Border.all(
                          color:isAbout==true?Color.fromRGBO(36, 124, 255, 1): Color.fromRGBO(158, 158, 158, 1),
                          width: 1.5,
                        )
                    ),
                    child: Center(
                      child: Text("About",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color:isAbout==true?Color.fromRGBO(36, 124, 255, 1): Color.fromRGBO(158, 158, 158, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    isAbout=false;
                    isLocation=true;
                    isReviews=false;
                    setState(() {

                    });
                  },
                  child:Container(
                    width: 96,
                    height: 43,
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(12),
                        color:isLocation==true?Colors.white: Colors.white,
                        border:
                        Border.all(
                          color:isLocation==true?Color.fromRGBO(36, 124, 255, 1): Color.fromRGBO(158, 158, 158, 1),
                          width: 1.5,

                        ),
                    ),
                    child: Center(
                        child: Text("Location",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color:isLocation==true?Color.fromRGBO(36, 124, 255, 1): Color.fromRGBO(158, 158, 158, 1),
                          ),
                        )),
                  ),
                ),
                InkWell(
                  onTap: (){
                    isAbout=false;
                    isLocation=false;
                    isReviews=true;
                    setState(() {

                    });
                  },
                  child:Container(
                    width: 96,
                    height: 43,
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(12),
                        color:isReviews==true?Colors.white: Colors.white,
                        border: Border.all(
                          color:isReviews==true?Color.fromRGBO(36, 124, 255, 1): Color.fromRGBO(158, 158, 158, 1),
                          width: 1.5,
                        )
                    ),
                    child: Center(
                        child: Text("Reviews",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color:isReviews==true?Color.fromRGBO(36, 124, 255, 1): Color.fromRGBO(158, 158, 158, 1),
                          ),
                        )),
                  ),
                ),
              ],
            ),
    );

  }
}
