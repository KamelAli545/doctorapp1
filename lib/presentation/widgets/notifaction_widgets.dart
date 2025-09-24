import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotifactionWidgets extends StatefulWidget {
  String notificationtype;
  String description;
  IconData icons;
   String time;

   NotifactionWidgets({super.key,
     required this.time,
     required this.icons,
     required this.description,
     required this.notificationtype,
     });

  @override
  State<NotifactionWidgets> createState() => _NotifactionWidgetsState();
}

class _NotifactionWidgetsState extends State<NotifactionWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        height: 100,
        width: 500,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Icon(
                widget.icons,
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.notificationtype,
                style: TextStyle(
                   color:Color.fromRGBO(36, 36, 36, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),),
                Text(widget.description,
                  style: TextStyle(
                      color:Color.fromRGBO(117, 117, 117, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Text(widget.time,
              style: TextStyle(
                fontWeight:FontWeight.w400,
                fontSize: 10,
                color: Color.fromRGBO(158, 158, 158, 1)
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
