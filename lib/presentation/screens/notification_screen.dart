import 'package:untitled/presentation/widgets/notifaction_widgets.dart';
import 'package:untitled/presentation/widgets/upper_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:
      UpperBar(title: "Notification",
        trailing: Container(
          width: 51,
          height: 27,
          decoration: BoxDecoration(color: Color.fromRGBO(36, 124, 255, 1),
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text("2 NEW",
              style: TextStyle(color: Colors.white,
                  fontSize: 13),),
          ),) ,),),
      body: SingleChildScrollView(
        child:
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        children: [
           SizedBox(
             height: 19,
             width: 327,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("Today",
                 style: TextStyle(color: Color.fromRGBO(158, 158, 158, 1)),
                   ),
               Spacer(),
               Text("Mark all as read",
                 style: TextStyle(fontWeight: FontWeight.w400,
                 fontSize: 12,color: Color.fromRGBO(36, 124, 255, 1)),)
             ],
             ),
           ),
          SizedBox(height: 10,),
          NotifactionWidgets(
            icons: Icons.calendar_month,
            description: " Congratulations - your appointment is\n confirmed! We're looking forward to meeting\n with you and helping you achieve your goals.",
            notificationtype: "Appointment Success ",
            time: "1h",
          ),
          SizedBox(height: 20,),
          NotifactionWidgets(
              time: "5h",
              icons: Icons.calendar_month_outlined,
              description: "You have successfully changed your \nappointment with Dr. Randy Wigham. Don’t \nforget to active your reminder.",
              notificationtype: "Schedule Changed"
          ),
          SizedBox(height: 20,),

          NotifactionWidgets(
              time: "7h",
              icons: Icons.video_call_outlined,
              description: "We'll send you a link to join the call at the \nbooking details, so all you need is \ncomputer or mobile device with a camera \nand an internet connection.",
              notificationtype: "Video Call Appointment"
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Text("Yesterday",
                  style: TextStyle(color: Color.fromRGBO(158, 158, 158, 1)),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          NotifactionWidgets(
              time: "1d",
              icons: Icons.cancel_outlined,
              description: "You have successfully canceled your \nappointment  with Dr. Randy Wigham. 50% of \nthe funds will be returned to your account.",
              notificationtype: "Appointment Cancelled "
          ),
          SizedBox(height: 20,),
          NotifactionWidgets(
              time: "1d",
              icons: Icons.payment,
              description: "Your payment has been successfully linked \nwith Docdoc.",
              notificationtype: "New Payment Added! "
          ),
        ],
      ),
    ),


    )
    );
  }
}
