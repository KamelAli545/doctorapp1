import 'package:untitled/presentation/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpperBar extends StatefulWidget {
  final String title;
  final Widget? trailing;



  UpperBar({
    super.key,required this.title,
    this .trailing
  });

  @override
  State<UpperBar> createState() => _UpperBarState();
}

class _UpperBarState extends State<UpperBar> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 60),
      child: SizedBox(
        height: 50,
        width: 500,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                Container(
                  height:30 ,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color:Color.fromRGBO(237, 237, 237, 1),
                  )
                  ),
                  child: Center(
                    child:
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => HomeScreen()));                      },
                      child: Icon(Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                      ),
                    ),
                    ),
                ),
            Spacer(),
            Text(widget.title,
            style: TextStyle(color:
            Color.fromRGBO(36, 36, 36, 1),
            fontWeight: FontWeight.w600,
            fontSize: 18),
            ),
            Spacer(),
            widget.trailing ?? SizedBox(width: 45),
          ],
        ),
      ),
    );
  }
}
