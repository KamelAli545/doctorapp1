import 'package:untitled/data/doctor_model.dart';
import 'package:untitled/presentation/screens/payment_screen.dart';
import 'package:untitled/presentation/widgets/appointment_widget.dart';
import 'package:untitled/presentation/widgets/time_widget.dart';
import 'package:untitled/presentation/widgets/upper_bar.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_date_picker_flutter/horizontal_date_picker_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

class BookApponint extends StatefulWidget {
  final DoctorModel doctor;
  final String imagePath;
  const BookApponint({super.key,required this.imagePath,required this.doctor});

  @override
  State<BookApponint> createState() => _BookApponintState();
}

class _BookApponintState extends State<BookApponint> {
  DateTime? selectedDate;
  String? selectedTime;
  int selectedAppointmentType=-1;
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: UpperBar(title: "Book Appointment"),
          ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
            child: Center(
                child: SizedBox(
                  width: 500,
                  height: 90,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(36 ,124 , 255, 1),
                            child: Center(
                              child: Text("1",
                              style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),),
                            ),
                          ),
                           SizedBox(height: 9,),
                           Center(
                               child: Text("Date & Time",
                               style: TextStyle(color: Colors.black,
                               fontSize: 10,
                               fontWeight: FontWeight.w400),))
                        ],
                      ),
                      SizedBox(width: 20,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 35.0),
                        child: Container(
                          width:50,
                          height: 3,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                            color: Colors.grey
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(224, 224, 224, 1),
                            child: Center(
                              child: Text("2",
                                style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),),
                            ),
                          ),
                          SizedBox(height: 9,),
                          Center(
                              child: Text("Payment",
                                style: TextStyle(color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),))
                        ],
                      ),
                      SizedBox(width: 20,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 35.0),
                        child: Container(
                          width:50,
                          height: 3,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                              color: Colors.grey
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(224, 224, 224, 1),
                            child: Center(
                              child: Text("3",
                                style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),),
                            ),
                          ),
                          SizedBox(height: 9,),
                          Center(
                              child: Text("Summary",
                                style: TextStyle(color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),))
                        ],
                      ),

                    ],
                  ),
                ),
              ),
          ),
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
            SizedBox(height: 10,),
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
                  AppointmentWidget(
                    iconBgColor: Color.fromRGBO(234, 242, 255, 1),
                    icon: Icons.person,
                    color: Color.fromRGBO(34, 124, 255, 1),
                    text: "In Person",
                    index: 0,
                    isSelected: selectedAppointmentType==0,
                    onTap: (){
                      setState(() {
                        selectedAppointmentType=0;
                      });
                    },
                  ),
                  Divider(),
                  AppointmentWidget(
                    iconBgColor: Color.fromRGBO(234, 242, 255, 1),
                    icon: Icons.video_call,
                    color: Color.fromRGBO(34, 197, 94, 1),
                    text: "Video Call",
                    index: 1,
                    isSelected: selectedAppointmentType==1,
                    onTap: (){
                      setState(() {
                        selectedAppointmentType=1;
                      });
                    },
                  ),
                  Divider(),
                  AppointmentWidget(
                    iconBgColor: Color.fromRGBO(253, 253, 255, 1),
                    icon: Icons.phone,
                    color: Color.fromRGBO(255, 76, 94, 1),
                    text: "Phone Call",
                    index: 2,
                    isSelected: selectedAppointmentType==2,
                    onTap: (){
                      setState(() {
                        selectedAppointmentType=2;
                      });
                    },
                  )
                ],
              ),
            ),
            InkWell(
              onTap: (){
                print("Date: $selectedDate, Time: $selectedTime, Type: $selectedAppointmentType");
                if (selectedDate==null||selectedTime==null||selectedAppointmentType==-1){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please select date , time and appointment type")),
                  );
                  return;
                }
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen(
                  doctor: widget.doctor,
                  imagePath: widget.imagePath,
                  selectedDate: selectedDate,
                  selectedTime: selectedTime,
                  selectedAppointmentType: selectedAppointmentType,
                )));
              },
              child: Container(
                width: 327,
                height: 52,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(36, 124, 255, 1),
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: Text("Continue",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),

          ]
            ),

        ),
      );
  }
}
