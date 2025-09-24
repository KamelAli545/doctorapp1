import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  String title;
   ButtonWidget({super.key,required this.title});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12,left: 12),
      child: Container(
      width: 327,
      height: 52,
      decoration: BoxDecoration(
      color: Color.fromRGBO(36, 124, 255, 1),
      borderRadius: BorderRadius.circular(24)),
      child: Center(
      child: Text(widget.title,
      style: TextStyle(color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600)),
      ),
      ),
    );
  }
}
