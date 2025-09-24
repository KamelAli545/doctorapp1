import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFilledWidget extends StatefulWidget {
  TextEditingController controller;
  String hintTxt;
  TextInputType keyType;
  Widget ?  suffxIcon;
  bool? obscureText;

  TextFormFilledWidget(
      {super.key,
        required this.controller,
        required this.hintTxt,
        required this.keyType,
        this.obscureText,
        this.suffxIcon});

  @override
  State<TextFormFilledWidget> createState() => _TextFormFilledWidgetState();
}

class _TextFormFilledWidgetState extends State<TextFormFilledWidget> {


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: TextFormField(
        controller: widget.controller,
        cursorColor: Colors.black,
        style: TextStyle(
          color: Colors.black
        ),
        obscureText: widget.obscureText??false,
        decoration: InputDecoration(
           border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(12),
             borderSide: BorderSide(
               color: Color.fromRGBO(194, 194, 194, 1)
             ),
           ),
          hintText:  widget.hintTxt,
          filled: true,
          fillColor: Color.fromRGBO(253, 253, 255, 1),
            hintStyle: TextStyle(
            color: Color.fromRGBO(194, 194, 194, 1),
              fontWeight: FontWeight.w500,
               fontSize: 14,
        ),
          suffixIcon: widget.suffxIcon
        ),
        keyboardType: widget.keyType,
      ),

    );
  }
}
