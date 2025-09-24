import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_date_picker_flutter/horizontal_date_picker_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:untitled/data/doctor_model.dart';
import 'package:untitled/presentation/screens/booking_details.dart';
import 'package:untitled/presentation/screens/reschedule_details.dart';
import 'package:untitled/presentation/screens/summary_page.dart';
import 'package:untitled/presentation/widgets/time_widget.dart';
import 'package:untitled/presentation/widgets/upper_bar.dart';

class RescheduleScreen extends StatefulWidget {
  final DateTime? selectedDate;
  final String? selectedTime;
  final int? selectedAppointmentType;
  final int? selectedPayment;
  final int? selectedCard;
  final DoctorModel doctor;
  final String imagePath;
  const RescheduleScreen({super.key,
    this.selectedDate,
    this.selectedTime,
    this.selectedAppointmentType,
    this.selectedPayment,
    this.selectedCard,
    required this.doctor,
    required this.imagePath,
  });

  @override
  State<RescheduleScreen> createState() => _RescheduleScreenState();
}

class _RescheduleScreenState extends State<RescheduleScreen> {
  DateTime? selectedDate;
  String? selectedTime;
  int seleectedindex=-1;
  @override
  Widget build(BuildContext context) {
return Scaffold(
  bottomNavigationBar: InkWell(
    onTap: (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RescheduleDetails(selectedDate: widget.selectedDate,
        selectedTime: widget.selectedTime,
        selectedAppointmentType: widget.selectedAppointmentType,
        selectedPayment: widget.selectedPayment,
        selectedCard: widget.selectedCard,
        doctor: widget.doctor,
        imagePath: widget.imagePath,)));
    },
    child: Container(
      width: 327,
      height: 52,
      decoration: BoxDecoration(
          color: Color.fromRGBO(36, 124, 255, 1),
          borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: Text("Reschedule",
            style: TextStyle(color: Colors.white)),
      ),
    ),
  ),
  appBar: AppBar(
    automaticallyImplyLeading: false,
    title: UpperBar(title: "Reschedule"),),
  body: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 300,
            height: 29,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Select Date",
                style: TextStyle(fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color.fromRGBO(36, 36, 36, 1)),),
            ),
          ),
          InkWell(onTap: (){
            showDialog(
              context: context,
              builder: (ctx)=>AlertDialog(
                title: Text("Select Data"),
                content: SingleChildScrollView(
                  child: SizedBox(
                    height: 445,
                    width: double.maxFinite,
                    child: TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                      selectedDayPredicate: (day)=>isSameDay(selectedDate, day),
                      onDaySelected: (day,focusedDay) {
                        setState(() {
                          selectedDate=day;
                        });
                        Navigator.pop(ctx);
                      },
                    ),
                  ),
                ),
              ),
            );
          },
            child: Text("Set Manual",
              style:TextStyle(color: Color.fromRGBO(36, 124, 255, 1),
                  fontSize: 12,fontWeight: FontWeight.w400) ,),
          ),
        ],
      ),
      SizedBox(height: 10,),
      HorizontalDatePicker(
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 40)),
        onDateTap: (date) {
          setState(() {
            selectedDate = date;
          });
        },
        selectedItemColor: Color.fromRGBO(34, 124, 255, 1),
        unSelectedItemColor: Color.fromRGBO(224, 224, 224, 1),
        dayTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20
        ),
      ),
      SizedBox(height: 20,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Available time"
            ,style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          TimeWidget(
            onTimeSelected: (time) {
              setState(() {
                selectedTime = time;
              });
            },
            selectedTime: selectedTime,
          )
        ],
      ),
      SizedBox(height: 20,),
      SizedBox(
        height: 248,
        width: 327,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Appointment Type",
              style:TextStyle(fontWeight: FontWeight.w600,
                  fontSize:16 ),),
            SizedBox(height: 5,),
            SizedBox(
              width: 327,
              height: 56,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(234, 242, 255, 1),
                    child: Icon(Icons.person,color: Color.fromRGBO(36, 124, 255, 1),),
                  ),
                  SizedBox(width: 10,),
                  Text("In Person",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),),
                  SizedBox(width: 160,),
                  IconButton(
                      onPressed: (){
                        setState(() {
                          seleectedindex=0;
                        });
                      }, icon: Icon(
                    seleectedindex==0?
                    Icons.circle:
                    Icons.circle_outlined,color: Color.fromRGBO(36, 124, 255, 1),
                  )
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              width: 327,
              height: 56,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(233, 250, 239, 1),
                    child: Icon(Icons.video_call,color: Color.fromRGBO(34, 197, 94, 1),),
                  ),
                  SizedBox(width: 6,),
                  Text("Video Call",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),),
                  SizedBox(width: 160,),
                  IconButton(onPressed: (){
                    setState(() {
                      seleectedindex=1;

                    });
                  }, icon:Icon(
                    seleectedindex==1?
                    Icons.circle:
                    Icons.circle_outlined,color: Color.fromRGBO(36, 124, 255, 1),

                  ),
                  )
                ],
              ),
            ),
            Divider(),
            SizedBox(
              width: 327,
              height: 56,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(253, 253, 255, 1),
                    child: Icon(Icons.phone,color: Color.fromRGBO(255, 76, 94, 1),),
                  ),
                  SizedBox(width: 2,),
                  Text("Phone Call",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),),
                  SizedBox(width: 160,),
                  IconButton(onPressed: (){
                    setState(() {
                      seleectedindex=2;            });
                  }, icon: Icon(
                    seleectedindex==2?
                    Icons.circle:
                    Icons.circle_outlined,color: Color.fromRGBO(36, 124, 255, 1),

                  ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);
  }
}
