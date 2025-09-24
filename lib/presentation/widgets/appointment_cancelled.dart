import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppointmentCancelled extends StatefulWidget {
  String name;
  String description;
  String hostpial;
  String time;
  String date;
  String imagePath;
  String rate;
  String reviews;

   AppointmentCancelled({super.key,
     required this.name,
     required this.description,
     required this.hostpial,
     required this.date,
     required this.time,
     required this.imagePath,
     required this.rate,
     required this.reviews});

  @override
  State<AppointmentCancelled> createState() => _AppointmentCancelledState();
}

class _AppointmentCancelledState extends State<AppointmentCancelled> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 176,
      width: 343,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Appointment cancelled",
                      style:TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(255, 76, 94, 1),
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        Text(widget.date,
                          style: TextStyle(
                              fontWeight:FontWeight.w400,
                              fontSize: 10,
                              color: Color.fromRGBO(158, 158, 158, 1)
                          ),),
                        SizedBox(width: 5,),
                        Text("|",
                        ),
                        SizedBox(width: 5,),
                        Text((widget.time)
                          ,style: TextStyle(
                              fontWeight:FontWeight.w400,
                              fontSize: 10,
                              color: Color.fromRGBO(158, 158, 158, 1)
                          ),)
                      ],
                    ),

                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Icon(Icons.more_vert,
                  color: Color.fromRGBO(158, 158, 158, 1),
                  weight: 5,),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0,left: 30,top: 8),
                child: ClipRRect(
                    child: Image.asset(widget.imagePath,width: 73,height:73,fit: BoxFit.cover,
                    )
                ),
              ),
              SizedBox(width: 16,),
              Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name,
                        style: TextStyle(
                            color:Color.fromRGBO(36, 36, 36, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),),
                      Row(
                        children: [
                          Text(widget.description,
                            style: TextStyle(
                                color:Color.fromRGBO(117, 117, 117, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text("|",
                          ),
                          SizedBox(width: 5,),
                          Text(widget.hostpial,
                            style: TextStyle(
                                color:Color.fromRGBO(117, 117, 117, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star,color: Colors.amberAccent,),
                          SizedBox(width: 5,),
                          Text(widget.rate,
                            style: TextStyle(
                                fontWeight:FontWeight.w400,
                                fontSize: 10,
                                color: Color.fromRGBO(158, 158, 158, 1)
                            ),),
                          SizedBox(width: 5,),

                          Text((widget.reviews)
                            ,style: TextStyle(
                                fontWeight:FontWeight.w400,
                                fontSize: 10,
                                color: Color.fromRGBO(158, 158, 158, 1)
                            ),)
                        ],
                      ),

                    ],
                  )
              ),

            ],
          ),
        ],

      ),
    );
  }
}
