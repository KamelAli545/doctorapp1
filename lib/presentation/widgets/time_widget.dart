
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeWidget extends StatefulWidget {
  final Function(String) onTimeSelected;
  final String? selectedTime;
   TimeWidget({super.key,required this.onTimeSelected,this.selectedTime});

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  final List<String> timeSlots3 = [
    "08:00 AM", "08:30 AM",
    "09:00 AM", "09:30 AM",
    "10:00 AM", "10:30 AM",
    "11:00 AM", "11:30 AM",
    "12:00 PM", "12:30 PM",
    "01:00 PM", "01:30 PM",
    "02:00 PM", "02:30 PM",
    "03:00 PM", "03:30 PM",
    "04:00 PM", "04:30 PM",
    "05:00 PM", "05:30 PM",
    "06:00 PM", "06:30 PM",
    "07:00 PM", "07:30 PM",
    "08:00 PM", "08:30 PM",
  ];
  String? selectedTime;
  @override
  void initState() {
    super.initState();
    selectedTime = widget.selectedTime;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return
      SizedBox(
        height: 219,
        width: 327,
        child: GridView.builder(
          itemCount: timeSlots3.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            mainAxisSpacing:size.height*0.02,
            crossAxisSpacing: size.width*0.05,
            childAspectRatio: 3
          ),
          itemBuilder:  (context, index) {
            final time = timeSlots3[index];
            final isSelected = time == selectedTime;
            return Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedTime = time;

                        });
                        widget.onTimeSelected(time);
                      },
                      child: Container(
                                      width: 150,
                                      height: 49,
                                      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            shape: BoxShape.rectangle,
            color: isSelected?Color.fromRGBO(36, 124, 255, 1):Color.fromRGBO(242, 244, 247, 1)
            ),
                                      child: Center(
                                        child:   Text(time,
                                          style:TextStyle(
                                            color: isSelected?Color.fromRGBO(255, 255, 255, 1):Color.fromRGBO(194, 194, 194, 1)),
                                        ),
                                      ),
                                    ),
                    ),
                  ],
                );

          },
        ),
      );

  }
}
