import 'package:flutter/cupertino.dart';

class MessaheWidget extends StatefulWidget {
  String name;
  String description;
  String hostpial;
  String imagePath;
  String time;
  String message;
  bool? readen;

   MessaheWidget({super.key,
    required this.name,
    required this.description,
    required this.hostpial,
    required this.imagePath,
    required this.time,
     required this.message,
  });

  @override
  State<MessaheWidget> createState() => _MessaheWidgetState();
}

class _MessaheWidgetState extends State<MessaheWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 332,
      height: 150,
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(widget.imagePath,width: 50,height: 50,
              )
          ),
          SizedBox(width: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name,
                  style:TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),),
                SizedBox(height: 2,),
                Row(
                  children: [
                    Text(widget.description,
                      style:TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(97, 97, 97, 1)
                      ),),
                    SizedBox(width: 1,),
                    Text("|",
                      style:TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(97, 97, 97, 1)
                      ),),
                    SizedBox(width: 1,),
                    Text(widget.hostpial,
                      style:TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(97, 97, 97, 1)
                      ),),
                  ],
                ),
                SizedBox(height: 3,),
                Text(widget.message,
                  style:TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(97, 97, 97, 1)
                  ),),
              ],
            ),
          ),
          SizedBox(width: 5,),
          Padding(
            padding: const EdgeInsets.only(bottom: 75.0),
            child: Text(widget.time,
              style: TextStyle(
                  fontWeight:FontWeight.w400,
                  fontSize: 10,
                  color: Color.fromRGBO(158, 158, 158, 1)
              ),),
          ),


        ],
      ),
    );
  }
}
