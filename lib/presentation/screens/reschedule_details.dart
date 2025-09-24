import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/data/doctor_model.dart';
import 'package:untitled/presentation/screens/home_screen.dart';
import 'package:untitled/presentation/widgets/recom_widget.dart';
import 'package:untitled/presentation/widgets/upper_bar.dart';

class RescheduleDetails extends StatefulWidget{
  final DateTime? selectedDate;
  final String? selectedTime;
  final int? selectedAppointmentType;
  final int? selectedPayment;
  final int? selectedCard;
  final DoctorModel doctor;
  final String imagePath;

  const RescheduleDetails({super.key,

    this.selectedDate,
    this.selectedTime,
    this.selectedAppointmentType,
    this.selectedPayment,
    this.selectedCard,
    required this.doctor,
    required this.imagePath,



  });

  @override
  State<RescheduleDetails> createState() => _RescheduleDetailsState();
}

class _RescheduleDetailsState extends State<RescheduleDetails> {
  @override
  Widget build(BuildContext context) {
    final doctor =widget.doctor;
    return Scaffold(
      bottomNavigationBar:   InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        },
        child: Container(
          width: 327,
          height: 52,
          decoration: BoxDecoration(
              color: Color.fromRGBO(36, 124, 255, 1),
              borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Text("Done",
                style: TextStyle(color: Colors.white)),
          ),
        ),
      ),

        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: UpperBar(title: "Details"),),
        body: SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(height: 90,),
                  SizedBox(
                    width: 200,
                    height: 130.8,
                    child:Column(
                      children: [
                        Center(
                          child:SizedBox(
                            width: 78,
                            height: 78,
                            child: CircleAvatar(
                              backgroundColor:  Color.fromRGBO(36, 197, 94, 1) ,
                              child: Icon(Icons.check,color: Colors.white,size:55 ,),
                            ),
                          ) ,
                        ),
                        SizedBox(height: 20,),
                        Text("Booking has been rescheduled",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),)
                      ],

                    ),
                  ),
                  SizedBox(height: 60,),
                  SizedBox(
                      width: 327,
                      height: 201,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Booking Information",
                              style:TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,),),
                            SizedBox(height: 22,),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 30.0),
                                  child: CircleAvatar(
                                    backgroundColor: Color.fromRGBO(234, 242, 255, 1),
                                    child: Icon(Icons.calendar_month_outlined,color: Color.fromRGBO(36, 124, 255, 1),),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Date & Time",style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600
                                    ),),
                                    SizedBox(height: 6,),
                                    Text(widget.selectedDate!=null?
                                    "${widget.selectedDate!.day}/${widget.selectedDate!.month}/${widget.selectedDate!.year}":"Not Selected",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12
                                      ),),
                                    SizedBox(height: 6,),
                                    Text(widget.selectedTime??"Not Selected",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12
                                      ),),
                                  ],
                                )
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: CircleAvatar(
                                    backgroundColor: Color.fromRGBO(233, 250, 239, 1),
                                    child: Icon(Icons.receipt,color: Color.fromRGBO(34, 197, 94, 1),),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Appointment Type",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600
                                      ),),
                                    SizedBox(height: 6,),
                                    Text(widget.selectedAppointmentType!=null?
                                    (widget.selectedAppointmentType==0?"In Person":widget.selectedAppointmentType==1?"Video Call":widget.selectedAppointmentType==2?"Phone Call":"unknown"):"not Selected",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12
                                      ),),
                                  ],
                                ),
                                SizedBox(width: 30,),
                                Container(
                                  width:109,
                                  height: 38,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(48),
                                      border: Border.all(color: Color.fromRGBO(36, 124, 255, 1))
                                  ),
                                  child: Center(child:Text("Get Link",
                                    style: TextStyle(
                                        color: Color.fromRGBO(36, 124, 255, 1),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12
                                    ),),),
                                )
                              ],
                            ),
                            Divider(),
                          ]
                      )
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(right: 160.0),
                    child: Text("Doctor Information",
                      style:TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,),),
                  ),
                  SizedBox(height: 10,),
                  RecomWidget(
                    imagePath: widget.imagePath,
                    rate: doctor.rating.toString(),
                    description: doctor.description,
                    hostpial: doctor.specialization!.name ?? "Unknown Hospital",
                    name: doctor.name,
                    reviews: "${doctor.reviewsCount} reviews",),
                  SizedBox(height: 60,),
                ]
            )
        )
    );
  }
}
