import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/data/doctor_model.dart';
import 'package:untitled/presentation/screens/reschedule_screen.dart';

class MyAppointmentWidget extends StatefulWidget {
  String name;
  String description;
  String hostpial;
  final DateTime? selectedDate;
  final String? selectedTime;
  final int? selectedAppointmentType;
  final int? selectedPayment;
  final int? selectedCard;
  final DoctorModel? doctor;
  final String imagePath;

  MyAppointmentWidget({super.key,
    required this.name,
    required this.description,
    required this.hostpial,
    required this.imagePath,
    this.selectedDate,
    this.selectedTime,
    this.selectedAppointmentType,
    this.selectedPayment,
    this.selectedCard,
     required this.doctor,
  });

  @override
  State<MyAppointmentWidget> createState() => _NotifactionWidgetsState();
}

class _NotifactionWidgetsState extends State<MyAppointmentWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 181,
        width: double.maxFinite,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0,left: 20,top: 20),
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
                        ],
                      ),
                      Row(
                        children: [
                          Text(widget.selectedDate!=null?"${widget.selectedDate!.toLocal()}".split("")[0]:"No Date Selected",
                            style: TextStyle(
                                fontWeight:FontWeight.w400,
                                fontSize: 10,
                                color: Color.fromRGBO(158, 158, 158, 1)
                            ),),
                          SizedBox(width: 5,),
                          Text("|",
                          ),
                          SizedBox(width: 5,),
                          Text((widget.selectedTime??"no time selected")
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 38,
                  width: 148,
                  decoration:BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Color.fromRGBO(36, 124, 255, 1))
                  ),
                  child: Center(
                    child: Text("Cancel Appointment",
                      style:
                      TextStyle(
                        color: Color.fromRGBO(36, 124, 255, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RescheduleScreen(
                      selectedDate: widget.selectedDate,
                      selectedTime: widget.selectedTime,
                      selectedAppointmentType: widget.selectedAppointmentType,
                      selectedPayment: widget.selectedPayment,
                      selectedCard: widget.selectedCard,
                      doctor: widget.doctor!,
                      imagePath: widget.imagePath,

                    )));
                  },
                  child: Container(
                    height: 38,
                    width: 148,
                    decoration:BoxDecoration(
                        color: Color.fromRGBO(36, 124, 255, 1),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Color.fromRGBO(36, 124, 255, 1))
                    ),
                    child: Center(
                      child: Text("Reschedule",
                        style:
                        TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                )
              ],
            ),

          ],

        ),
      );
  }
}
